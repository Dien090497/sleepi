import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/style/app_colors.dart';

@Injectable()
class ToastUtils {
  static void showToast(
    FToast fToast,
    Color bgColor,
    String content,
  ) {
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: bgColor,
      ),
      child: Text(
        content.tr(),
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.lightDark,
        ),
      ),
    );

    fToast.showToast(
        child: toast,
        gravity: ToastGravity.CENTER,
        toastDuration: const Duration(milliseconds: 800),
        positionedToastBuilder: (context, child) {
          return child;
        });
  }
}
