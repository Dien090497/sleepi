import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PasscodeArguments {
  final String route;

  PasscodeArguments(this.route);
}

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PasscodeArguments?;

    final TextEditingController passcodeController = TextEditingController();

    return Scaffold(
      backgroundColor: AppColors.black,
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: const [
                Positioned(left: 10, top: 0, child: SFBackButton()),
                Align(alignment: Alignment.center, child: SFLogo()),
              ],
            ),
            const SizedBox(height: 8),
            SFText(keyText: Keys.enterYourPasscode, style: TextStyles.white12),
            const SizedBox(height: 12),
            PinCode(controller: passcodeController),
            SizedBox(height: 4.h),
            NumberKeyPad(
              passcodeController: passcodeController,
              onCompleted: (String passcode) {
                if (args != null) Navigator.pushNamed(context, args.route);
              },
            ),
            SizedBox(height: 8.h),
            SFText(keyText: Keys.forgotPasscode, style: TextStyles.white12),
          ],
        ),
      ),
    );
  }
}

class PinCode extends StatelessWidget {
  const PinCode({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      controller: controller,
      autoDisposeControllers: true,
      autoFocus: false,
      appContext: context,
      length: Const.passcodeLength,
      onChanged: (v) {},
      mainAxisAlignment: MainAxisAlignment.center,
      obscureText: true,
      backgroundColor: AppColors.transparent,
      enabled: false,
      animationType: AnimationType.scale,
      obscuringWidget: Container(
        width: double.infinity,
        height: double.infinity,
        decoration:
            const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
      ),
      pinTheme: PinTheme(
        inactiveColor: AppColors.white,
        disabledColor: AppColors.white,
        borderWidth: 2,
        fieldWidth: 16.w,
        shape: PinCodeFieldShape.circle,
        fieldOuterPadding: EdgeInsets.symmetric(horizontal: 16.w),
      ),
    );
  }
}

class NumberKeyPad extends StatelessWidget {
  const NumberKeyPad(
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
