part of 'comments_bloc.dart';

sealed class CommentsEvent {}

class GetCommentsEvent extends CommentsEvent {}

class AddCommentEvent extends CommentsEvent {
  final String contentComment;

  AddCommentEvent({required this.contentComment});
}
