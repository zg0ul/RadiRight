import 'package:freezed_annotation/freezed_annotation.dart';
import '../../../../shared/domain/models/user.dart';

part 'auth_state.freezed.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState.initial() = _Initial;
  const factory AuthState.loading() = _Loading;
  const factory AuthState.authenticated(AppUser user) = _Authenticated;
  const factory AuthState.unauthenticated() = _Unauthenticated;
  const factory AuthState.error(String message) = _Error;

  bool get isAuthenticated => maybeMap(
        authenticated: (_) => true,
        orElse: () => false,
      );

  bool get isLoading => maybeMap(
        loading: (_) => true,
        orElse: () => false,
      );

  AppUser? get user => maybeMap(
        authenticated: (state) => state.user,
        orElse: () => null,
      );
}
