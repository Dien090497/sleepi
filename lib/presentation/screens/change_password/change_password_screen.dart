import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
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
    TextEditingController emailController = TextEditingController(text: '');
    TextEditingController codeController = TextEditingController(text: '');
    TextEditingController youPasswordController = TextEditingController(text: '');
    TextEditingController newPasswordController = TextEditingController(text: '');

    return DismissKeyboardWidget(
      child: BackgroundWidget(
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
                            children: [
                              SFTextField(
                                labelText: LocaleKeys.email,
                                controller: emailController,
                              ),
                              const SizedBox(height: 20),
                              SFTextFieldTextButton(
                                labelText: LocaleKeys.verification_code,
                                controller: codeController,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SFTextFieldPassword(
                                labelText: LocaleKeys.your_password,
                                controller: youPasswordController,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SFTextFieldPassword(
                                labelText: LocaleKeys.new_password,
                                controller: newPasswordController,
                              ),
                            ],
                          ),
                        )
                        ],
                      ),
                    ),
                  SFButton(
                    text: LocaleKeys.save,
                    textStyle: TextStyles.w600WhiteSize16,
                    gradient: AppColors.gradientBlueButton,
                    width: double.infinity,
                    disabled: emailController.text == '' ||
                        codeController.text == '' ||
                        youPasswordController.text == '' ||
                        newPasswordController.text == '',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: 26,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
