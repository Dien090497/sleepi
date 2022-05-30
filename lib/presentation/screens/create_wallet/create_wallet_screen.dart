import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/passcode/create_passcode_screen.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar:  SFAppBar(
              context: context,
              title: Keys.createWallet,
              textStyle: TextStyles.bold18LightWhite,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      children: [
                        SFCard(
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                          child: Column(
                            children: [
                              SFTextFieldTextButton(
                                labelText: Keys.emailVerificationCode,
                                textButton: Keys.sendCode,
                                onPressed: () {},
                              ),
                              const SizedBox(height: 16),
                              SFText(
                                keyText: Keys.youHaveAlreadyCreatedAWalletAddress,
                                style: TextStyles.w400lightGrey12,
                              ),
                            ],
                          ),
                        ),
                       ],
                    ),
                  ),
                  SFButton(
                    text: Keys.createWallet,
                    textStyle: TextStyles.w600WhiteSize16,
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    onPressed: () {
                      Navigator.pushNamed(context, R.createPasscode, arguments: CreatePasscodeArguments(R.showSeedPhrase));
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
