import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_level_up.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_repair.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: AppColors.greyBottomNavBar),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const PopUpLevelUp();
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/lv_up.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: 'Level Up',
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const PopUpRepair();
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/repair.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: 'Repair',
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, R.mint);
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/mint.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: 'Mint',
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
            Column(
              children: [
                Image.asset(
                  'assets/images/sell.png',
                  width: 40,
                  height: 40,
                ),
                const SizedBox(
                  height: 5,
                ),
                SFText(
                  keyText: 'Sell',
                  style: TextStyles.black10Bold,
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, R.recycle);
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/recyle.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: 'Recycle',
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return const PopUpTransfer();
                  },
                );
              },
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/transfer.png',
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: 'Transfer',
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
