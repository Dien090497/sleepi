import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/confirm_create_passcode_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class CreatePasscodeArguments {
  final String? mnemonic;
  final bool showSeedPhrasePopUp;

  CreatePasscodeArguments({
    this.mnemonic,
    this.showSeedPhrasePopUp = false,
  });
}

class CreatePasscodeScreen extends StatelessWidget {
  const CreatePasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as CreatePasscodeArguments?;
    final TextEditingController passCodeController = TextEditingController();

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
                    keyText: LocaleKeys.create_your_passcode,
                    style: TextStyles.white12)),
            const SizedBox(height: 12),
            PinCodeWidget(controller: passCodeController),
            SizedBox(height: 4.h),
            PasscodeNumPad(
              passcodeController: passCodeController,
              onCompleted: (String passcode) {
                Navigator.pushNamed(context, R.confirmPasscode,
                    arguments: ConfirmCreatePasscodeArguments(passcode,
                        args?.mnemonic, args?.showSeedPhrasePopUp ?? false));
                passCodeController.clear();
              },
            ),
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
