import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class EnterActivationCodeScreen extends StatelessWidget {
  const EnterActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 33),
          children: [
            const SizedBox(height: 52),
            Container(
              alignment: Alignment.centerLeft,
              child: const SFBackButton(),
            ),
            const SizedBox(height: 20),
            SFText(keyText: Keys.getActivationCode),
            LoginBox(
              padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
              child: Column(
                children: [
                  SFText(
                    keyText: 'SLEEFI',
                    style: TextStyles.header,
                  ),
                  const SizedBox(height: 40),
                  Container(
                      alignment: Alignment.centerLeft,
                      child: SFText(keyText: Keys.pleaseEnter)),
                  const SFTextField(),
                  const SizedBox(height: 133),
                  SFButton(
                    text: Keys.start,
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, R.bottomNavigation, (_) => false);
                    },
                    width: MediaQuery.of(context).size.width,
                  ),
                  const SizedBox(height: 16),
                  const SFTextButton(text: Keys.getActivationCode),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
