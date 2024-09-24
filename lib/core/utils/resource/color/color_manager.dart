import 'package:flutter/material.dart';
import 'package:socially_app/core/app/di.dart';
import 'package:socially_app/core/utils/resource/color/main_color.dart';

final appColor = instance<AppColor>();

Color get colorPrimary => appColor.getColorPrimary;

Color get colorSecondary => appColor.getColorSecondary;

Color get colorBackgroundScaffold => appColor.getColorBackgroundScaffold;

Color get colorBackgroundCard => appColor.getColorBackgroundCard;

Color get colorOnPrimary => appColor.getColorOnPrimary;

Color get colorOnSecondary => appColor.getColorOnSecondary;

Color get colorOnBackgroundScaffold => appColor.getColorOnBackgroundScaffold;

Color get colorOnBackgroundCard => appColor.getColorOnBackgroundCard;

Color get colorOnBackgroundCard1 => const Color(0x9905101c);

Color get colorError => appColor.getColorError;

Color get colorOnError => appColor.getColorOnError;

Color get colorHintText => const Color(0xFFA0A0A0);

Color get colorBorderTextField => const Color(0xFFA0A0A0);

BoxShadow get genericBoxShadow => const BoxShadow(
      color: Color(0x14000000),
      blurRadius: 10,
      offset: Offset(0, 2),
      spreadRadius: 0,
    );

MaterialColor get primarySwatch => const MaterialColor(
      0xFFffffff,
      <int, Color>{
        50: Color(0xFFffffff),
        100: Color(0xFFffffff),
        200: Color(0xFFffffff),
        300: Color(0xFFffffff),
        400: Color(0xFFffffff),
        500: Color(0xFFffffff),
        600: Color(0xFFffffff),
        700: Color(0xFFffffff),
        800: Color(0xFFffffff),
        900: Color(0xFFffffff),
      },
    );

// class ColorManager {
//   // Primary
//   static const Color colorPrimary = Color(0xFF1CC9BC);
//   static const Color colorPrimary1 = Color(0x331CC9BC);
//   static const Color colorPrimary2 = Color(0x001CC9BC);
//   static const Color colorPrimary3 = Color(0xF21CC9BC);
//
//   // Secondary
//   static const Color colorSecondary = Color(0xFFFF960A);
//   static const Color colorSecondary1 = Color(0x19FF960A);
//
//   static const Color colorDisable = Color(0x7F1CC9BC);
//
//   static const Color colorBackground = Color(0xFFFAFFFF);
//
//   // Gray
//   static const Color colorGray1 = Color(0xFFA0A0A0);
//   static const Color colorGray2 = Color(0xFFD1D3D6);
//   static const Color colorGray3 = Color(0xFF5F666F);
//   static const Color colorGray4 = Color(0x191CC9BC);
//   static const Color colorGray5 = Color(0xFFC5C5C5);
//   static const Color colorGray6 = Color(0xFFF5F5F5);
//   static const Color colorGray7 = Color(0xFFBCBCBC);
//   static const Color colorGray8 = Color(0xFFF0F0F0);
//   static const Color colorGray9 = Color(0xFF18C0B3);
//
//   // Black
//   static const Color colorBlack1 = Color(0xFF525252);
//   static const Color colorBlack2 = Color(0xFF282A36);
//   static const Color colorBlack3 = Color(0xFF79747E);
//   static const Color colorBlack4 = Color(0xFF535353);
//   static const Color colorBlack5 = Color(0xFF121212);
//   static const Color colorBlack6 = Color(0xFF435363);
//   static const Color colorBlack7 = Color(0xFF767C84);
//   static const Color colorBlack8 = Color(0xFF404040);
//   static const Color colorBlack9 = Color(0xff071731);
//
//   // Status Color
//   static const Color colorCyanBlue = Color(0xFF1E69C1);
//   static const Color colorCyanBlue1 = Color(0xFF6A9BD4);
//   static const Color colorRed = Color(0xFFEB5757);
//   static const Color colorRed1 = Color(0xFFFF0000);
//   static const Color colorGreen = Color(0xFF4BB543);
//   static const Color colorGreen1 = Color(0xff76EE59);
//
//   static const Color colorWhite = Color(0xFFffffff);
//   static const Color colorWhite1 = Color(0xFFFAFAFA);
//
//   static const Color navBarShadowColor = Color(0x0C0060AF);
//
//   // Approval Status
//   static const Color colorApproved = Color(0xFF4BB543);
//   static const Color colorPartiallyApproved = Color(0xFF2D72C3);
//   static const Color colorPending = Color(0xFFFF960A);
//   static const Color colorRejected = Color(0xFFFF0000);
//
//   static const Color colorSelectedRate = Color(0xFFFFBF69);
//   static const Color colorUnSelectedRate = Color(0xFFE6E6E6);
//
//   static const genericBoxShadow = BoxShadow(
//     color: Color(0x14000000),
//     blurRadius: 10,
//     offset: Offset(0, 2),
//     spreadRadius: 0,
//   );
//
//   static const MaterialColor primarySwatch = MaterialColor(
//     0xFFffffff,
//     <int, Color>{
//       50: Color(0xFFffffff),
//       100: Color(0xFFffffff),
//       200: Color(0xFFffffff),
//       300: Color(0xFFffffff),
//       400: Color(0xFFffffff),
//       500: Color(0xFFffffff),
//       600: Color(0xFFffffff),
//       700: Color(0xFFffffff),
//       800: Color(0xFFffffff),
//       900: Color(0xFFffffff),
//     },
//   );
// }
