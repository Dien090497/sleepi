import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

import '../../../../common/routes/app_routes.dart';
import '../../../../common/style/app_colors.dart';

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
                SFText(keyText: "TVL in SleeFi", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
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
                    onTap: () => ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Staking not only allows you to increase your tokens, but also to gain in-game benefits.Staking rewards are given based on the amount of your deposit. Also, rewards are only granted during staking."),
                    )),),
                ),
                SFText(keyText: "Earning  Token　＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                SFText(keyText: "Minting Discount   ＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                SFText(keyText: "Level up Discount　＋X％", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
              ],
            )
        ),
        const SizedBox(height: 30,),
        GestureDetector(
          onTap: () => Navigator.pushNamed(context, R.wireTaking),
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
                  SFText(keyText: "Stake Tokens（Flexible)", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(keyText: "Your SLFT Earned", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXXXX    SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(keyText: "Your Staked Amount", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXXXX    SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SFText(keyText: "APR", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "XXX%", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  const SizedBox(height: 12.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SFText(keyText: "Deposit", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      SFText(keyText: "Withdraw", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                    ],
                  ),
                  SFText(keyText: "Compound", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
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
                SFText(keyText: "Buy SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                const SizedBox(height: 12.0,),
                SFText(keyText: "Show contract", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
              ],
            )
        ),
      ],
    );
  }
}
