/*


Auth repository - Outlines the possible auth operations for this app


*/

import 'package:noavant/features/auth/domain/entities/app_user.dart';

abstract class AuthRepo {
  Future<AppUser?> loginWithEmailAndPassword(String email,  String password);
  Future<AppUser?> registerWithEmailAndPassword(
    String email, String password, String name);
  Future<void> logout();
  Future<AppUser?> getCurrentUser();
}