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

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  String email = '', code = '', yourPassword = '', newPassword = '';
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        resizeToAvoidBottomInset: false,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.change_password,
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
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
                              onChanged: (e){
                                email = e ;
                                if(
                                email.isNotEmpty && code.isNotEmpty && yourPassword.isNotEmpty && newPassword.isNotEmpty ){
                                  setState((){
                                    isDisabled = false;
                                  });
                                }else {
                                  setState((){
                                    isDisabled = true;
                                  });
                                }
                              },
                            ),
                            const SizedBox(height: 20),
                            SFTextFieldTextButton(
                              labelText: LocaleKeys.verification_code,
                              textInputType: TextInputType.number,
                              valueChanged: (value){
                                code = value ;
                                if(
                                email.isNotEmpty && code.isNotEmpty && yourPassword.isNotEmpty && newPassword.isNotEmpty ){
                                  setState((){
                                    isDisabled = false;
                                  });
                                }else {
                                  setState((){
                                    isDisabled = true;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SFTextFieldPassword(
                              labelText: LocaleKeys.your_password,
                              valueChanged: (value){
                                yourPassword = value ;
                                if(
                                email.isNotEmpty && code.isNotEmpty && yourPassword.isNotEmpty && newPassword.isNotEmpty ){
                                  setState((){
                                    isDisabled = false;
                                  });
                                }else {
                                  setState((){
                                    isDisabled = true;
                                  });
                                }
                              },
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            SFTextFieldPassword(
                              labelText: LocaleKeys.new_password,
                              valueChanged: (value){
                                newPassword = value ;
                                if(
                                email.isNotEmpty && code.isNotEmpty && yourPassword.isNotEmpty && newPassword.isNotEmpty ){
                                  setState((){
                                    isDisabled = false;
                                  });
                                }else {
                                  setState((){
                                    isDisabled = true;
                                  });
                                }
                              },
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
                  disabled: isDisabled,
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
    );
  }
}
