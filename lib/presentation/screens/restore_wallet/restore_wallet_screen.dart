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
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class RestoreWalletScreen extends StatelessWidget {
  const RestoreWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return DismissKeyboardWidget(
      child: BackgroundWidget(
        resizeToAvoidBottomInset: false,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.restore_wallet,
            textStyle: TextStyles.bold18LightWhite,
          ),
          body: SafeArea(
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
                            SFText(
                              keyText: LocaleKeys.email_verification_code,
                              style: TextStyles.lightGrey14,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                    color: AppColors.white.withOpacity(0.1)),
                              ),
                              padding: const EdgeInsets.only(left: 12, right: 4),
                              child: Row(
                                children:  [
                                  const Expanded(
                                    child: SFTextField(
                                      // hintText: LocaleKeys.emailVerification,
                                      noBorder: true,
                                    ),
                                  ),
                                  SFTextButton(
                                    text: LocaleKeys.send_code,
                                    textStyle: TextStyles.blue12,
                                    onPressed: () {},
                                    // color: Colors.transparent,
                                  ),
                                ],
                              ),
                            ),
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
                    text: LocaleKeys.import_wallet,
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
      ),
    );
  }
}
