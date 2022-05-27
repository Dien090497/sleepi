import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: Keys.changePassword,
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
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                        child: Column(
                          children:  const [
                            SFTextField(labelText: Keys.email),
                            SizedBox(height: 20,),
                            SFTextFieldTextButton(labelText: Keys.verificationCode,),
                            SizedBox(height: 20,),
                            SFTextField(labelText: Keys.yourPassword, suffixIcon : Padding(padding: EdgeInsets.all(10), child: SFIcon(Ics.icEye, width: 24, height: 24,))), SizedBox(height: 20,),
                            SizedBox(height: 20,),
                            SFTextField(labelText: Keys.newPassword, suffixIcon : Padding(padding: EdgeInsets.all(10), child: SFIcon(Ics.icEye, width: 24, height: 24,))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  text: Keys.save,
                  textStyle: TextStyles.w600WhiteSize16,
                  gradient: AppColors.gradientBlueButton,
                  width: double.infinity,
                  onPressed: () {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
