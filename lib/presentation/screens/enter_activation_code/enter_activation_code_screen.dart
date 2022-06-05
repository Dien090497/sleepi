import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/login_signup/widgets/login_box.dart';

class EnterActivationCodeScreen extends StatelessWidget {
  const EnterActivationCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        appBar: SFAppBar(
            context: context,
            title: LocaleKeys.activation_code_language_lowercase,
            textStyle: TextStyles.bold18LightWhite),
        child: SafeArea(
          child: ListView(
            physics: const ClampingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            children: [
               SizedBox(height: MediaQuery.of(context).size.height * 0.15),
              LoginBox(
                padding: const EdgeInsets.fromLTRB(28, 24, 28, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SFLogo(),
                    const SizedBox(height: 40),
                    const SFTextField(labelText: LocaleKeys.please_enter),
                    const SizedBox(height: 20),
                    SFText(
                        keyText: LocaleKeys.please_select_your_language,
                        style: TextStyles.lightGrey14),
                    const SizedBox(height: 4),
                    SizedBox(
                        width: double.infinity,
                        height: 48,
                        child: SFDropDown<String>(
                            value: context.locale.displayName,
                            icon: const Icon(
                              Icons.keyboard_arrow_down,
                              size: 24,
                            ),
                            dropdownWidth:
                                MediaQuery.of(context).size.width * 0.8,
                            dropdownItems: List.generate(
                              Const.locales.length,
                              (i) => DropdownMenuItem(
                                value: Const.locales[i].displayName,
                                child: SFText(
                                  keyText: Const.locales[i].displayName,
                                  style: TextStyles.white16,
                                ),
                              ),
                            ))),
                    const SizedBox(height: 20),
                    SFButton(
                      text: LocaleKeys.start,
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
                          text: LocaleKeys.get_activation_code,
                          textStyle: TextStyles.blue14),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
