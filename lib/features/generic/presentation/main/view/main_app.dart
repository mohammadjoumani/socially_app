import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:socially_app/core/utils/resource/font_manager.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/core/utils/resource/routes_manager.dart';
import 'package:socially_app/core/utils/resource/theme_manager.dart';
import 'package:socially_app/features/generic/presentation/main/bloc/main_bloc.dart';

import 'widgets/main_app_body.dart';

GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MainBloc(),
      child: BlocBuilder<MainBloc, MainState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            navigatorKey: navigatorKey,
            title: 'SehaOne',
            builder: (BuildContext context, Widget? child) {
              return MainAppBody(
                fontSize: state.fontSizeApp?.value ?? FontSizeAppEnum.small.value,
                child: child!,
              );
            },
            locale: state.locale,
            supportedLocales: const [englishLocale, arabicLocale],
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null && deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.splashRoute,
            theme: ThemeAppManager().getThemeData(
              fontFamily: state.locale == arabicLocale ? FontConstants.fontCairo : FontConstants.fontSFPro,
            ),
          );
        },
      ),
    );
  }
}
