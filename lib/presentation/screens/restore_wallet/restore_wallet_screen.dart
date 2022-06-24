import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class RestoreWalletScreen extends StatelessWidget {
  const RestoreWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        resizeToAvoidBottomInset: false,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.restore_wallet,
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  children: [
                    SFCard(
                      margin: const EdgeInsets.only(top: 16.0),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 24),
                          TextfieldVerificationEmail(
                              maxLength: 6,
                              onPressed: () {
                                //todo: send otp in here
                              },
                              valueChanged: (otp) {},
                              errorText: ''),
                          const SizedBox(height: 20),
                          const SFTextField(
                            maxLine: 10,
                            maxLength: 100,
                            labelText: LocaleKeys.seed_phrase,
                            hintText: LocaleKeys.enter_the_seed_phrase_word,
                            hintStyle: TextStyles.lightGrey16,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: SFButton(
                  text: LocaleKeys.import_wallet.reCase(StringCase.titleCase),
                  textStyle: TextStyles.w600WhiteSize16,
                  height: 48,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  onPressed: () {
                    Navigator.popUntil(
                        context, (r) => r.settings.name == R.settingWallet);
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
