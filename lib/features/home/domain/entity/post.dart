import 'package:socially_app/features/auth/domain/entities/user.dart';

class PostModel {
  int id;
  User user;
  String textContentPost;
  String dateTime;
  int numberOfLikes;
  int numberOfComments;
  bool isLiked;
  bool isSaved;
  List<String> images;
  bool isSlider;

  PostModel({
    required this.id,
    required this.user,
    required this.textContentPost,
    required this.dateTime,
    required this.numberOfLikes,
    required this.numberOfComments,
    required this.isLiked,
    required this.isSaved,
    required this.images,
    this.isSlider = false,
  });
}
