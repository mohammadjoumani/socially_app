part of 'nav_bar_bloc.dart';

sealed class NavBarEvent {}

class ChangeNavBarIndexEvent extends NavBarEvent {
  final int index;

  ChangeNavBarIndexEvent({required this.index});
}

class ClearNavBarEvent extends NavBarEvent {}
