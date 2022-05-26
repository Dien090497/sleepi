import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class TabSLFTDetail extends StatelessWidget {
  const TabSLFTDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
            height: 128,
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                const SizedBox(height: 18),
                SFText(
                    keyText: Keys.tvlInSleefi, style: TextStyles.bold20black),
                const SizedBox(
                  height: 12.0,
                ),
                SFText(keyText: "XXXXXXX  SLFT", style: TextStyles.bold20black),
                const SizedBox(
                  height: 12.0,
                ),
                SFText(keyText: "XXXXXXX  USD", style: TextStyles.bold20black),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        Container(
            height: 129,
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: const Icon(
                      Icons.settings,
                      size: 32,
                    ),
                    onTap: () =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: SFText(
                        keyText: Keys.displaysMessageFromStakingSlftDetail,
                        style: const TextStyle(color: AppColors.white),
                      ),
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(
                        keyText: Keys.earningToken,
                        style: TextStyles.bold20black),
                    SFText(keyText: "＋X％", style: TextStyles.bold20black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(
                        keyText: Keys.mintingDiscount,
                        style: TextStyles.bold20black),
                    SFText(keyText: "＋X％", style: TextStyles.bold20black),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(
                        keyText: Keys.levelUpDiscount,
                        style: TextStyles.bold20black),
                    SFText(keyText: "＋X％", style: TextStyles.bold20black),
                  ],
                ),
              ],
            )),
        const SizedBox(
          height: 30,
        ),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, R.taking),
          child: Container(
              height: 265,
              padding: const EdgeInsets.only(left: 15.0),
              width: double.infinity,
              color: AppColors.greyBottomNavBar,
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      child: const Icon(
                        Icons.settings,
                        size: 32,
                      ),
                      onTap: () {},
                    ),
                  ),
                  SFText(
                      keyText: Keys.stakeTokens, style: TextStyles.bold20black),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(
                          keyText: Keys.yourSlftEarned,
                          style: TextStyles.bold20black),
                      SFText(
                          keyText: "XXXXX    SLFT",
                          style: TextStyles.bold20black),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(
                          keyText: Keys.yourStakedAmount,
                          style: TextStyles.bold20black),
                      SFText(
                          keyText: "XXXXX    SLFT",
                          style: TextStyles.bold20black),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SFText(keyText: Keys.apr, style: TextStyles.bold20black),
                      SFText(keyText: "XXX%", style: TextStyles.bold20black),
                    ],
                  ),
                  const SizedBox(
                    height: 12.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SFText(
                          keyText: Keys.deposit, style: TextStyles.bold20black),
                      SFText(
                          keyText: Keys.withdraw,
                          style: TextStyles.bold20black),
                    ],
                  ),
                  SFText(keyText: Keys.compound, style: TextStyles.bold20black),
                ],
              )),
        ),
        const SizedBox(
          height: 30,
        ),
        Container(
            height: 159,
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                const SizedBox(height: 18),
                SFText(keyText: Keys.buySlft, style: TextStyles.bold20black),
                const SizedBox(
                  height: 12.0,
                ),
                SFText(
                    keyText: Keys.showContract, style: TextStyles.bold20black),
              ],
            )),
      ],
    );
  }
}
