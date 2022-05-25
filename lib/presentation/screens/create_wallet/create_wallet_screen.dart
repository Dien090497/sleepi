import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SFBackButton(),
                    SFText(
                      keyText: Keys.createANewWallet,
                      toUpperCase: true,
                    ),
                    const SizedBox(width: 40),
                  ],
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 36),
                    children: [
                      SFText(keyText: Keys.emailVerificationCode),
                      const SizedBox(height: 12),
                      const SFTextField(
                          // suffix: GestureDetector(
                          //   child: SFText(
                          //     keyText: Keys.sendCode,
                          //     style: TextStyles.bold20black,
                          //   ),
                          // ),
                          ),
                      const SizedBox(height: 24),
                      SFText(keyText: Keys.youHaveAlreadyCreatedAWalletAddress),
                    ],
                  ),
                ),
                const SFButton(text: Keys.createWallet, toUpperCase: true),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
