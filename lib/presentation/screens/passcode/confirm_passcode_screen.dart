import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class ConfirmPasscodeArguments {
  final String route;

  ConfirmPasscodeArguments(this.route);
}

class ConfirmPasscodeScreen extends StatelessWidget {
  const ConfirmPasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as ConfirmPasscodeArguments?;

    final TextEditingController passcodeController = TextEditingController();

    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.secure_wallet,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
          child: ListView(
            children: [
              const SizedBox(height: 65),
              Center(
                  child: SFText(
                      keyText: LocaleKeys.confirm_your_passcode,
                      style: TextStyles.white12)),
              const SizedBox(height: 12),
              PinCodeWidget(controller: passcodeController),
              SizedBox(height: 4.h),
              PasscodeNumPad(
                passcodeController: passcodeController,
                onCompleted: (String passcode) {
                  if (args != null) {
                    Navigator.pushReplacementNamed(context, args.route);
                  } else {
                    Navigator.pop(context, true);
                  }
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
      ),
    );
  }
}
