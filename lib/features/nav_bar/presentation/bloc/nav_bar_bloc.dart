import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:socially_app/features/home/presentation/view/home_view.dart';

part 'nav_bar_state.dart';

part 'nav_bar_event.dart';

class NavBarBloc extends Bloc<NavBarEvent, NavBarState> {
  NavBarBloc() : super(NavBarState()) {
    on<ChangeNavBarIndexEvent>(_mapChangeNavBarIndex);
    on<ClearNavBarEvent>(_mapClearNavBar);
  }

  _mapChangeNavBarIndex(ChangeNavBarIndexEvent event, Emitter<NavBarState> emit) async {
    emit(state.copyWith(index: event.index));
  }

  _mapClearNavBar(ClearNavBarEvent event, Emitter<NavBarState> emit) async {
    emit(state.copyWith(index: 0));
  }
}
