import 'package:noavant/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {

  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.bio,
    required this.profileImageUrl,
  });

  // method to update profile user
  ProfileUser copyWith({String? newBio, String? newProfileImageUrl}) {
    return ProfileUser(
      uid: uid,
      email: email,
      name: name,
      bio: newBio ?? bio,
      profileImageUrl: newProfileImageUrl ?? profileImageUrl,
    );
  }

  // convert profile user to json
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'profileImageUrl': profileImageUrl,
    };
  }

  // convert json to profile user
  factory ProfileUser.fromJson(Map<String, dynamic> jsonUser) {
    return ProfileUser(
      uid: jsonUser['uid'],
      email: jsonUser['email'],
      name: jsonUser['name'],
      bio: jsonUser['bio'] ?? '',
      profileImageUrl: jsonUser['profileImageUrl'] ?? '',
    );
  }

}