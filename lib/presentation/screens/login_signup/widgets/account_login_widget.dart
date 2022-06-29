import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/enter_activation_code/widgets/checkbox_letter_widget.dart';

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({Key? key}) : super(key: key);

  @override
  State<AccountLoginWidget> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLoginWidget> {
  bool isLoginSignup = true;

  void changeStatus() {
    setState(() {
      isLoginSignup = !isLoginSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: isLoginSignup
              ? LocaleKeys.signup.tr()
              : LocaleKeys.account_login.tr(),
          style: TextStyles.bold18LightWhite,
          stringCase: StringCase.upperCase,
        ),
        const SizedBox(height: 25),
        const SFTextField(
          labelText: LocaleKeys.email_address,
          // hintText: LocaleKeys.emailAddress,
        ),
        const SizedBox(height: 12),
        isLoginSignup
            ? const SFTextFieldTextButton(
                labelText: LocaleKeys.email_verification_code,
                textInputType: TextInputType.number,
              )
            : const SFTextFieldPassword(
                labelText: LocaleKeys.password,
              ),
        isLoginSignup ? const CheckBoxLetterWidget() : const SizedBox(),
        const SizedBox(height: 24),
        SFButton(
          text: isLoginSignup
              ? LocaleKeys.signup.tr()
              : LocaleKeys.login,
          color: AppColors.blue,
          textStyle: TextStyles.w600WhiteSize16,
          onPressed: () {
            isLoginSignup
                ? Navigator.pushNamed(context, R.enterActivationCode)
                : Navigator.pushNamedAndRemoveUntil(
                    context, R.bottomNavigation, (_) => false);
          },
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 16),
        SFTextButton(
          text: isLoginSignup
              ? LocaleKeys.account_login
              : LocaleKeys.verification_login,
          textStyle: TextStyles.blue14,
          onPressed: () => changeStatus(),
        ),
        const SizedBox(height: 16),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            text: LocaleKeys.registration_means_that_you_agree_to.tr(),
            style: TextStyles.w400lightGrey12,
            children: [
              const TextSpan(text: ' '),
               TextSpan(
                  text: LocaleKeys.user_agreement.tr(),
                  style: TextStyles.w400Red12,
                  recognizer: TapGestureRecognizer()..onTap = () {
                  // Single tapped.
                },
               ),
              const TextSpan(text: ' '),
              TextSpan(
                  text: "&"
                      .tr()),
              const TextSpan(text: ' '),
              TextSpan(
                  text: LocaleKeys.user_privacy.tr(),
                  style: TextStyles.w400Red12,
                recognizer: TapGestureRecognizer()..onTap = () {
                  // Single tapped.
                },
              ),

              const TextSpan(text: ' '),

            ],
          ),
        ),
      ],
    );
  }
}
