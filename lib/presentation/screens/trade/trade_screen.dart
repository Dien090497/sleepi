import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';

class TradeScreen extends StatefulWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  State<TradeScreen> createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  bool isDisabled = true;

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
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
                          title: LocaleKeys.trade,
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
                    children: [
                      SFCard(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                SFText(
                                  keyText: LocaleKeys.from,
                                  style: TextStyles.lightGrey12,
                                ),
                                const Spacer(),
                                SFText(
                                    keyText: LocaleKeys.balance,
                                    style: TextStyles.lightGrey12),
                                SFText(
                                  keyText: ': 0',
                                  style: TextStyles.lightGrey12,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: SFTextField(
                                    showLabel: false,
                                    noBorder: true,
                                    hintText: "0.00",
                                    hintStyle: TextStyles.bold16LightWhite,
                                    onChanged: (value){
                                      if(value.isNotEmpty){
                                        setState((){
                                          isDisabled = false;
                                        });
                                      }
                                    },
                                  ),
                                ),
                                // SFText(
                                //   keyText: '0.00',
                                //   style: TextStyles.bold18White,
                                // ),
                                SFButtonOutLined(
                                    title: LocaleKeys.max,
                                    textStyle: TextStyles.bold14Blue,
                                    borderColor: AppColors.blue,
                                    onPressed: () {}),
                                 SizedBox(width: MediaQuery.of(context).size.width * 0.045,),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.25,
                                  child:  const DropdownSelectToken(
                                    width: 90,
                                    height: 36,
                                    resultPadding: EdgeInsets.all(0),
                                    backgroundColor: AppColors.transparent,
                                    isResultLabel: true,
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
                                  keyText: LocaleKeys.to,
                                  style: TextStyles.lightGrey14,
                                ),
                                SFText(
                                    keyText:
                                        ' (${LocaleKeys.estimate.tr()})',
                                    style: TextStyles.lightGrey14),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                 SizedBox(),
                                DropdownSelectToken(
                                  width: 90,
                                  height: 36,
                                  resultPadding: EdgeInsets.all(0),
                                  backgroundColor: AppColors.transparent,
                                  isResultLabel: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  width: double.infinity,
                  text: LocaleKeys.trade,
                  textStyle: TextStyles.w600WhiteSize16,
                  gradient: AppColors.gradientBlueButton,
                  disabled: isDisabled,
                  onPressed: () {
                    showCustomAlertDialog(context,
                        children: const PopUpConfirmTrade());
                  },
                ),
                const SizedBox(
                  height: 24.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
