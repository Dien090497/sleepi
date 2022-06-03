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

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  String _email = '';
  String _code = '';
  String _password = '';

  bool isDisabled = true;
  void validateButton() {

    if(_email.isNotEmpty &&
        _code.isNotEmpty &&
        _password.isNotEmpty){
      setState(() {
        isDisabled = false;
      });
    } else {
      isDisabled = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.email,
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
                            children:  [
                              SFTextField(
                                  onChanged: (email) {
                                    _email = email;
                                    validateButton();
                                  },
                                  labelText: LocaleKeys.new_email),
                              const SizedBox(
                                height: 20,
                              ),
                              SFTextFieldTextButton(
                                valueChanged: (code) {
                                  _code = code;
                                  validateButton();
                                },
                                labelText: LocaleKeys.verification_code,
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              SFTextFieldPassword(
                                valueChanged: (pw) {
                                  _password = pw;
                                  validateButton();
                                },
                                labelText: LocaleKeys.password,

                              ),
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
                    disabled: isDisabled,
                    onPressed: () {},
                  ),
                  const SizedBox(height: 24,),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
