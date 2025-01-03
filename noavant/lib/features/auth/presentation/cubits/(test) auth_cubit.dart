// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:noavant/features/auth/domain/entities/app_user.dart';
// import 'package:noavant/features/auth/domain/repos/auth_repo.dart';
// import 'package:noavant/features/auth/presentation/cubits/auth_states.dart';

// class AuthCubit extends Cubit<AuthState> {
//   final AuthRepo authRepo;
//   AppUser? _currentUser;

//   AuthCubit({required this.authRepo}) : super(Unauthenticated()); // Initial state is Unauthenticated

//   // Check if the user is authenticated
//   Future<void> checkAuth() async {
//     emit(AuthLoading()); // Emit loading state during the check
//     try {
//       final AppUser? user = await authRepo.getCurrentUser();
//       if (user != null) {
//         _currentUser = user;
//         emit(Authenticated(user));
//       } else {
//         emit(Unauthenticated());
//       }
//     } catch (e) {
//       emit(AuthError("Failed to check authentication: ${e.toString()}"));
//       emit(Unauthenticated());
//     }
//   }

//   // Get current user
//   AppUser? get currentUser => _currentUser;

//   // Login
//   Future<void> login(String email, String password) async {
//     emit(AuthLoading());
//     try {
//       final user = await authRepo.loginWithEmailAndPassword(email, password);
//       if (user != null) {
//         _currentUser = user;
//         emit(Authenticated(user));
//       } else {
//         emit(Unauthenticated());
//       }
//     } catch (e) {
//       emit(AuthError("Login failed: ${e.toString()}"));
//       emit(Unauthenticated());
//     }
//   }

//   // Register
//   Future<void> register(String email, String password, String name) async {
//     emit(AuthLoading());
//     try {
//       final user = await authRepo.registerWithEmailAndPassword(email, password, name);
//       if (user != null) {
//         _currentUser = user;
//         emit(Authenticated(user));
//       } else {
//         emit(Unauthenticated());
//       }
//     } catch (e) {
//       emit(AuthError("Registration failed: ${e.toString()}"));
//       emit(Unauthenticated());
//     }
//   }

//   // Logout
//   Future<void> logout() async {
//     emit(AuthLoading());
//     try {
//       await authRepo.logout();
//       _currentUser = null;
//       emit(Unauthenticated());
//     } catch (e) {
//       emit(AuthError("Logout failed: ${e.toString()}"));
//     }
//   }
// }
