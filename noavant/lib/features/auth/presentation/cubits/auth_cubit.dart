import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/domain/entities/app_user.dart';
import 'package:noavant/features/auth/domain/repos/auth_repo.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // Check if the user is authenticated
  void checkAuth() async {
    try {
      final AppUser? user = await authRepo.getCurrentUser();
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError("Failed to check authentication: ${e.toString()}"));
    }
  }

  // Get current user
  AppUser? get currentUser => _currentUser;

  // Login
  Future<void> login(String email, String pw) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.loginWithEmailAndPassword(email, pw);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError("Login failed: ${e.toString()}"));
      emit(Unauthenticated());
    }
  }

  // Register
  Future<void> register(String email, String pw, String name) async {
    try {
      emit(AuthLoading());
      final user = await authRepo.registerWithEmailAndPassword(email, pw, name);
      if (user != null) {
        _currentUser = user;
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    } catch (e) {
      emit(AuthError("Registration failed: ${e.toString()}"));
      emit(Unauthenticated());
    }
  }

  // Logout
  Future<void> logout() async {
    try {
      await authRepo.logout();
      _currentUser = null;
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError("Logout failed: ${e.toString()}"));
    }
  }
}
