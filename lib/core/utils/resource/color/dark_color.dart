import 'package:flutter/material.dart';

import 'main_color.dart';

// Todo: Modify color for dark theme
class DarkColor extends MainColorInterface {
  @override
  Color get colorPrimary => const Color(0xFF05101C);

  @override
  Color get colorSecondary => const Color(0xFF363636);

  @override
  Color get colorBackgroundScaffold => const Color(0XFF05101C);

  @override
  Color get colorBackgroundCard => const Color(0XFFFFFFFF);

  @override
  Color get colorOnPrimary => const Color(0XFFFFFFFF);

  @override
  Color get colorOnSecondary => const Color(0XFFFFFFFF);

  @override
  Color get colorOnBackgroundScaffold => const Color(0XFFFFFFFF);

  @override
  Color get colorOnBackgroundCard => const Color(0XFF363636);

  @override
  Color get colorError => const Color(0xFFEB5757);

  @override
  Color get colorOnError => const Color(0XFFFFFFFF);
}
