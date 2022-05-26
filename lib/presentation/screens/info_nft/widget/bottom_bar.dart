import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/pop_up_level_up.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_repair.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/resources/resources.dart';

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
                showCustomDialog(
                  context,
                  children: [
                    PopUpLevelUp(
                        icon: Ics.longBed,
                        level: 3,
                        cost: 1,
                        time: 2300,
                        onConfirm: () {})
                  ],
                );
              },
              child: Column(
                children: [
                  const SFIcon(
                    Imgs.lvUp,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  SFText(
                    keyText: Keys.levelUp,
                    style: TextStyles.black10Bold,
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                showCustomDialog(
                  context,
                  children: [
                    PopUpRepair(
                      icon: Ics.shortBed,
                      cost: 120,
                      level: 3,
                      time: 122,
                      onConfirm: () {},
                    ),
                  ],
                );
              },
              child: Column(
                children: [
                  const SFIcon(
                    Imgs.repair,
                    width: 40,
                    height: 40,
                  ),
                  const SizedBox(height: 5),
                  SFText(
                    keyText: Keys.repair,
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
                  const SFIcon(
                    Imgs.mint,
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
                const SFIcon(
                  Imgs.sell,
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
                  const SFIcon(
                    Imgs.recyle,
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
                showCustomDialog(
                  context,
                  children: [
                    PopUpTransfer(
                      onConfirm: () {},
                      valueTransfer: 1,
                      fee: 1,
                    )
                  ],
                );
              },
              child: Column(
                children: [
                  const SFIcon(
                    Imgs.transfer,
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
