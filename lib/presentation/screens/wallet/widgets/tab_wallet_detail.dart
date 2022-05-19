import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class TabWalletDetail extends StatelessWidget {
  const TabWalletDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 4.0,),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 12),
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: const BoxDecoration(
              color: AppColors.greyBottomNavBar),
          child: SFText(keyText: Keys.avaxCChain, style: TextStyles.bold32black),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: const BoxDecoration(
              color: AppColors.greyBottomNavBar),
          child: SFText(keyText: "0 AVAX", style: TextStyles.bold32black),
        ),
        const SizedBox(height: 8.0,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: AppColors.black),
          ),
          child: SFText(keyText: "Eq7fbho....9aj92as", style: TextStyles.grey12),
        ),
        const SizedBox(height: 16.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8.0),
                      primary: AppColors.white,
                      side: const BorderSide(color: AppColors.black, width: 1)
                  ),
                  child: const Icon(Icons.download, color: AppColors.greenAccent, size: 40,),
                ),
                const SizedBox(height: 8.0,),
                SFText(keyText: Keys.receive, style: TextStyles.black13)
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: const Icon(CupertinoIcons.repeat, color: AppColors.greenAccent, size: 40,),
                      ),
                      const SizedBox(width: 20.0,),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_upward, color: AppColors.greenAccent, size: 40,),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8.0,),
                Row(
                  children: [
                    SFText(keyText: Keys.toSpending, style: TextStyles.black13),
                    const SizedBox(width: 12.0,),
                    SFText(keyText: Keys.toExternal, style: TextStyles.black13),
                  ],
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8.0),
                      primary: AppColors.white,
                      side: const BorderSide(color: AppColors.black, width: 1)
                  ),
                  child: const Icon(Icons.repeat, color: AppColors.greenAccent, size: 40,),
                ),
                const SizedBox(height: 8.0,),
                SFText(keyText: Keys.trade, style: TextStyles.black13)
              ],
            ),
          ],
        ),
        const SizedBox(height: 20.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: SFText(keyText: Keys.walletAccount, style: TextStyles.bold20black),
                ),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: AppColors.black,width: 1),
                    primary: AppColors.greenAccent, // <-- Button color
                  ),
                  child: const Icon(Icons.question_mark, color: AppColors.black, size: 20,),
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.crop_square,
                color: AppColors.greenAccent,
                size: 30.0,
              ),
              label: SFText(keyText: Keys.buy),
              onPressed: () { },
              style: ElevatedButton.styleFrom(
                primary: AppColors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                  side: const BorderSide(color: AppColors.black,width: 1),
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            color: AppColors.greyBottomNavBar,
            child:  ListView.builder(
                itemCount: 10,
                shrinkWrap: true,
                padding: const EdgeInsets.all(16.0),
                itemBuilder: (BuildContext context,int index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SFText(keyText: Keys.slft, style: TextStyles.bold28black),
                      SFText(keyText: "XXXXXXXX", style: TextStyles.bold28black),
                    ],
                  );
                }
            ),
          ),
        )
      ],
    );
  }
}
