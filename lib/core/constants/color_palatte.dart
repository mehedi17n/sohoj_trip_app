import 'package:flutter/material.dart';

class ColorPalette {
  static const Color primaryColor = Color.fromARGB(255, 10, 10, 10);
  static const Color secondColor = Color(0xFF272727);
  //static const Color primaryColor = Color(0xff6155CC);
  //static const Color secondColor = Color(0xff8F67E8);
  static const Color yellowColor = Color(0xffFE9C5E);

  static const Color dividerColor = Color(0xFFE5E7EB);
  static const Color text1Color = Color(0xFF323B4B);
  static const Color subTitleColor = Color(0xFF838383);
  static const Color backgroundScaffoldColor = Color(0xFFF2F2F2);
}

class Gradients {
  static const Gradient defaultGradientBackground = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomLeft,
    colors: [
      ColorPalette.secondColor,
      ColorPalette.primaryColor,
    ],
  );
}

/* -- LIST OF ALL COLORS -- */

const tPrimaryColor = Color.fromARGB(255, 10, 10, 10);
const tSecondaryColor = Color(0xFF272727);
const tAccentColor = Color(0xFF001BFF);

const tWhiteColor = Colors.white;
const tDarkColor = Color(0xff000000);
const tCardBgColor = Color(0xFFF7F6F1);

// -- ON-BOARDING COLORS
const tOnBoardingPage1Color = Colors.white;
const tOnBoardingPage2Color = Color(0xfffddcdf);
const tOnBoardingPage3Color = Color(0xffffdcbd);

// Flight

Color Surface = Color(0xFF1D2026);
Color cards = Color(0xFF2D303A);
Color textColor = Color(0xFFFFFFFF);
Color Primary = Color(0xFFFFC78C);
Color Green = Color(0xFF9ACA99);
Color Purple = Color(0xFFA097F2);
Color Teal = Color(0xFFC1E3E1);
Color Yellow = Color(0xFFF8CF80);
Color Red = Color(0xFFFF8F8F);
Color appYellow = Color(0xFFBF4DF0);

LinearGradient primary = const LinearGradient(
    begin: Alignment(0.5, 0.5),
    end: Alignment(-0.5, 0.5),
    colors: [
      Color.fromRGBO(248, 130, 100, 1),
      Color.fromRGBO(255, 226, 196, 1)
    ]);

Color textColorI = Color(0xFF30313F);
Color textColorII = Color(0xFF5F6160);
Color textColorIII = Color(0xFF979797);
Color textColorIV = Color(0xFF7A7B7B);
Color textColorV = Color(0xFFC4C4C4);
Color textColorVI = Color(0xFFD7D7D7);
Color textColorVII = Color(0xFFE1E1E1);
Color textColorVIII = Color(0xFFF1F1F1);

class AppColor {
  static const Map<int, Color> color = {
    50: Color(0xFFA596E3),
    100: Color(0xFF9D8CE0),
    200: Color(0xFF8D79DB),
    300: Color(0xFF7D66D6),
    400: Color(0xFF6C53D1),
    500: Color(0xFF5C40CC),
    600: Color(0xFF533AB8),
    700: Color(0xFF4A33A3),
    800: Color(0xFF402D8F),
    900: Color(0xFF37267A),
  };
}

const Color textColorLightTheme = Color(0xFF0D0D0E);

const Color secondaryColor80LightTheme = Color(0xFF202225);
const Color secondaryColor60LightTheme = Color(0xFF313336);
const Color secondaryColor40LightTheme = Color(0xFF585858);
const Color secondaryColor20LightTheme = Color(0xFF787F84);
const Color secondaryColor10LightTheme = Color(0xFFEEEEEE);
const Color secondaryColor5LightTheme = Color(0xFFF8F8F8);
