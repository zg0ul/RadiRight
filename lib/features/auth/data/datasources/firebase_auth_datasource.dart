import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/domain/models/user.dart';
import 'auth_datasource.dart';

part 'firebase_auth_datasource.g.dart';

@riverpod
FirebaseAuthDatasource firebaseAuthDatasource(FirebaseAuthDatasourceRef ref) {
  return FirebaseAuthDatasource(FirebaseAuth.instance);
}

class FirebaseAuthDatasource implements AuthDatasource {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthDatasource(this._firebaseAuth);

  @override
  Stream<AppUser?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((user) {
      if (user == null) return null;
      return AppUser.fromFirebaseUser(user);
    });
  }

  @override
  Future<AppUser?> get currentUser async {
    final user = _firebaseAuth.currentUser;
    if (user == null) return null;
    return AppUser.fromFirebaseUser(user);
  }

  @override
  Future<AppUser> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final credential = await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user == null) {
      throw Exception('Sign in failed');
    }
    return AppUser.fromFirebaseUser(credential.user!);
  }

  @override
  Future<AppUser> registerWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    final credential = await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (credential.user == null) {
      throw Exception('Registration failed');
    }
    if (name != null) {
      await credential.user!.updateDisplayName(name);
    }
    return AppUser.fromFirebaseUser(credential.user!);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> sendPasswordResetEmail(String email) async {
    await _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<void> updateProfile({
    String? name,
    String? photoUrl,
  }) async {
    final user = _firebaseAuth.currentUser;
    if (user == null) {
      throw Exception('No user logged in');
    }
    if (name != null) {
      await user.updateDisplayName(name);
    }
    if (photoUrl != null) {
      await user.updatePhotoURL(photoUrl);
    }
  }
}
