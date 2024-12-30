
/*

Auth Cubit: State Management

*/

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noavant/features/auth/domain/entities/app_user.dart';
import 'package:noavant/features/auth/domain/repos/auth_repo.dart';
import 'package:noavant/features/auth/presentation/cubits/auth_states.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepo authRepo;
  AppUser? _currentUser;

  AuthCubit({required this.authRepo}) : super(AuthInitial());

  // check if user is authenticated
  void checkAuth() async{
    final AppUser? user = await authRepo.getCurrentUser();

    if (user != null) {
      _currentUser = user;
      emit(Authenticated(user));
    } else {
      emit(Unauthenticated());
    }
  }

  // get current user
  AppUser? get currentUser => _currentUser;

  // login
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
      emit(AuthError(e.toString()));
      emit(Unauthenticated());
    }
  }


  // register

  Future<void> register(String email, String pw, String name) async {
    print("Attempting to register user...");
    print("Email: $email, Password: $pw");

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
  
  // logout

  Future<void> logout() async {
    try {
      await authRepo.logout();
      _currentUser = null;
      emit(Unauthenticated());
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}