import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class LoginSignUpScreen extends StatelessWidget {
  const LoginSignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DismissKeyboardWidget(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 138),
            Center(
                child: SFText(
                    keyText: Keys.loginSignup, style: TextStyles.header)),
            const SizedBox(height: 63),
            LoginBox(
              child: Column(
                children: [
                  SFText(keyText: 'SLEEFI', style: TextStyles.header),
                  const SizedBox(height: 63),
                  const SFTextField(
                    hintText: Keys.emailAddress,
                  ),
                  const SizedBox(height: 51),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: AppColors.black),
                    ),
                    padding: const EdgeInsets.only(left: 12, right: 4),
                    child: Row(
                      children: const [
                        Expanded(
                          child: SFTextField(
                            hintText: Keys.emailVerification,
                            noBorder: true,
                          ),
                        ),
                        SFTextButton(
                          text: Keys.sendCode,
                          // color: Colors.transparent,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 37),
                  SFButton(
                    text: 'LOGIN',
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, R.enterActivationCode, (_) => false);
                    },
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 10),
                  SFText(
                      keyText: Keys.accountLogin, style: TextStyles.textBasic15)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
