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
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/trade/widgets/pop_up_confirm_trade.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
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
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
                                        title: LocaleKeys.max,
                                        textStyle: TextStyles.bold14Blue,
                                        borderColor: AppColors.blue,
                                        onPressed: () {}),
                                    const SizedBox(width: 8),
                                    const DropdownSelectToken(
                                      width: 115,
                                      height: 36,
                                      backgroundColor: AppColors.transparent,
                                      isResultLabel: true,
                                    ),
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
                            children: const [
                              Spacer(),
                              DropdownSelectToken(
                                width: 115,
                                height: 36,
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
                color: AppColors.blue,
                onPressed: () {
                  showCustomAlertDialog(context,
                      children: const PopUpConfirmTrade());
                },
              ),
              const SizedBox(
                height: 37.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
