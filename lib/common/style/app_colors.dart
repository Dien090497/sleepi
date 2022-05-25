import 'package:flutter/material.dart';

class AppColors {
  static const primary = Color(0xFF000000);

  static const textColor = Color(0xFF000000);

  static const black = Color(0xFF000000);

  static const dark = Color(0xFF060616);

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

  static const gradientBluePurple = LinearGradient(
      colors: [blue, purple],
      begin: Alignment.topLeft,
      end: Alignment.bottomRight);
  static const gradientBlueButton = LinearGradient(
      colors: [blue, Color(0xFF426BFF)],
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

  static const tutorialBgr = Color(0xff092128);

  const AppColors._();
}
