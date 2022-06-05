import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
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
      child: DismissKeyboardWidget(
        child: ListView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            SizedBox(height: 122.h),
            const SFLogo(),
            const SizedBox(height: 50),
            LoginBox(
              child: Column(
                children: [
                  SFText(
                    keyText: LocaleKeys.login_signup,
                    style: TextStyles.bold18LightWhite,
                    stringCase: StringCase.upperCase,
                  ),
                  const SizedBox(height: 25),
                  const SFTextField(
                    labelText: LocaleKeys.email_address,
                    // hintText: LocaleKeys.emailAddress,
                  ),
                  const SizedBox(height: 12),
                  const SFTextFieldTextButton(
                    labelText: LocaleKeys.email_verification_code,
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
                      keyText: LocaleKeys.account_login,
                      style: TextStyles.blue14)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
