import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_password.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.change_password,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 23),
            child: Column(
              children: [
                const SizedBox(height: 24),
                Expanded(
                  child: ListView(
                    children: [
                      SFCard(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 24),
                        child: Column(
                          children: const [
                            SFTextField(labelText: LocaleKeys.email),
                            SizedBox(height: 20),
                            SFTextFieldTextButton(
                              labelText: LocaleKeys.verification_code,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            SFTextFieldPassword(
                                labelText: LocaleKeys.your_password),
                            SizedBox(
                              height: 20,
                            ),
                            SFTextFieldPassword(
                                labelText: LocaleKeys.new_password),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  text: LocaleKeys.save,
                  textStyle: TextStyles.w600WhiteSize16,
                  gradient: AppColors.gradientBlueButton,
                  width: double.infinity,
                  onPressed: () {},
                ),
                const SizedBox(height: 37,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
