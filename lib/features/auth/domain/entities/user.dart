import 'dart:math';

import 'package:socially_app/core/utils/resource/assets_manager.dart';

class User {
  int id;
  String username;
  String email;
  String firstName;
  String lastName;
  String gender;
  String image;

  User(
    this.id,
    this.username,
    this.email,
    this.firstName,
    this.lastName,
    this.gender,
    this.image,
  );
}

User createSampleUser(String firstName, String lastName) {
  final random = Random();
  List<String> sampleImages = [
    AssetsManager.imgUserPlaceHolder,
    AssetsManager.imgProfile1,
    AssetsManager.imgProfile2,
    AssetsManager.imgProfile3,
  ];
  return User(
    0,
    '$firstName $lastName',
    '$firstName@example.com',
    lastName,
    lastName,
    'male',
    sampleImages[random.nextInt(sampleImages.length)], // Assuming User has this field
  );
}
