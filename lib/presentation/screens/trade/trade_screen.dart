import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';
import 'package:slee_fi/resources/resources.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Expanded(
                        child: SFSubAppBar(
                          title: Keys.trade,
                          textStyle: TextStyles.bold18LightWhite,
                        ),
                      ),
                      GestureDetector(
                          child: const SFIconBorder(
                              icon: Icons.refresh, sizeIcon: 28)),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    children: [
                      SFCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SFText(
                                  keyText: Keys.from,
                                  style: TextStyles.lightGrey12,
                                ),
                                const Spacer(),
                                SFText(
                                    keyText: Keys.balance,
                                    style: TextStyles.lightGrey12),
                                SFText(
                                  keyText: ': 0',
                                  style: TextStyles.lightGrey12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SFText(
                                  keyText: '0.00',
                                  style: TextStyles.bold18White,
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SFButtonOutLined(
                                          title: Keys.max,
                                          textStyle: TextStyles.bold14Blue,
                                          borderColor: AppColors.blue,
                                          onPressed: () {}),
                                      const SizedBox(width: 8),
                                      const Icon(
                                        Icons.monetization_on_outlined,
                                        color: AppColors.blue,
                                      ),
                                      const SizedBox(width: 4),
                                      SFText(
                                        keyText: 'USDC',
                                        style: TextStyles.lightGrey12,
                                      ),
                                      const Icon(
                                        Icons.keyboard_arrow_down_rounded,
                                        color: AppColors.lightGrey,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Center(
                          child: Icon(
                        Icons.swap_vert,
                        color: AppColors.lightWhite,
                        size: 32,
                      )),
                      const SizedBox(height: 8),
                      SFCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SFText(
                                  keyText: Keys.to,
                                  style: TextStyles.lightGrey14,
                                ),
                                SFText(
                                    keyText: ' (${translate(Keys.estimate)})',
                                    style: TextStyles.lightGrey14),
                              ],
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Row(
                                children: [
                                  const Spacer(),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        const SFIcon(
                                          Ics.icSilver,
                                          width: 24,
                                        ),
                                        const SizedBox(width: 4),
                                        SFText(
                                          keyText: 'USDC',
                                          style: TextStyles.lightGrey12,
                                        ),
                                        const Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: AppColors.lightGrey,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 12),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  width: double.infinity,
                  text: Keys.trade,
                  textStyle: TextStyles.w600WhiteSize16,
                  color: AppColors.blue,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (_) {
                          return const PopUpConfirmTrade();
                        });
                  },
                ),
                const SizedBox(
                  height: 8.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}