import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

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
                  SFText(keyText: Keys.email),
                  const SizedBox(height: 8),
                  const SFTextField(
                    hintText: 'sample@aaa.con(show now email address here)',
                  ),
                  const SizedBox(height: 24),
                  SFText(keyText: Keys.verificationCode),
                  const SizedBox(height: 8),
                  const SFTextField(),
                  const SizedBox(height: 24),
                  // SFText(keyText: Keys.b),
                  const SizedBox(height: 8),
                  const SFTextField(),
                  const SizedBox(height: 24),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
