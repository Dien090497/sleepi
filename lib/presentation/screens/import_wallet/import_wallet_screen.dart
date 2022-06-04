import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ImportWalletScreen extends StatelessWidget {
  const ImportWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.secure_wallet,
            textStyle: TextStyles.bold18LightWhite,
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 23),
              child: Column(
                children: [
                  Expanded(
                    child: ListView(
                      padding: const EdgeInsets.symmetric(vertical: 36),
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
                              const SizedBox(height: 20),
                              const SFTextField(
                                labelText: LocaleKeys.seed_phrase,
                                hintText: LocaleKeys.enter_the_seed_phrase,
                                hintStyle: TextStyles.w400lightGrey12,
                                maxLine: 10,
                                maxLength: 256,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SFButton(
                    text: LocaleKeys.import_wallet,
                    textStyle: TextStyles.w600WhiteSize16,
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    onPressed: () {
                      Navigator.popUntil(
                          context, (r) => r.settings.name == R.wallet);
                    },
                  ),
                  const SizedBox(height: 24,)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
