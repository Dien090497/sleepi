import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';

import '../../../../common/widgets/sf_text.dart';
import '../../../../di/translations/keys.dart';

class TabSpendingDetail extends StatelessWidget {
  const TabSpendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: SFText(keyText: Keys.spendingAccount, style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
            ),
            ElevatedButton(
              onPressed: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: SFText(keyText: Keys.displaysMessageFromSpendingDetail, style: const TextStyle(color: AppColors.white),),
              )),
              child: const Icon(Icons.question_mark, color: Colors.black, size: 20,),
              style: ElevatedButton.styleFrom(
                shape: const CircleBorder(),
                side: const BorderSide(color: AppColors.black,width: 1),
                primary: Colors.greenAccent, // <-- Button color
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0,),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.black, width: 2),
            borderRadius: BorderRadius.circular(16.0),
            boxShadow:  [
              BoxShadow(
                color: Colors.black.withOpacity(0.6),
                blurRadius: 4,
                offset: const Offset(2, 4), // Shadow position
              ),
            ],
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width : 148,
                      height: 48,
                      decoration: const BoxDecoration(
                        color: AppColors.greyBottomNavBar),
                      child: Center(child: SFText(keyText: Keys.slft, style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold))),
                    ),
                    SFText(keyText: "0", style: const TextStyle(fontSize: 20, color: AppColors.black),),
                  ],
                ),
              ),
              const Divider(color: AppColors.black, thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width : 148,
                      height: 48,
                      decoration: const BoxDecoration(
                          color: AppColors.greyBottomNavBar),
                      child: Center(child: SFText(keyText: Keys.slgt, style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold))),
                    ),
                    SFText(keyText: "0", style: const TextStyle(fontSize: 20, color: AppColors.black),),
                  ],
                ),
              ),
              const Divider(color: AppColors.black, thickness: 1),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width : 148,
                      height: 48,
                      decoration: const BoxDecoration(
                          color: AppColors.greyBottomNavBar),
                      child: Center(child: SFText(keyText: Keys.avax, style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold))),
                    ),
                    SFText(keyText: "0", style: const TextStyle(fontSize: 20, color: AppColors.black),),
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12.0,),
        SFText(keyText: Keys.baceOnSolana, style: const TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600),),
        const SizedBox(height: 12.0,),
        Expanded(
          child: Container(
            width: double.infinity,
            color: AppColors.greyBottomNavBar,
            child: Column(
              children: [
                const SizedBox(height: 30),
                GestureDetector(
                    onTap: () => Navigator.pushNamed(context, R.staking),
                    child: SizedBox(
                        width: 268,
                        child: SFText(keyText: Keys.stakeToGetBenefits,style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.w600), textAlign: TextAlign.center,),)),
                const SizedBox(height: 30,),
                Center(child: SFText(keyText: Keys.transfer, style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.w600),)),
              ],
            )
          ),
        )
      ],
    );
  }
}
