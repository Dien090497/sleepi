import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF000000);

  static const textColor = Color(0xFFCBD5E1);

  static const black = Color(0xFF000000);

  static const dark = Color(0xFF060616);

  static const darkPurple = Color(0xFF23193D);

  static const darkColor = Color(0xFF181722);

  static const borderDarkColor = Color(0xFF272E39);

  static const lightDark = Color(0xFF191B2E);

  static const lightWhite = Color(0xFFCBD5E1);

  static const light1 = Color(0xFFF1F5F9);

  static const light4 = Color(0xFF1E293B);

  static const white = Color(0xFFFFFFFF);

  static final whiteOpacity5 = const Color(0xFFFFFFFF).withOpacity(0.05);

  static const lightGrey = Color(0xFF64748B);

  static const grey = Colors.grey;

  static const greyBottomNavBar = Color(0xFFC4C4C4);

  static const transparent = Colors.transparent;

  static const darkColor1 = Color(0xFF1E212C);

  static const green = Color(0xFF2ADF9E);

  static const greenAccent = Colors.greenAccent;

  static const yellow = Color(0xFFF0B90A);

  static const lightYellow = Color(0xFFFDF5DA);

  static const blue = Color(0xFF18A0FB);

  static const purple = Color(0xFFB800E7);

  static const red = Color(0xFFFF511A);
  static const rank1 = Color(0xFF94D4FF);
  static const rank2 = Color(0xFF5FBFFF);
  static const rank3 = Color(0xFF1DA4FF);
  static const rank4 = Color(0xFF0092F3);
  static const rank5 = Color(0xFF426BFF);

  static const commonBed = Color(0xFFEEB049);

  static const uncommonBed = Color(0xFFEA7636);

  static const rareBed = Color(0xFF337CBF);

  static const epicBed = Color(0xFF79BFFF);

  static const legendaryBed = Color(0xFF4A9E45);

  static LinearGradient gradientBlue = LinearGradient(colors: [
    const Color(0xFFC4C4C4).withOpacity(0),
    const Color(0xFF18A0FB).withOpacity(0.01),
    const Color(0xFF426BFF)
  ], begin: Alignment.topCenter, end: Alignment.bottomCenter);

  static const gradientBlueAccent = LinearGradient(
      colors: [Color(0xFF62519F), Color(0xFF396CBB), Color(0xFF549CBF)],
      begin: Alignment.bottomLeft,
      end: Alignment.topRight);

  static const bluesDark = Color(0xFF426BFF);

  static const gradientBluePurple = LinearGradient(
      colors: [blue, purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const blueGradient = LinearGradient(
      colors: [blue, blue],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const gradientBlueButton = LinearGradient(
      colors: [blue, bluesDark],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter);

  static LinearGradient gradientWhiteBorderLeftToRight = LinearGradient(
      colors: [Colors.white.withOpacity(0), Colors.white.withOpacity(0.2)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static LinearGradient gradientWhiteBorderRightToLeft = LinearGradient(
      colors: [Colors.white.withOpacity(0.2), Colors.white.withOpacity(0)],
      begin: Alignment.centerLeft,
      end: Alignment.centerRight);

  static const gradientROI = LinearGradient(
      colors: [Color(0xFF1a1f37), Color(0xFF211a37)],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);

  static const tutorialBgr = Color(0xff092128);

  const AppColors._();
}
