import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/network/failure.dart';
import 'package:socially_app/core/utils/state_render/generic_data_state.dart';
import 'package:socially_app/features/home/domain/entity/post.dart';
import 'package:socially_app/features/home/domain/entity/story.dart';
import 'package:socially_app/features/home/domain/use_cases/get_posts_use_case.dart';
import 'package:socially_app/features/home/domain/use_cases/get_stories_use_case.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetPostsUseCase _getPostsUseCase;
  final GetStoriesUseCase _getStoriesUseCase;

  HomeBloc(this._getPostsUseCase, this._getStoriesUseCase) : super(HomeState()) {
    on<GetPostsEvent>(_mapGetPosts);
    on<GetStoriesEvent>(_mapGetStories);
  }

  _mapGetPosts(GetPostsEvent event, Emitter<HomeState> emit) {
    final result = _getPostsUseCase.call(unit);
    emit(state.copyWith(getPostsDataState: GenericDataState.success, posts: result));
  }

  _mapGetStories(GetStoriesEvent event, Emitter<HomeState> emit) {
    final result = _getStoriesUseCase.call(unit);
    emit(state.copyWith(getStoriesDataState: GenericDataState.success, stories: result));
  }
}
