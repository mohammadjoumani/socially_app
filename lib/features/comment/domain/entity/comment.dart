import 'package:socially_app/features/auth/domain/entities/user.dart';

class Comment {
  int id;
  User user;
  String contentComment;
  String dateTime;
  int numberOfLikes;
  bool isLiked;
  List<ReplyComment> replies;
  bool isVisibleReplies = false;

  Comment({
    required this.id,
    required this.user,
    required this.contentComment,
    required this.dateTime,
    required this.numberOfLikes,
    required this.isLiked,
    this.replies = const [],
  });
}

class ReplyComment {
  User user;
  String replyComment;

  ReplyComment({required this.user, required this.replyComment});
}
