part of 'nav_bar_bloc.dart';

class NavBarState {
  final int index;
  List<Widget> pages = [
    const HomeView(),
    const SizedBox(),
    const SizedBox(),
  ];

  NavBarState({
    this.index = 0,
  });

  NavBarState copyWith({
    int? index,
  }) {
    return NavBarState(
      index: index ?? this.index,
    );
  }
}
