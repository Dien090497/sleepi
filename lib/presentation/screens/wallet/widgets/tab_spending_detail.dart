import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_spending.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/spending_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';

class TabSpendingDetail extends StatelessWidget {
  const TabSpendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 19.0,
                ),
                const PopupInfoSpending(),
                const SizedBox(
                  height: 12.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    children: [
                      SFCard(
                        // onTap: () => Navigator.pushNamed(context, R.staking),
                        margin: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          leading: const SFIcon(Ics.icSlft),
                          minLeadingWidth: 12,
                          title: SFText(
                              keyText: LocaleKeys.slft,
                              style: TextStyles.lightWhite16,
                              stringCase: StringCase.upperCase),
                          trailing: SFText(
                            keyText: "0",
                            style: TextStyles.lightWhite16,
                          ),
                        ),
                      ),
                      SFCard(
                        margin: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          leading: const SFIcon(Ics.icSlgt),
                          minLeadingWidth: 12,
                          title: SFText(
                              keyText: LocaleKeys.slgt,
                              style: TextStyles.lightWhite16,
                              stringCase: StringCase.upperCase),
                          trailing: SFText(
                            keyText: "0",
                            style: TextStyles.lightWhite16,
                          ),
                        ),
                      ),
                      SFCard(
                        margin: const EdgeInsets.only(top: 8),
                        child: ListTile(
                          leading: const SFIcon(Ics.icSolanaCircle, width: 32, height: 32,),
                          minLeadingWidth: 12,
                          title: SFText(
                            keyText: LocaleKeys.avax,
                            style: TextStyles.lightWhite16,
                            stringCase: StringCase.upperCase,
                          ),
                          trailing: SFText(
                            keyText: "0",
                            style: TextStyles.lightWhite16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 18.0,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                      height: 48,
                      child: SFButtonOutLined(
                        title: LocaleKeys.stake,
                        textStyle: TextStyles.bold16Blue,
                        borderColor: AppColors.blue,
                        onPressed: () {
                          Navigator.pushNamed(context, R.staking);
                        },
                      )),
                ),
                const SizedBox(
                  height: 25.0,
                ),
                const SpendingDetailList(),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SFButton(
              text: LocaleKeys.transfer,
              textStyle: TextStyles.w600WhiteSize16,
              gradient: AppColors.gradientBlueButton,
              height: 48,
              width: double.infinity,
              onPressed: () => Navigator.pushNamed(context, R.transfer),
            ),
          ),
        ],
      ),
    );
  }
}
