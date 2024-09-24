part of 'comments_bloc.dart';

class CommentsState {
  final GenericDataState getCommentsDataState;
  final List<Comment> comments;
  final Failure? failure;

  CommentsState({
    this.getCommentsDataState = GenericDataState.initial,
    this.comments = const [],
    this.failure,
  });

  CommentsState copyWith({
    GenericDataState? getCommentsDataState,
    List<Comment>? comments,
    Failure? failure,
  }) {
    return CommentsState(
      getCommentsDataState: getCommentsDataState ?? this.getCommentsDataState,
      comments: comments ?? this.comments,
      failure: failure ?? this.failure,
    );
  }
}
