import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cache_service.g.dart';

@riverpod
CacheService cacheService(CacheServiceRef ref) {
  return CacheService();
}

class CacheService {
  SharedPreferences? _prefs;

  Future<SharedPreferences> get _preferences async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs!;
  }

  Future<void> setString(String key, String value) async {
    final prefs = await _preferences;
    await prefs.setString(key, value);
  }

  Future<String?> getString(String key) async {
    final prefs = await _preferences;
    return prefs.getString(key);
  }

  Future<void> setBool(String key, bool value) async {
    final prefs = await _preferences;
    await prefs.setBool(key, value);
  }

  Future<bool?> getBool(String key) async {
    final prefs = await _preferences;
    return prefs.getBool(key);
  }

  Future<void> setInt(String key, int value) async {
    final prefs = await _preferences;
    await prefs.setInt(key, value);
  }

  Future<int?> getInt(String key) async {
    final prefs = await _preferences;
    return prefs.getInt(key);
  }

  Future<void> setJson(String key, Map<String, dynamic> value) async {
    final prefs = await _preferences;
    await prefs.setString(key, jsonEncode(value));
  }

  Future<Map<String, dynamic>?> getJson(String key) async {
    final prefs = await _preferences;
    final value = prefs.getString(key);
    if (value == null) return null;
    return jsonDecode(value) as Map<String, dynamic>;
  }

  Future<void> remove(String key) async {
    final prefs = await _preferences;
    await prefs.remove(key);
  }

  Future<void> clear() async {
    final prefs = await _preferences;
    await prefs.clear();
  }
}
