import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

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
            PinCodeWidget(controller: passcodeController),
            SizedBox(height: 4.h),
            PasscodeNumPad(
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
