import 'package:flutter/material.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/core/utils/resource/theme_manager.dart';

abstract class MainColorInterface {
  Color get colorPrimary;

  Color get colorSecondary;

  Color get colorBackgroundScaffold;

  Color get colorBackgroundCard;

  Color get colorOnPrimary;

  Color get colorOnSecondary;

  Color get colorOnBackgroundScaffold;

  Color get colorOnBackgroundCard;

  Color get colorError;

  Color get colorOnError;
}

class AppColor {
  final List<MainColorInterface> _mainColors;
  final AppPreferences _appPref;
  int index = 0;

  AppColor(this._mainColors, this._appPref) {
    updateAppStyle();
  }

  void updateAppStyle() {
    final themeMap = {
      ThemeApp.light: 0,
      ThemeApp.dark: 1,
    };
    index = themeMap[ThemeApp.light] ?? 0;
  }

  Color get getColorPrimary => _mainColors[index].colorPrimary;

  Color get getColorSecondary => _mainColors[index].colorSecondary;

  Color get getColorBackgroundScaffold => _mainColors[index].colorBackgroundScaffold;

  Color get getColorBackgroundCard => _mainColors[index].colorBackgroundCard;

  Color get getColorOnPrimary => _mainColors[index].colorOnPrimary;

  Color get getColorOnSecondary => _mainColors[index].colorOnSecondary;

  Color get getColorOnBackgroundScaffold => _mainColors[index].colorOnBackgroundScaffold;

  Color get getColorOnBackgroundCard => _mainColors[index].colorOnBackgroundCard;

  Color get getColorError => _mainColors[index].colorError;

  Color get getColorOnError => _mainColors[index].colorOnError;
}
