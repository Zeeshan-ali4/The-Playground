// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:noavant/features/profile/profile_repo.dart';
// import 'package:noavant/features/profile/profile_states.dart';

// class ProfileCubit extends Cubit<ProfileState> {
//   final ProfileRepo profileRepo;

//   ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

//   // Fetch user profile using the repository
//   Future<void> fetchUserProfile(String uid) async {
//     try {
//       emit(ProfileLoading());
//       final user = await profileRepo.fetchUserProfile(uid);

//       if (user != null) {
//         emit(ProfileLoaded(user));
//       } else {
//         emit(ProfileError('User not found'));
//       }
//     } catch (e) {
//       emit(ProfileError('Failed to fetch profile: $e'));
//     }
//   }

//   // Update bio and/or profile picture
//   Future<void> updateProfile({
//     required String uid,
//     String? newBio,
//     String? newProfileImageUrl,
//   }) async {
//     emit(ProfileLoading());

//     try {
//       // Fetch the current user profile first
//       final currentUser = await profileRepo.fetchUserProfile(uid);

//       if (currentUser == null) {
//         emit(ProfileError('Failed to fetch user profile for update'));
//         return;
//       }

//       // Create an updated profile object
//       final updatedProfile = currentUser.copyWith(
//         newBio: newBio ?? currentUser.bio,
//         newProfileImageUrl: newProfileImageUrl ?? currentUser.profileImageUrl,
//       );

//       // Update the profile in the repository
//       await profileRepo.updateProfile(updatedProfile);

//       // Re-fetch the updated profile to reflect changes
//       await fetchUserProfile(uid);
//     } catch (e) {
//       emit(ProfileError('Error updating profile: $e'));
//     }
//   }
// }
