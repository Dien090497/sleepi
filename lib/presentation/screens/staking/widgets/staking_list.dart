import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_calculator.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_info_staking.dart';
import 'package:slee_fi/resources/resources.dart';

class StakingList extends StatelessWidget {
  const StakingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        SFText(
          keyText: LocaleKeys.tvlInSleefi,
          style: TextStyles.lightGrey14,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: AppColors.gradientBluePurpleStaking,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                keyText: LocaleKeys.tvlInSleefi,
                style: TextStyles.bold16LightWhite,
              ),
              const SizedBox(
                height: 19.0,
              ),
              Row(
                children: [
                  Expanded(
                      child: SFText(
                    keyText: "xxxxxx SLFT",
                    style: TextStyles.w700WhiteSize24,
                  )),
                  Expanded(
                      child: SFText(
                    keyText: "(=xxxxxx USD)",
                    style: TextStyles.w400White14,
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            SizedBox(),
            PopupInfoStaking(),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.earningToken,
                style: TextStyles.lightWhite16,
              ),
              SFText(
                keyText: "+ X%",
                style: TextStyles.green16,
              )
            ],
          ),
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.mintingDiscount,
                style: TextStyles.lightWhite16,
              ),
              SFText(
                keyText: "+ X%",
                style: TextStyles.green16,
              )
            ],
          ),
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.levelUpDiscount,
                style: TextStyles.lightWhite16,
              ),
              SFText(
                keyText: "+ X%",
                style: TextStyles.green16,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 25.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(
              keyText: LocaleKeys.stakeTokens,
              style: TextStyles.lightGrey14,
            ),
            GestureDetector(
              onTap: () {
                showCustomAlertDialog(
                  context,
                  padding: const EdgeInsets.all(24),
                  children: const PopUpCalculator(),
                );
              },
              child: SvgPicture.asset(Ics.icCalculator,
                  color: AppColors.lightGrey, width: 22),
            )
          ],
        ),
        SFCard(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SFText(
                    keyText: LocaleKeys.yourSlftEarned,
                    style: TextStyles.lightWhite16,
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Ics.icGold),
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
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SFText(
                    keyText: LocaleKeys.yourStakedAmount,
                    style: TextStyles.lightWhite16,
                  )),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Ics.icGold),
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
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: SFText(
                    keyText: LocaleKeys.apr,
                    style: TextStyles.lightWhite16,
                    toUpperCase: true,
                  )),
                  SFText(
                    keyText: "X%",
                    style: TextStyles.lightWhite16,
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Divider(
                height: 1,
                color: AppColors.white.withOpacity(0.05),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SFButton(
                    text: LocaleKeys.deposit,
                    textStyle: TextStyles.bold14LightWhite,
                    color: AppColors.blue,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.depositSLFT),
                  ),
                  SFButtonOutLined(
                    borderColor: AppColors.blue,
                    title: LocaleKeys.withdraw,
                    textStyle: TextStyles.bold14Blue,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.withdrawSLFT),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SFText(
                      keyText: LocaleKeys.compound,
                      style: TextStyles.bold14Blue,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 32.0,
        ),
        Column(
          children: [
            SFButton(
              text: LocaleKeys.buySlft,
              textStyle: TextStyles.bold14LightWhite,
              color: AppColors.blue,
              width: double.infinity,
              onPressed: () {},
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 48,
              child: SFButtonOutLined(
                  title: LocaleKeys.showContractOnAvascan,
                  textStyle: TextStyles.bold16Blue,
                  borderColor: AppColors.blue,
                  onPressed: () {}),
            ),
          ],
        )
      ],
    );
  }
}
