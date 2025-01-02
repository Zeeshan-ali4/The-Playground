import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:noavant/features/profile/profile_repo.dart';
import 'package:noavant/features/profile/profile_user.dart';

class SupabaseProfileRepo implements ProfileRepo {
  final SupabaseClient supabaseClient;

  SupabaseProfileRepo({required this.supabaseClient});

  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {
      final response = await supabaseClient
          .from('profiles')
          .select()
          .eq('id', uid)
          .single();

      if (response != null) {
        return ProfileUser.fromJson(response);
      } else {
        throw Exception('Failed to fetch user profile: User not found');
      }
    } catch (e) {
      throw Exception('Error fetching profile: $e');
    }
  }

  @override
  Future<void> updateProfile(ProfileUser updatedProfile) async {
    try {
      final response = await supabaseClient
          .from('profiles')
          .update(updatedProfile.toJson())
          .eq('id', updatedProfile.uid);

      if (response.error != null) {
        throw Exception('Failed to update profile: ${response.error?.message}');
      }
    } catch (e) {
      throw Exception('Error updating profile: $e');
    }
  }
}