import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class ConfirmCreatePasscodeArguments {
  final String passcode;

  ConfirmCreatePasscodeArguments(this.passcode);
}

class ConfirmCreatePasscodeScreen extends StatelessWidget {
  const ConfirmCreatePasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as ConfirmCreatePasscodeArguments?;

    final TextEditingController passcodeController = TextEditingController();
    bool wrongPassword = false;

    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.secure_wallet,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 65),
            Center(
                child: SFText(
                    keyText: LocaleKeys.confirm_your_passcode,
                    style: TextStyles.white12)),
            const SizedBox(height: 12),
            SizedBox(
              height: 40,
              child: PinCodeWidget(controller: passcodeController),
            ),
            StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: wrongPassword
                        ? SFText(
                            keyText: LocaleKeys.incorrect_passcode,
                            style: TextStyles.red14)
                        : const SizedBox(),
                  ),
                  SizedBox(height: 15.h),
                  PasscodeNumPad(
                    passcodeController: passcodeController,
                    onCompleted: (String passcode) {
                      if (args != null && passcode != args.passcode) {
                        // wrongPassword = true;
                        setState(() => wrongPassword = true);
                        passcodeController.clear();
                      } else if (args != null && passcode == args.passcode) {
                        Navigator.pop(context, true);
                      }
                    },
                  )
                ],
              );
            }),

            SizedBox(height: 32.h),
            // SFTextButton(
            //   text: LocaleKeys.forgotPasscode,
            //   textStyle: TextStyles.white12Underline,
            //   onPressed: () {Navigator.pushNamed(context, R.restoreWallet);},
            // )
          ],
        ),
      ),
    );
  }
}
