import 'dart:math';

import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/network/failure.dart';
import 'package:socially_app/core/utils/state_render/generic_data_state.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/comment/domain/entity/comment.dart';
import 'package:socially_app/features/comment/domain/use_cases/get_comments_use_case.dart';

part 'comments_event.dart';

part 'comments_state.dart';

class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final GetCommentsUseCase _getCommentsUseCase;

  CommentsBloc(this._getCommentsUseCase) : super(CommentsState()) {
    on<GetCommentsEvent>(_mapGetComments);
    on<AddCommentEvent>(_mapAddComment);
  }

  _mapGetComments(GetCommentsEvent event, Emitter<CommentsState> emit) {
    emit(state.copyWith(getCommentsDataState: GenericDataState.loading));
    final result = _getCommentsUseCase.call(unit);
    emit(state.copyWith(getCommentsDataState: GenericDataState.success, comments: result));
  }

  _mapAddComment(AddCommentEvent event, Emitter<CommentsState> emit) {
    emit(state.copyWith(getCommentsDataState: GenericDataState.loading));
    final random = Random();
    final newComment = Comment(
      id: random.nextInt(100),
      user: createSampleUser('Mohammad', 'Joumani'),
      contentComment: event.contentComment,
      dateTime: DateTime.now().toString(),
      numberOfLikes: 0,
      isLiked: false,
    );

    emit(state.copyWith(getCommentsDataState: GenericDataState.success, comments: [newComment, ...state.comments]));
  }
}
