part of 'main_bloc.dart';

abstract class MainEvent {}

class ChangeLanguageToArabicEvent extends MainEvent {}

class ChangeLanguageToEnglishEvent extends MainEvent {}

class ChangeLanguageAppEvent extends MainEvent {}

class ChangeThemeToDarkEvent extends MainEvent {}

class ChangeThemeToLightEvent extends MainEvent {}

class ChangeThemeAppEvent extends MainEvent {}

//region Change Font Scale

class ChangeFontSizeAppEvent extends MainEvent {
  final FontSizeAppEnum fontSizeApp;

  ChangeFontSizeAppEvent(this.fontSizeApp);
}

class ChangeFontSizeAppToSmallEvent extends MainEvent {}

class ChangeFontSizeAppToMediumEvent extends MainEvent {}

class ChangeFontSizeAppToLargeEvent extends MainEvent {}

//endregion
