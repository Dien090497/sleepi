import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/resources/resources.dart';

class WithdrawSlftScreen extends StatelessWidget {
  const WithdrawSlftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        resizeToAvoidBottomInset: false,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.withdraw_token.tr(args: ['SLFT']),
          textStyle: TextStyles.bold18LightWhite,
        ),
        child: SafeArea(
            child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  SFCard(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                                child: SFText(
                              keyText: LocaleKeys.your_staked_amount,
                              style: TextStyles.lightGrey12,
                            )),
                            SFText(
                              keyText: "xxxx SLFT",
                              style: TextStyles.lightGrey12,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SFText(
                              keyText: LocaleKeys.withdraw,
                              style: TextStyles.bold18LightWhite,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const SFIcon(
                                  Ics.icSlft,
                                  width: 30,
                                  height: 30,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                SFText(
                                  keyText: "XXX",
                                  style: TextStyles.lightWhite16,
                                )
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 21,
                        ),
                        Row(
                          children: [
                            const Expanded(
                                child: SFTextField(
                              showLabel: false,
                              textInputType: TextInputType.number,
                              // hintText: LocaleKeys.amount,
                            )),
                            const SizedBox(
                              width: 12,
                            ),
                            SFButtonOutLined(
                                title: LocaleKeys.max,
                                textStyle: TextStyles.bold14Blue,
                                borderColor: AppColors.blue,
                                onPressed: () {}),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Column(
                children: [
                  SFButton(
                    text: LocaleKeys.confirm,
                    textStyle: TextStyles.w600WhiteSize16,
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    onPressed: () {
                      showCustomDialog(context, children: [
                        PopUpStaking(
                          message: LocaleKeys.do_you_really_want_to_withdraw
                              .tr(namedArgs: {
                            'amount': 'xxx',
                            'token': 'SLFT',
                          }),
                          onPressed: () => showSuccessfulDialog(context, null),
                        )
                      ]);
                    },
                  ),
                  const SizedBox(height: 17),
                  SizedBox(
                      height: 48,
                      child: SFButtonOutLined(
                        title: LocaleKeys.cancel,
                        textStyle: TextStyles.bold16Blue,
                        borderColor: AppColors.blue,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
          ],
        )),
      ),
    );
  }
}
