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
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_calculator.dart';
import 'package:slee_fi/resources/resources.dart';

class StakingList extends StatelessWidget {
  const StakingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(15.0),
      children: [
        SFText(
          keyText: Keys.tvlInSleefi,
          style: TextStyles.lightGrey14,
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: AppColors.gradientBlueAccent,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                keyText: Keys.tvlInDapps,
                style: TextStyles.bold24LightWhite,
                toUpperCase: true,
              ),
              const SizedBox(
                height: 24.0,
              ),
              Center(
                  child: SFText(
                keyText: "2.905B ASTR",
                style: TextStyles.bold24LightWhite,
              )),
              Center(
                  child: SFText(
                keyText: "163.2M USD",
                style: TextStyles.bold24LightWhite,
              )),
              const SizedBox(
                height: 12.0,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            GestureDetector(
              onTap: () {},
              child: SvgPicture.asset(Ics.icQuestion,
                  color: AppColors.lightGrey, width: 22),
            )
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
                keyText: Keys.earningToken,
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
                keyText: Keys.mintingDiscount,
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
                keyText: Keys.levelUpDiscount,
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
              keyText: Keys.stakeTokens,
              style: TextStyles.lightGrey14,
            ),
            GestureDetector(
              onTap: () {
                showCustomAlertDialog(
                  context,
                  children: [const PopUpCalculator()],
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
                    keyText: Keys.yourSlftEarned,
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
                    keyText: Keys.yourStakedAmount,
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
                    keyText: Keys.apr,
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
                    text: Keys.deposit,
                    textStyle: TextStyles.bold14LightWhite,
                    color: AppColors.blue,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.depositSLFT),
                  ),
                  SFButtonOutLined(
                    borderColor: AppColors.blue,
                    title: Keys.withdraw,
                    textStyle: TextStyles.bold14Blue,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.withdrawSLFT),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: SFText(
                      keyText: Keys.compound,
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButton(
                text: Keys.buySlft,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {},
              ),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SizedBox(
                height: 48,
                child: SFButtonOutLined(
                    title: Keys.showContract,
                    textStyle: TextStyles.bold16Blue,
                    borderColor: AppColors.blue,
                    onPressed: () {}),
              ),
            ),
          ],
        )
      ],
    );
  }
}
