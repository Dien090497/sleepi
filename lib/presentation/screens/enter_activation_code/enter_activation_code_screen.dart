import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
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
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(context: context, title: Keys.activationCodeLanguageLowercase, textStyle: TextStyles.bold18LightWhite,),
        body: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
              const SizedBox(height: 90.0,),
              LoginBox(
                padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
                child: Column(
                  children: [
                    const SFLogo(),
                    const SizedBox(height: 40),
                    Container(
                        alignment: Alignment.centerLeft,
                        child: SFText(keyText: Keys.pleaseEnter)),
                    const SFTextField(),
                    const SizedBox(height: 133),
                    SFButton(
                      text: Keys.start,
                      onPressed: () {
                        Navigator.pushNamedAndRemoveUntil(
                            context, R.bottomNavigation, (_) => false);
                      },
                      width: MediaQuery.of(context).size.width,
                    ),
                    const SizedBox(height: 16),
                    const SFTextButton(text: Keys.getActivationCode, textStyle: TextStyles.blue14,),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
