// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:sehaone/core/app/di.dart';
// import 'package:sehaone/core/services/app_prefs.dart';
//
// final AppPreferences _appPref = instance<AppPreferences>();
//
// extension Date on DateTime {
//   String getNameDay() {
//     final local = _appPref.getAppLanguage();
//     return DateFormat('EEEE', local).format(this);
//   }
//
//   String getTime() {
//     final local = _appPref.getAppLanguage();
//     final time = DateFormat('hh:mm').format(this);
//     final period = DateFormat('a', local).format(this);
//     return '$time $period';
//   }
// }
//
// extension Time on TimeOfDay {
//   String getTime() {
//     final isArabic = _appPref.getAppLanguage() == 'ar';
//     final hour = hourOfPeriod == 0 ? 12 : hourOfPeriod.toString().padLeft(2, '0');
//     final minute = this.minute.toString().padLeft(2, '0');
//
//     String period;
//     if (isArabic) {
//       period = this.period == DayPeriod.am ? 'ص' : 'م';
//     } else {
//       period = this.period == DayPeriod.am ? 'AM' : 'PM';
//     }
//
//     return '$hour:$minute $period';
//   }
// }
//
// extension DateStringExtension on String {
//   String getFormatDateWithTime() {
//     final local = _appPref.getAppLanguage();
//     String date = DateFormat('yyyy-MM-dd').format(DateTime.parse(this));
//     String time = DateFormat('hh:mm').format(DateTime.parse(this));
//     String period = DateFormat('a', local).format(DateTime.parse(this));
//     return '$date $time $period';
//   }
// }
