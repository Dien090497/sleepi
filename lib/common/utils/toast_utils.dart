import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/style/app_colors.dart';

@Injectable()
class ToastUtils {
  static void showToast(
    String content, {
    Color? bgColor,
  }) {
    // Widget toast = Container(
    //   padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: bgColor ??,
    //   ),
    //   child: Text(
    //     content.tr(),
    //     style: const TextStyle(
    //       fontSize: 12,
    //       fontWeight: FontWeight.w400,
    //       color: AppColors.lightDark,
    //     ),
    //   ),
    // );
    Fluttertoast.cancel();
    Fluttertoast.showToast(
      msg: content.tr(),
      gravity: ToastGravity.CENTER,
      backgroundColor: bgColor ?? AppColors.white.withOpacity(0.55),
      fontSize: 12,
      textColor: AppColors.lightDark,
    );
    // fToast.showToast(
    //   child: toast,
    //   gravity: ToastGravity.CENTER,
    //   toastDuration: const Duration(milliseconds: 800),
    //   positionedToastBuilder: (context, child) {
    //     return child;
    //   },);
  }

  static showToastBottom(String message, Color? color,
      {ToastGravity gravity = ToastGravity.BOTTOM}) {
    return Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: gravity,
        timeInSecForIosWeb: 2,
        backgroundColor: color ?? AppColors.red,
        // textColor: Colors.white,
        fontSize: 14.0);
  }
}
