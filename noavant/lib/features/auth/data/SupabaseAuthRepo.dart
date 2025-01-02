import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:noavant/features/auth/domain/entities/app_user.dart';
import 'package:noavant/features/auth/domain/repos/auth_repo.dart';

class SupabaseAuthRepo implements AuthRepo {
  final SupabaseClient supabaseClient = Supabase.instance.client;

  @override
  Future<AppUser?> loginWithEmailAndPassword(String email, String password) async {
    final response = await supabaseClient.auth.signInWithPassword(email: email, password: password);

    if (response.user == null) {
      throw Exception('Login failed');
    }

    return AppUser(
      uid: response.user!.id,
      email: response.user!.email!,
      name: '', // Add logic to fetch/display name if required
    );
  }

  @override
  Future<AppUser?> registerWithEmailAndPassword(String email, String password, String name) async {
    final response = await supabaseClient.auth.signUp(email: email, password: password);

    if (response.user == null) {
      throw Exception('Registration failed');
    }

    // Optionally save additional user details in Supabase
    await supabaseClient
        .from('profiles')
        .insert({'id': response.user!.id, 'email': email, 'name': name});

    return AppUser(
      uid: response.user!.id,
      email: email,
      name: name,
    );
  }

  @override
  Future<void> logout() async {
    await supabaseClient.auth.signOut();
  }

  @override
  Future<AppUser?> getCurrentUser() async {
    final user = supabaseClient.auth.currentUser;

    if (user == null) {
      return null;
    }

    // Optionally fetch additional user data from Supabase
    final profile = await supabaseClient
        .from('profiles')
        .select()
        .eq('id', user.id)
        .single();

    return AppUser(
      uid: user.id,
      email: user.email!,
      name: profile['name'] ?? '',
    );
  }
}