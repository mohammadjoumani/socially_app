import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/features/nav_bar/presentation/bloc/nav_bar_bloc.dart';

import 'widgets/custom_bottom_navigation.dart';
import 'widgets/nav_bar_view_body.dart';

class NavBarView extends StatefulWidget {
  const NavBarView({super.key});

  @override
  State<NavBarView> createState() => _NavBarViewState();
}

class _NavBarViewState extends State<NavBarView> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavBarBloc(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        body: NavBarViewBody(),
        bottomNavigationBar: CustomBottomNavigation(),
      ),
    );
  }
}
