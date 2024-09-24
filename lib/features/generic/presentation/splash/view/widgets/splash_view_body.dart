import 'package:flutter/material.dart';
import 'package:socially_app/core/app/di.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/core/utils/resource/color/color_manager.dart';
import 'package:socially_app/core/utils/resource/routes_manager.dart';
import 'package:socially_app/core/utils/resource/style_manager.dart';
import 'package:socially_app/core/utils/resource/values_manager.dart';

class SplashViewBody extends StatefulWidget {
  const SplashViewBody({super.key});

  @override
  State<SplashViewBody> createState() => _SplashViewBodyState();
}

class _SplashViewBodyState extends State<SplashViewBody> with SingleTickerProviderStateMixin {
  final AppPreferences _appPref = instance<AppPreferences>();
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );

    _controller.forward();

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _goNext(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p16),
      child: Center(
        child: ScaleTransition(
          scale: _animation,
          child: Text(
            'Socially'.toUpperCase(),
            style: StyleManager.getBoldStyle(
              color: colorPrimary,
              fontSize: AppSize.s44,
            ).copyWith(letterSpacing: 3),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  _goNext(BuildContext context) async {
    if (_appPref.isUserLogged()) {
      Navigator.pushReplacementNamed(context, Routes.navBarRoute);
    } else if (_appPref.isOnBoardingScreenViewed()) {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.onboardingRoute);
    }
  }
}
