import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class AccountLoginWidget extends StatefulWidget {
  const AccountLoginWidget({Key? key}) : super(key: key);

  @override
  State<AccountLoginWidget> createState() => _AccountLoginState();
}

class _AccountLoginState extends State<AccountLoginWidget> {
  bool isLoginSignup = true;

  void changeStatus(){
    setState((){
      isLoginSignup = !isLoginSignup;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        isLoginSignup
            ? const SFTextFieldTextButton(
                labelText: LocaleKeys.email_verification_code,
              )
            : const SFTextFieldPassword(labelText: LocaleKeys.password,),
        const SizedBox(height: 37),
        SFButton(
          text: isLoginSignup ? LocaleKeys.login_signup : LocaleKeys.account_login,
          color: AppColors.blue,
          textStyle: TextStyles.w600WhiteSize16,
          onPressed: () {
            isLoginSignup ? Navigator.pushNamed(context, R.enterActivationCode)
                          : Navigator.pushNamedAndRemoveUntil(
                            context, R.bottomNavigation, (_) => false);
          },
          width: MediaQuery.of(context).size.width,
        ),
        const SizedBox(height: 32),
        InkWell(
          onTap: () => changeStatus(),
          child: SFText(
              keyText: isLoginSignup ? LocaleKeys.account_login : LocaleKeys.verification_login,
              style: TextStyles.blue14),
        )
      ],
    );
  }
}
