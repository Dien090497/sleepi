import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class DepositSlftScreen extends StatelessWidget {
  const DepositSlftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: Keys.depositSlft,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
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
                                      keyText: Keys.yourSlftInSpending,
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
                                  keyText: Keys.deposit,
                                  style: TextStyles.bold18LightWhite,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SFIcon(Ics.icGold),
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
                            const SizedBox(height: 21,),
                            Row(
                              children: [
                                const Expanded(
                                    child: SFTextField(
                                      showLabel: false,
                                      hintText: Keys.amount,
                                    )
                                ),
                                const SizedBox(width: 12,),
                                SFButtonOutLined(
                                    title: Keys.max,
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
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child: Column(
                    children: [
                      SFButton(
                        text: Keys.confirm,
                        textStyle: TextStyles.w600WhiteSize16,
                        height: 48,
                        width: double.infinity,
                        color: AppColors.blue,
                        onPressed: () {},
                      ),
                      const SizedBox(height: 17,),
                      SizedBox(
                          height: 48,
                          child: SFButtonOutLined(
                            title: Keys.cancel,
                            textStyle: TextStyles.bold16Blue,
                            borderColor: AppColors.blue,
                            onPressed: () {},
                          )
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
