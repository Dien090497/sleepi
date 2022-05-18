import 'package:flutter/material.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';

import '../../../../common/style/app_colors.dart';
import '../../../../common/widgets/sf_text.dart';
import '../../../../di/translations/keys.dart';

class TakingScreen extends StatelessWidget {
  const TakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(height: 140,),
            Container(
                height: 316,
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                color: AppColors.greyBottomNavBar,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Padding(padding: const EdgeInsets.only(left: 12.0),child: SFText(keyText: Keys.stakeSlft, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.black),)),
                    const SizedBox(height: 16.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SFText(keyText: Keys.yourSlftInSpending, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                        SFText(keyText: "XXXXXXX  SLFT", style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),),
                      ],
                    ),
                    const SizedBox(height: 24.0,),
                   Row(
                     children: [
                      Expanded(flex: 3, child:  SFText(keyText: Keys.stakeWithdraw, style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.black),),),
                       Expanded(
                         flex: 1,
                         child:
                         GestureDetector(
                           onTap: () {},
                           child: SFText(keyText: Keys.max, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: AppColors.black),)),),
                       Expanded(flex: 4, child:  SFText(keyText: "XXX    SLFT", style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w700, color: AppColors.black),),)
                    ],
                   ),
                    const SizedBox(height: 40,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (_) => const PopUpStaking()
                              );
                            },
                            child: SFText(keyText: Keys.confirm, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.black),)),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: SFText(keyText: Keys.cancel, style: const TextStyle(fontSize: 32, fontWeight: FontWeight.w700, color: AppColors.black),))
                      ],
                    )
                  ],
                )
            ),

          ],
        ),
      ),
    );
  }
}
