import 'package:flutter/material.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/features/auth/di/auth_di.dart';
import 'package:socially_app/features/auth/presentation/login/view/login_view.dart';
import 'package:socially_app/features/comment/presentation/view/comments_view.dart';
import 'package:socially_app/features/generic/presentation/on_boarding/view/on_boarding_view.dart';
import 'package:socially_app/features/generic/presentation/splash/view/splash_view.dart';
import 'package:socially_app/features/nav_bar/presentation/view/nav_bar_view.dart';
import 'string_manager.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onboardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String navBarRoute = "/nav_bar";
  static const String commentsRoute = "/comments";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onboardingRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.navBarRoute:
        return MaterialPageRoute(builder: (_) => const NavBarView());
      case Routes.commentsRoute:
        return MaterialPageRoute(builder: (_) => const CommentsView());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (context) => Scaffold(
        appBar: AppBar(
          title: Text(AppStrings.strNoRouteFound.tr(context)),
        ),
        body: Center(
          child: Text(
            AppStrings.strNoRouteFound.tr(context),
            style: const TextStyle(
              color: Color(0xFFA0A0A0),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              height: 0,
            ),
          ),
        ),
      ),
    );
  }
}
