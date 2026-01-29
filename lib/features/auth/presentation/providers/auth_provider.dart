import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../../shared/domain/models/user.dart';
import '../../data/repositories/auth_repository.dart';

part 'auth_provider.g.dart';

@riverpod
class AuthNotifier extends _$AuthNotifier {
  @override
  Stream<AppUser?> build() {
    return ref.watch(authRepositoryProvider).authStateChanges;
  }

  Future<void> signIn({
    required String email,
    required String password,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signIn(email: email, password: password);
  }

  Future<String> register({
    required String email,
    required String password,
    String? name,
  }) async {
    final repository = ref.read(authRepositoryProvider);
    final result = await repository.register(
      email: email,
      password: password,
      name: name,
    );

    return result.fold(
      (error) => throw Exception(error.displayMessage),
      (user) => user.id,
    );
  }

  Future<void> signOut() async {
    final repository = ref.read(authRepositoryProvider);
    await repository.signOut();
  }

  Future<void> sendPasswordResetEmail(String email) async {
    final repository = ref.read(authRepositoryProvider);
    await repository.sendPasswordResetEmail(email);
  }
}

@riverpod
class AuthFormState extends _$AuthFormState {
  @override
  AuthFormData build() {
    return const AuthFormData();
  }

  void setEmail(String email) {
    state = state.copyWith(email: email);
  }

  void setPassword(String password) {
    state = state.copyWith(password: password);
  }

  void setConfirmPassword(String confirmPassword) {
    state = state.copyWith(confirmPassword: confirmPassword);
  }

  void setName(String name) {
    state = state.copyWith(name: name);
  }

  void setLoading(bool loading) {
    state = state.copyWith(isLoading: loading);
  }

  void setError(String? error) {
    state = state.copyWith(error: error);
  }

  void reset() {
    state = const AuthFormData();
  }

  bool validateLogin() {
    if (state.email.isEmpty || !state.email.contains('@')) {
      setError('Please enter a valid email');
      return false;
    }
    if (state.password.length < 6) {
      setError('Password must be at least 6 characters');
      return false;
    }
    setError(null);
    return true;
  }

  bool validateRegister() {
    if (state.name.isEmpty) {
      setError('Please enter your name');
      return false;
    }
    if (state.email.isEmpty || !state.email.contains('@')) {
      setError('Please enter a valid email');
      return false;
    }
    if (state.password.length < 6) {
      setError('Password must be at least 6 characters');
      return false;
    }
    if (state.password != state.confirmPassword) {
      setError('Passwords do not match');
      return false;
    }
    setError(null);
    return true;
  }
}

class AuthFormData {
  final String email;
  final String password;
  final String confirmPassword;
  final String name;
  final bool isLoading;
  final String? error;

  const AuthFormData({
    this.email = '',
    this.password = '',
    this.confirmPassword = '',
    this.name = '',
    this.isLoading = false,
    this.error,
  });

  AuthFormData copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    String? name,
    bool? isLoading,
    String? error,
  }) {
    return AuthFormData(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }
}
