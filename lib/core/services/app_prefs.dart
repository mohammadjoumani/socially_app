import 'dart:convert';
import 'dart:ui';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:socially_app/core/utils/resource/language_manager.dart';
import 'package:socially_app/features/auth/data/models/dto/response/login_response_dto.dart';
import 'package:socially_app/features/auth/data/models/mapper/login_response_mapper.dart';
import 'package:socially_app/features/auth/domain/entities/user.dart';
import 'package:socially_app/features/generic/presentation/main/bloc/main_bloc.dart';

String keyLang = "KEY_LANG";
String keyFontSize = "KEY_FONT_SIZE";

String keyIsUserLoggedIn = "KEY_IS_USER_LOGGED_IN";
String keyOnBoardingScreenViewed = "KEY_ON_BOARDING_SCREEN_VIEWED";
String keyToken = "KEY_TOKEN";
String keyRefreshToken = "KEY_REFRESH_TOKEN";
String keyUserInfo = "KEY_USER_INFO";

class AppPreferences {
  final SharedPreferences _sharedPreferences;

  AppPreferences(this._sharedPreferences);

  // region Language
  String getAppLanguage() {
    String? language = _sharedPreferences.getString(keyLang);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.english.getValue();
    }
  }

  bool isEnglish() {
    return getAppLanguage() == LanguageType.english.getValue();
  }

  // Future<void> changeAppLanguage() async {
  //   String currentLang = getAppLanguage();
  //
  //   if (currentLang == LanguageType.arabic.getValue()) {
  //     // set english
  //     _sharedPreferences.setString(keyLang, LanguageType.english.getValue());
  //   } else {
  //     // set arabic
  //     _sharedPreferences.setString(keyLang, LanguageType.arabic.getValue());
  //   }
  // }

  Future<void> setLocale(String lang) async {
    _sharedPreferences.setString(keyLang, lang);
  }

  Locale getLocale() {
    String currentLang = getAppLanguage();

    if (currentLang == LanguageType.arabic.getValue()) {
      return arabicLocale;
    } else {
      return englishLocale;
    }
  }

  //endregion

  //region FontSize

  FontSizeAppEnum getFontSize() {
    String? fontSize = _sharedPreferences.getString(keyFontSize);
    if (fontSize != null && fontSize.isNotEmpty) {
      return FontSizeAppEnum.values.firstWhere((element) => element.name == fontSize);
    } else {
      return FontSizeAppEnum.small;
    }
  }

  Future<void> setFontSize(FontSizeAppEnum fontSizeApp) async {
    _sharedPreferences.setString(keyFontSize, fontSizeApp.name);
  }

  //endregion

  //region OnBoarding

  Future<void> setOnBoardingScreenViewed() async {
    _sharedPreferences.setBool(keyOnBoardingScreenViewed, true);
  }

  bool isOnBoardingScreenViewed() {
    return _sharedPreferences.getBool(keyOnBoardingScreenViewed) ?? false;
  }

  //endregion

  //region Login

  // Future<void> logout() async {
  //   final keys = _sharedPreferences.getKeys();
  //   for (var item in keys) {
  //     if (!(item == keyLang || item == keyOnBoardingScreenViewed || item == keyFontSize)) {
  //       _sharedPreferences.remove(item);
  //     }
  //   }
  // }
  //
  Future<void> setUserLogged() async {
    _sharedPreferences.setBool(keyIsUserLoggedIn, true);
  }

  bool isUserLogged() {
    return _sharedPreferences.getBool(keyIsUserLoggedIn) ?? false;
  }

  Future<void> setToken(String token) async {
    _sharedPreferences.setString(keyToken, token);
  }

  String getToken() {
    return _sharedPreferences.getString(keyToken) ?? "";
  }

  void setRefreshToken(String refreshToken) {
    _sharedPreferences.setString(keyRefreshToken, refreshToken);
  }

  String getRefreshToken() {
    return _sharedPreferences.getString(keyRefreshToken) ?? "";
  }

  Future<void> setUserInfo(LoginResponseDto userResponseDto) async {
    final userInfo = userResponseDto.toJson();
    setToken(userResponseDto.token!);
    setRefreshToken(userResponseDto.refreshToken!);
    setUserLogged();
    _sharedPreferences.setString(keyUserInfo, jsonEncode(userInfo));
  }

  User getUserInfo() {
    final jsonEncode = _sharedPreferences.getString(keyUserInfo) ?? "";
    final userInfo = json.decode(jsonEncode);
    return LoginResponseDto.fromJson(userInfo).toDomain();
  }

//
// void setPassword(String password) {
//   _sharedPreferences.setString(keyPassword, password);
// }
//
// String getPassword() {
//   return _sharedPreferences.getString(keyPassword) ?? "";
// }
//
// Future<void> setLoginInfo(LoginResponseDto loginResponseDto) async {
//   final loginInfo = loginResponseDto.toJson();
//   setToken(loginResponseDto.token!);
//   setRefreshToken(loginResponseDto.refreshToken!);
//   final patient = loginResponseDto.patientUserInfo!.toDomain();
//   setCurrentUser(patient);
//   _sharedPreferences.setString(keyLoginInfo, jsonEncode(loginInfo));
// }
//
// LoginResponseDto getLoginInfo() {
//   final jsonEncode = _sharedPreferences.getString(keyLoginInfo) ?? "";
//   final loginInfo = json.decode(jsonEncode);
//   return LoginResponseDto.fromJson(loginInfo);
// }
//
// Patient? getOriginUser() {
//   final currentUser = getLoginInfo().patientUserInfo;
//   return currentUser?.toDomain();
// }
//
// void setCurrentUser(Patient patient) {
//   _currentUser = patient;
// }
//
// Patient? getCurrentUser() {
//   return _currentUser;
// }
//
// List<Patient> getBeneficiaries() {
//   final beneficiaries = getLoginInfo().beneficiaries;
//   List<Patient> patients = beneficiaries!.toDomain();
//   patients.insert(0, getOriginUser()!);
//   return patients;
// }

//endregion
}
