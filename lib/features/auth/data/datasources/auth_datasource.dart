import '../../../../shared/domain/models/user.dart';

abstract class AuthDatasource {
  Stream<AppUser?> get authStateChanges;

  Future<AppUser?> get currentUser;

  Future<AppUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<AppUser> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });

  Future<void> signOut();

  Future<void> sendPasswordResetEmail(String email);

  Future<void> updateProfile({
    String? name,
    String? photoUrl,
  });
}
