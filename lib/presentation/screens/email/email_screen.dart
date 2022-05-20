import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class EmailScreen extends StatelessWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SFBackButton(),
                SFText(keyText: Keys.email),
                const SizedBox(width: 48),
              ],
            ),
            const SizedBox(height: 24),
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(vertical: 12),
                children: [
                  SFText(keyText: Keys.newEmail),
                  const SizedBox(height: 8),
                  const SFTextField(),
                  const SizedBox(height: 24),
                  SFText(keyText: Keys.verificationCode),
                  const SizedBox(height: 8),
                  const SFTextField(),
                  const SizedBox(height: 24),
                  SFText(keyText: Keys.password),
                  const SizedBox(height: 8),
                  const SFTextField(),
                  const SizedBox(height: 24),
                  Center(
                    child: SFText(
                      keyText: Keys.pleaseSetPasswordFirst,
                      style: TextStyles.red16Italic,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
