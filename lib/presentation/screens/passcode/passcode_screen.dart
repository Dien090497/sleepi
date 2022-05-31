import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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

    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(
                height: 12.0,
              ),
              Stack(
                children: const [
                  Positioned(left: 10, top: 0, child: SFBackButton()),
                  Align(alignment: Alignment.center, child: SFLogo()),
                ],
              ),
              const SizedBox(height: 60),
              Center(
                child: SFText(
                    keyText: LocaleKeys.enterYourPasscode,
                    style: TextStyles.white12),
              ),
              const SizedBox(height: 24),
              PinCodeWidget(controller: passcodeController),
              SizedBox(height: 4.h),
              PasscodeNumPad(
                passcodeController: passcodeController,
                onCompleted: (String passcode) {
                  if (args != null) {
                    Navigator.pushReplacementNamed(context, args.route);
                  } else {
                    // _createWalletDialog(context);
                    Navigator.pushReplacementNamed(context, R.wallet);
                  }
                },
              ),
              SizedBox(height: 32.h),
              SFTextButton(
                text: LocaleKeys.forgotPasscode,
                textStyle: TextStyles.white12Underline,
                onPressed: () {
                  Navigator.pushNamed(context, R.restoreWallet);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
