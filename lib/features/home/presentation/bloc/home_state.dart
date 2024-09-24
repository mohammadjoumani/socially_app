part of 'home_bloc.dart';

class HomeState {
  final GenericDataState getPostsDataState;
  final GenericDataState getStoriesDataState;
  final List<PostModel> posts;
  final List<StoryModel> stories;
  final Failure? failure;

  HomeState({
    this.getPostsDataState = GenericDataState.initial,
    this.getStoriesDataState = GenericDataState.initial,
    this.posts = const [],
    this.stories = const [],
    this.failure,
  });

  HomeState copyWith({
    GenericDataState? getPostsDataState,
    GenericDataState? getStoriesDataState,
    List<PostModel>? posts,
    List<StoryModel>? stories,
    Failure? failure,
  }) {
    return HomeState(
      getPostsDataState: getPostsDataState ?? this.getPostsDataState,
      getStoriesDataState: getStoriesDataState ?? this.getStoriesDataState,
      posts: posts ?? this.posts,
      stories: stories ?? this.stories,
      failure: failure ?? this.failure,
    );
  }
}
