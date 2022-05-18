import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

import '../../../../common/routes/app_routes.dart';
import '../../../../common/style/app_colors.dart';
import '../../../../di/translations/keys.dart';

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
                SFText(keyText: Keys.tvlInSleefi, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                const SizedBox(height: 12.0,),
                SFText(keyText: "XXXXXXX  SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                const SizedBox(height: 12.0,),
                SFText(keyText: "XXXXXXX  USD", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
              ],
            )
        ),
        const SizedBox(height: 30,),
        Container(
            height: 129,
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: GestureDetector(
                    child: const Icon(Icons.settings, size: 32,),
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: SFText(keyText: Keys.displaysMessageFromStakingSlftDetail,style: const TextStyle(color: AppColors.white),),
                    )),),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(keyText: Keys.earningToken, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    SFText(keyText: "＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(keyText: Keys.mintingDiscount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    SFText(keyText: "＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SFText(keyText: Keys.levelUpDiscount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    SFText(keyText: "＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  ],
                ),
              ],
            )
        ),
        const SizedBox(height: 30,),
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
                    child: GestureDetector(child: const Icon(Icons.settings, size: 32,), onTap: () {},),
                  ),
                  SFText(keyText: Keys.stakeTokens, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(keyText: Keys.yourSlftEarned, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXXXX    SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(keyText: Keys.yourStakedAmount, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXXXX    SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SFText(keyText: Keys.apr, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXX%", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SFText(keyText: Keys.deposit, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: Keys.withdraw, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  SFText(keyText: Keys.compound, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  ],
              )
          ),
        ),
        const SizedBox(height: 30,),
        Container(
            height: 159,
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                const SizedBox(height: 18),
                SFText(keyText: Keys.buySlft, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                const SizedBox(height: 12.0,),
                SFText(keyText: Keys.showContract, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
              ],
            )
        ),
      ],
    );
  }
}
