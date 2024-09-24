part of 'main_bloc.dart';

enum ThemeModeEnum { light, dark }

enum FontSizeAppEnum {
  small(1),
  medium(1.1),
  large(1.2);

  const FontSizeAppEnum(this.value);

  final double value;
}

class MainState {
  Locale? locale;
  ThemeModeEnum themeMode;
  FontSizeAppEnum? fontSizeApp;

  // Patient? patient;

  // List<Patient>? beneficiaries;
  final AppPreferences _appPref = instance<AppPreferences>();

  MainState({
    this.locale,
    this.themeMode = ThemeModeEnum.light,
    this.fontSizeApp,
    // this.patient,
    // this.beneficiaries,
  }) {
    locale ??= _appPref.getLocale();
    fontSizeApp ??= _appPref.getFontSize();
    // patient ??= _appPref.getCurrentUser();
    // beneficiaries ??= _appPref.getBeneficiaries();
  }

  copyWith({
    Locale? locale,
    ThemeModeEnum? themeMode,
    FontSizeAppEnum? fontSizeApp,
    // Patient? patient,
    // List<Patient>? beneficiaries,
  }) {
    return MainState(
      locale: locale ?? this.locale,
      themeMode: themeMode ?? this.themeMode,
      fontSizeApp: fontSizeApp ?? this.fontSizeApp,
      // patient: patient ?? this.patient,
      // beneficiaries: beneficiaries ?? this.beneficiaries,
    );
  }
}
