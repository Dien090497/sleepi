import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class EnterActivationCodeScreen extends StatelessWidget {
  const EnterActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
            context: context,
            title: Keys.activationCodeLanguageLowercase,
            textStyle: TextStyles.bold18LightWhite,
          ),
          body: SafeArea(
            child: ListView(
              children: [
                const SizedBox(
                  height: 90.0,
                ),
                LoginBox(
                  padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SFLogo(),
                      const SizedBox(height: 40),
                      const SFTextField(
                        labelText: Keys.pleaseEnter,
                      ),
                      const SizedBox(height: 20),
                      SFText(keyText: Keys.pleaseSelectYourLanguage, style: TextStyles.lightGrey14),
                      const SizedBox(height: 4,),
                      SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: SFDropDown(
                            value: "1",
                            dropdownItems: [
                              DropdownMenuItem(
                                value: '1',
                                child: SFText(
                                  keyText: Keys.english,
                                  style: TextStyles.white16,
                                ),
                              ),
                              DropdownMenuItem(
                                value: '2',
                                child: SFText(
                                  keyText: Keys.japanese,
                                  style: TextStyles.white16,
                                ),
                              ),
                              DropdownMenuItem(
                                value: '3',
                                child: SFText(
                                  keyText: "Korea",
                                  style: TextStyles.white16,
                                ),
                              ),
                              DropdownMenuItem(
                                value: '4',
                                child: SFText(
                                  keyText: "China",
                                  style: TextStyles.white16,
                                ),
                              ),
                              DropdownMenuItem(
                                value: '5',
                                child: SFText(
                                  keyText: "Spanish",
                                  style: TextStyles.white16,
                                ),
                              ),
                            ]
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      SFButton(
                        text: Keys.start,
                        color: AppColors.blue,
                        textStyle: TextStyles.white1w700size16,
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(
                              context, R.bottomNavigation, (_) => false);
                        },
                        width: MediaQuery.of(context).size.width,
                      ),
                      const SizedBox(height: 16),
                      const Center(
                        child: SFTextButton(
                          text: Keys.getActivationCode,
                          textStyle: TextStyles.blue14,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
