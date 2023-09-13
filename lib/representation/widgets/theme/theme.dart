import 'package:flutter/material.dart';
import 'package:sohoj_trip_app/representation/widgets/theme/widgets_theme/elevated_button_theme.dart';
import 'package:sohoj_trip_app/representation/widgets/theme/widgets_theme/outlined_button_theme.dart';
import 'package:sohoj_trip_app/representation/widgets/theme/widgets_theme/text_formfield_theme.dart';
import 'package:sohoj_trip_app/representation/widgets/theme/widgets_theme/text_theme.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lighOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lighElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
  );
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    textTheme: TTextTheme.lightTextTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
  );
}
