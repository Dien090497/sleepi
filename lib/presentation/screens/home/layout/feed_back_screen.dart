import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_drop_down.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        child: Scaffold(
            backgroundColor: AppColors.transparent,
            resizeToAvoidBottomInset: false,
            appBar: SFAppBar(
                context: context,
                title: LocaleKeys.feedback,
                centerTitle: true,
                textStyle: TextStyles.bold18LightWhite),
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                            width: size.width / 3,
                            height: 48,
                            child: SFDropDown(
                                value: "Bug",
                                dropdownWidth: size.width / 3,
                                icon: const Icon(Icons.keyboard_arrow_down, size: 24,),
                                dropdownItems: [
                                  DropdownMenuItem(
                                    value: 'Suggestion',
                                    child: SFText(
                                      keyText: 'Suggestion',
                                      style: TextStyles.white16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Bug',
                                    child: SFText(
                                      keyText: 'Bug',
                                      style: TextStyles.white16,
                                    ),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Other',
                                    child: SFText(
                                      keyText: 'Other',
                                      style: TextStyles.white16,
                                    ),
                                  ),
                                ])),
                        const SizedBox(width: 10),
                        Expanded(
                            child: SizedBox(
                              child: SFDropDown(
                                  value: "Wallet",
                                  dropdownWidth: size.width * 0.55,
                                  icon: const Icon(Icons.keyboard_arrow_down, size: 24,),
                                  dropdownItems: [
                                    DropdownMenuItem(
                                      value: 'Running/GPS',
                                      child: SFText(
                                        keyText: 'Running/GPS',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Marketplace',
                                      child: SFText(
                                        keyText: 'Marketplace',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Wallet',
                                      child: SFText(
                                        keyText: 'Wallet',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'NFT',
                                      child: SFText(
                                        keyText: 'NFT',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Display',
                                      child: SFText(
                                        keyText: 'Display',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Earning',
                                      child: SFText(
                                        keyText: 'Earning',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                    DropdownMenuItem(
                                      value: 'Others',
                                      child: SFText(
                                        keyText: 'Others',
                                        style: TextStyles.white16,
                                      ),
                                    ),
                                  ]),
                            )),
                      ],
                    ),
                    const Expanded(
                      child: SFCard(
                        child: SingleChildScrollView(
                          child: SFTextField(
                            noBorder: true,
                            maxLine: 15,
                            maxLength: 100,
                            hintText: LocaleKeys.hint_feedback,
                            hintStyle: TextStyles.lightGrey16,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 34,),
                    SFButton(
                      text: LocaleKeys.submit,
                      width: size.width,
                      gradient: AppColors.gradientBlueButton,
                      textStyle: TextStyles.w600WhiteSize16,
                    ),
                    const SizedBox(height: 24,)
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
