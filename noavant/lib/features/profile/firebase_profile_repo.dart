

// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:noavant/features/profile/profile_user.dart';
// import 'package:noavant/features/profile/profile_repo.dart';

// class FirebaseProfileRepo implements ProfileRepo {
//   final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//   @override
//   Future<ProfileUser?> fetchUserProfile(String uid) async {
//     try {
//       // get user document from firestore
//       final userDoc = await firebaseFirestore.collection('users').doc(uid).get();

//       // if user document exists
//       if (userDoc.exists) {
//         final userData = userDoc.data();

//         if (userData != null) {
//           return ProfileUser(
//             uid: uid,
//             email: userData['email'],
//             name: userData['name'],
//             bio: userData['bio'] ?? '',
//             profileImageUrl: userData['profileImageUrl'].toString(),
//           );
//         }
//       }
      
//       return null;
//     } catch (e) {
//       return null;
//     }
//   }

//   @override
//   Future<void> updateProfile(ProfileUser updatedProfile) async {
//     try {

//       // convert updated profile to json
//       await firebaseFirestore
//           .collection('users')
//           .doc(updatedProfile.uid)
//           .update({
//         'bio': updatedProfile.bio, 
//         'profileImageUrl': updatedProfile.profileImageUrl
//       });
//     } catch (e) {
//       throw Exception(e);
//     }
//   }
// }