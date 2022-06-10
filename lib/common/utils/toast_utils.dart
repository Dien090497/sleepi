import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:injectable/injectable.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

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
        borderRadius: BorderRadius.circular(50),
        color: bgColor,
      ),
      child: SFText(
        keyText: content,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      ),
    );

    fToast.showToast(
        child: toast,
        gravity: ToastGravity.BOTTOM,
        toastDuration: const Duration(seconds: 2),
        positionedToastBuilder: (context, child) {
          return Positioned(
            bottom: 90,
            left: 0,
            right: 0,
            child: child,
          );
        });
  }
}
