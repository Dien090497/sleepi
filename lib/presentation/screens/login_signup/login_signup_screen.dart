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
import 'package:slee_fi/di/translations/keys.dart';
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
              const SizedBox(height: 140),
              const SFLogo(),
              // Center(child: Image.asset("assets/images/logo.png", width: 112.14, height: 50,)),
              const SizedBox(height: 50),
              LoginBox(
                child: Column(
                  children: [
                    SFText(
                      keyText: Keys.login,
                      style: TextStyles.bold18LightWhite,
                      toUpperCase: true,
                    ),
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
                      text: Keys.login,
                      onPressed: () {
                        Navigator.pushNamed(context, R.enterActivationCode);
                      },
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: 10),
                    SFText(keyText: Keys.accountLogin, style: TextStyles.blue14)
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
