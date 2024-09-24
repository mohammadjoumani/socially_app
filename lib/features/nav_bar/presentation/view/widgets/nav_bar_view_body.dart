import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/features/nav_bar/presentation/bloc/nav_bar_bloc.dart';

class NavBarViewBody extends StatelessWidget {
  const NavBarViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavBarBloc, NavBarState>(
      buildWhen: (previous, current) => previous.index != current.index,
      builder: (context, state) {
        return state.pages[state.index];
      },
    );
  }
}
