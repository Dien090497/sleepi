import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class TextStyles {
  static const h1 = TextStyle(fontSize: 24, color: AppColors.primary);
  static const header = TextStyle(
      fontSize: 32, color: AppColors.textColor, fontWeight: FontWeight.bold);
  static const textBasic15 = TextStyle(fontSize: 15, color: AppColors.primary);
  static const black10 = TextStyle(fontSize: 10, color: AppColors.black);
  static const black12 = TextStyle(fontSize: 12, color: AppColors.black);
  static const bold20black = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.black);
  static const bold15black = TextStyle(
      fontSize: 15, fontWeight: FontWeight.bold, color: AppColors.black);
  static const black10Bold = TextStyle(
      fontSize: 10, color: AppColors.black, fontWeight: FontWeight.bold);
  static const white12 = TextStyle(fontSize: 12, color: AppColors.white);
  static const white22Italic = TextStyle(
      fontSize: 22, color: AppColors.white, fontStyle: FontStyle.italic);
}
