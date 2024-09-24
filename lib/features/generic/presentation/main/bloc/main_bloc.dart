import 'dart:ui';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:socially_app/core/app/di.dart';
import 'package:socially_app/core/services/app_prefs.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';

part 'main_event.dart';

part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  final AppPreferences _appPref = instance<AppPreferences>();

  MainBloc() : super(MainState()) {
    on<ChangeLanguageToEnglishEvent>(_mapChangeLanguageToEnglish);
    on<ChangeLanguageToArabicEvent>(_mapChangeLanguageToArabic);

    on<ChangeThemeToDarkEvent>(_mapChangeThemeToDark);
    on<ChangeThemeToLightEvent>(_mapChangeThemeToLight);

    on<ChangeFontSizeAppEvent>(_mapChangeFontSizeApp);
    on<ChangeFontSizeAppToSmallEvent>(_mapChangeFontSizeAppToSmall);
    on<ChangeFontSizeAppToMediumEvent>(_mapChangeFontSizeAppToMedium);
    on<ChangeFontSizeAppToLargeEvent>(_mapChangeFontSizeAppToLarge);
  }

  // region Change Language

  _mapChangeLanguageToEnglish(ChangeLanguageToEnglishEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(locale: englishLocale));
    _appPref.setLocale(LanguageType.english.getValue());
  }

  _mapChangeLanguageToArabic(ChangeLanguageToArabicEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(locale: arabicLocale));
    _appPref.setLocale(LanguageType.arabic.getValue());
  }

//endregion

  //region Change Theme

  _mapChangeThemeToDark(ChangeThemeToDarkEvent event, Emitter<MainState> emit) {
    // emit(state.copyWith(locale: arabicLocale));
  }

  _mapChangeThemeToLight(ChangeThemeToLightEvent event, Emitter<MainState> emit) {
    // emit(state.copyWith(locale: englishLocale));
  }

//endregion

  //region Change Font Scale

  _mapChangeFontSizeApp(ChangeFontSizeAppEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(fontSizeApp: event.fontSizeApp));
  }

  _mapChangeFontSizeAppToSmall(ChangeFontSizeAppToSmallEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(fontSizeApp: FontSizeAppEnum.small));
    _appPref.setFontSize(FontSizeAppEnum.small);
  }

  _mapChangeFontSizeAppToMedium(ChangeFontSizeAppToMediumEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(fontSizeApp: FontSizeAppEnum.medium));
    _appPref.setFontSize(FontSizeAppEnum.medium);
  }

  _mapChangeFontSizeAppToLarge(ChangeFontSizeAppToLargeEvent event, Emitter<MainState> emit) {
    emit(state.copyWith(fontSizeApp: FontSizeAppEnum.large));
    _appPref.setFontSize(FontSizeAppEnum.large);
  }

//endregion
}
