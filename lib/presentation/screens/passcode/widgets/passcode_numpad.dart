import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/resources/resources.dart';

class PasscodeNumPad extends StatefulWidget {
  const PasscodeNumPad(
      {Key? key, required this.onCompleted, required this.passcodeController})
      : super(key: key);

  final TextEditingController passcodeController;
  final Function(String passcode) onCompleted;

  @override
  State<PasscodeNumPad> createState() => _PasscodeNumPadState();
}

class _PasscodeNumPadState extends State<PasscodeNumPad> {
  @override
  void dispose() {
    widget.passcodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // bool isLoading = false;

    return Column(
      children: [
        ...List.generate(
          4,
          (index) => Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              3,
              (i) {
                String num = '${index * 2 + index + i + 1}';
                if (num == '11') num = '0';

                return _Option(
                  num: num,
                  onTap: () {
                    if (num == '10') {
                      return;
                    }
                    if (num == '12') {
                      if (widget.passcodeController.text.isEmpty) {
                        return;
                      }
                      widget.passcodeController.text =
                          widget.passcodeController.text.substring(
                              0, widget.passcodeController.text.length - 1);
                    } else {
                      if (widget.passcodeController.text.length >=
                          Const.passcodeLength) {
                        return;
                      }
                      final passcode = widget.passcodeController.text + num;
                      widget.passcodeController.text = passcode;
                      if (passcode.length == Const.passcodeLength) {
                        widget.onCompleted(passcode);
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
      color = AppColors.transparent;
      child = const SFIcon(
        Ics.icDeleteTwo,
        width: 36,
      );
    } else {
      color = AppColors.white.withOpacity(0.1);
      child = Text(num, style: TextStyles.lightWhite24);
    }

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 70.w,
        height: 70.h,
        margin: EdgeInsets.only(left: 11.h, bottom: 16.h, right: 11.h),
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
