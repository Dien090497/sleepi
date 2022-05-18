import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class PasscodeNumPad extends StatelessWidget {
  const PasscodeNumPad(
      {Key? key, required this.onCompleted, required this.passcodeController})
      : super(key: key);

  final TextEditingController passcodeController;
  final Function(String passcode) onCompleted;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          4,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(
              3,
              (i) {
                String num = '${index * 2 + index + i + 1}';
                if (num == '11') num = '0';

                return _Option(
                  num: num,
                  onTap: () {
                    if (num == '12') {
                      if (passcodeController.text.isEmpty) {
                        return;
                      }
                      passcodeController.text = passcodeController.text
                          .substring(0, passcodeController.text.length - 1);
                    } else {
                      if (passcodeController.text.length >
                          Const.passcodeLength - 1) {
                        return;
                      }
                      final passcode = passcodeController.text + num;
                      passcodeController.text = passcode;
                      if (passcode.length == Const.passcodeLength) {
                        onCompleted(passcode);
                      }
                    }
                  },
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _Option extends StatelessWidget {
  const _Option({Key? key, required this.num, required this.onTap})
      : super(key: key);

  final String num;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final Widget child;
    final Color color;

    if (num == '10') {
      color = AppColors.transparent;
      child = const SizedBox();
    } else if (num == '12') {
      color = AppColors.greyBottomNavBar;
      child = const Text('X', style: TextStyles.white22Italic);
    } else {
      color = AppColors.greyBottomNavBar;
      child = Text(num, style: TextStyles.white22Italic);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60.w,
        height: 60.h,
        margin: EdgeInsets.only(bottom: 8.h),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        padding: const EdgeInsets.all(8),
        alignment: Alignment.center,
        child: child,
      ),
    );
  }
}
