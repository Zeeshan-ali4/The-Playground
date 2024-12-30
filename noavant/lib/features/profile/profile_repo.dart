/* 


Profile Repository
Different operations we can do for profiles


*/ 

import 'package:noavant/features/profile/profile_user.dart';

abstract class ProfileRepo {
  Future<ProfileUser?> fetchUserProfile(String uid);
  Future<void> updateProfile(ProfileUser updatedProfile);
}