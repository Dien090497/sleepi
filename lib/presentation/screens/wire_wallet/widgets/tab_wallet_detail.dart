import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

import '../../../../common/widgets/sf_text.dart';

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
          child: SFText(keyText: "AVAX C-Chain", style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold)),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
          decoration: const BoxDecoration(
              color: AppColors.greyBottomNavBar),
          child: SFText(keyText: "0 AVAX", style: const TextStyle(fontSize: 32, color: AppColors.black, fontWeight: FontWeight.bold)),
        ),
        const SizedBox(height: 8.0,),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          decoration:  BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(color: AppColors.black),
          ),
          child: SFText(keyText: "Eq7fbho....9aj92as", style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ),
        const SizedBox(height: 16.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.download, color: Colors.greenAccent, size: 40,),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8.0),
                      primary: AppColors.white,
                      side: const BorderSide(color: AppColors.black, width: 1)
                  ),
                ),
                const SizedBox(height: 8.0,),
                SFText(keyText: "Receive", style: const TextStyle(color: AppColors.black, fontSize: 13.0),)
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
                        child: const Icon(CupertinoIcons.repeat, color: Colors.greenAccent, size: 40,),
                      ),
                      const SizedBox(width: 20.0,),
                      InkWell(
                        onTap: () {},
                        child: const Icon(Icons.arrow_upward, color: Colors.greenAccent, size: 40,),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 8.0,),
                Row(
                  children: [
                    SFText(keyText: "To Spending", style: const TextStyle(color: AppColors.black, fontSize: 13.0),),
                    const SizedBox(width: 12.0,),
                    SFText(keyText: "To External", style: const TextStyle(color: AppColors.black, fontSize: 13.0),),
                  ],
                )
              ],
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.repeat, color: Colors.greenAccent, size: 40,),
                  style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(8.0),
                      primary: AppColors.white,
                      side: const BorderSide(color: AppColors.black, width: 1)
                  ),
                ),
                const SizedBox(height: 8.0,),
                SFText(keyText: "Trade", style: const TextStyle(color: AppColors.black, fontSize: 13.0),)
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
                  child: SFText(keyText: "Wallet Account", style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Icon(Icons.question_mark, color: Colors.black, size: 20,),
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                    side: const BorderSide(color: AppColors.black,width: 1),
                    primary: Colors.greenAccent, // <-- Button color
                  ),
                ),
              ],
            ),
            ElevatedButton.icon(
              icon: const Icon(
                Icons.crop_square,
                color: Colors.greenAccent,
                size: 30.0,
              ),
              label: SFText(keyText: "Buy"),
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
                      SFText(keyText: "SLFT", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
                      SFText(keyText: "XXXXXXXX", style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),),
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
