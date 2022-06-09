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
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/create_passcode_screen.dart';

class CreateWalletScreen extends StatelessWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.create_wallet,
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 23),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      SFCard(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: Column(
                          children: [
                            SFTextFieldTextButton(
                              labelText: LocaleKeys.email_verification_code,
                              textButton: LocaleKeys.send_code,
                              onPressed: () {},
                            ),
                            const SizedBox(height: 16),
                            SFText(
                              keyText: LocaleKeys
                                  .you_have_already_created_a_wallet_address,
                              style: TextStyles.w400lightGrey12,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  text: LocaleKeys.create_wallet,
                  textStyle: TextStyles.w600WhiteSize16,
                  height: 48,
                  width: double.infinity,
                  color: AppColors.blue,
                  onPressed: () {
                    Navigator.pushNamed(context, R.createPasscode,
                        arguments: CreatePasscodeArguments(R.showSeedPhrase));
                  },
                ),
                const SizedBox(height: 24,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
