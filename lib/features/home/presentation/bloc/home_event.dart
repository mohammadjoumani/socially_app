part of 'home_bloc.dart';

sealed class HomeEvent {}

class GetPostsEvent extends HomeEvent {}

class GetStoriesEvent extends HomeEvent {}
