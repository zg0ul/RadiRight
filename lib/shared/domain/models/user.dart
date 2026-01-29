import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';
part 'user.g.dart';

@freezed
class AppUser with _$AppUser {
  const AppUser._();

  const factory AppUser({
    required String id,
    required String email,
    String? name,
    String? photoUrl,
    required DateTime createdAt,
    DateTime? lastLoginAt,
  }) = _AppUser;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);

  factory AppUser.fromFirebaseUser(dynamic firebaseUser) {
    return AppUser(
      id: firebaseUser.uid as String,
      email: firebaseUser.email as String,
      name: firebaseUser.displayName as String?,
      photoUrl: firebaseUser.photoURL as String?,
      createdAt: firebaseUser.metadata.creationTime as DateTime? ?? DateTime.now(),
      lastLoginAt: firebaseUser.metadata.lastSignInTime as DateTime?,
    );
  }
}
