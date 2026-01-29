import 'dart:ui';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../services/cache_service.dart';

part 'locale_provider.g.dart';

const String _localeKey = 'app_locale';

@riverpod
class LocaleNotifier extends _$LocaleNotifier {
  @override
  Locale build() {
    _loadSavedLocale();
    return const Locale('en');
  }

  Future<void> _loadSavedLocale() async {
    final cacheService = ref.read(cacheServiceProvider);
    final savedLocale = await cacheService.getString(_localeKey);
    if (savedLocale != null) {
      state = Locale(savedLocale);
    }
  }

  Future<void> setLocale(Locale locale) async {
    final cacheService = ref.read(cacheServiceProvider);
    await cacheService.setString(_localeKey, locale.languageCode);
    state = locale;
  }

  void toggleLocale() {
    final newLocale = state.languageCode == 'en'
        ? const Locale('ar')
        : const Locale('en');
    setLocale(newLocale);
  }

  bool get isArabic => state.languageCode == 'ar';
  bool get isEnglish => state.languageCode == 'en';
}
