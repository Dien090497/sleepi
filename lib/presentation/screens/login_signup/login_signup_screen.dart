import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: DismissKeyboardWidget(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              const SFLogo(),
              const SizedBox(height: 50),
              LoginBox(
                child: Column(
                  children: [
                    SFText(
                      keyText: LocaleKeys.login,
                      style: TextStyles.bold18LightWhite,
                      toUpperCase: true,
                    ),
                    const SizedBox(height: 25),
                    const SFTextField(
                      labelText: LocaleKeys.emailAddress,
                      // hintText: LocaleKeys.emailAddress,
                    ),
                    const SizedBox(height: 12),
                    const SFTextFieldTextButton(
                      labelText: LocaleKeys.emailVerificationCode,
                    ),
                    const SizedBox(height: 37),
                    SFButton(
                      text: LocaleKeys.login,
                      color: AppColors.blue,
                      textStyle: TextStyles.w600WhiteSize16,
                      onPressed: () {
                        Navigator.pushNamed(context, R.enterActivationCode);
                      },
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: 10),
                    SFText(
                        keyText: LocaleKeys.accountLogin,
                        style: TextStyles.blue14)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
