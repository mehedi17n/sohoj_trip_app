import 'package:flutter/material.dart';

import '../../../../core/constants/color_palatte.dart';
import '../../../../core/constants/dimension_constants.dart';

//Light & Dark Outlined Button Themes
class TOutlinedButtonTheme {
  TOutlinedButtonTheme._(); //To avoid creating instances

  //Light Theme
  static final lighOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tSecondaryColor,
      side: BorderSide(color: tSecondaryColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );

  //Dark Theme
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(),
      foregroundColor: tWhiteColor,
      side: BorderSide(color: tWhiteColor),
      padding: EdgeInsets.symmetric(vertical: tButtonHeight),
    ),
  );
}
