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
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/resources/resources.dart';

class BottomBarWidget extends StatelessWidget {
  const BottomBarWidget({Key? key}) : super(key: key);

  Widget itemBottomBar(
      BuildContext context, String icon, String key, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width / 6,
        height: 80,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SFIcon(
              icon,
              color: AppColors.lightGrey,
            ),
            const SizedBox(
              height: 6,
            ),
            SFText(
              keyText: key,
              style: TextStyles.lightGrey12,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: AppColors.dark,
          border: Border(
              top: BorderSide(
            width: 1,
            color: AppColors.lightDark,
          ))),
      height: 80,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          itemBottomBar(context, Ics.levelUp, Keys.levelUp, () {
            showCustomDialog(
              context,
              children: [
                PopUpLevelUp(
                    icon: Ics.middleBed,
                    level: 20,
                    cost: 21,
                    time: 1260,
                    onConfirm: () {
                      Navigator.pop(context);
                    }),
              ],
            );
          }),
          itemBottomBar(context, Ics.repair, Keys.repair, () {
            showCustomDialog(
              context,
              children: [
                PopUpRepair(
                  icon: Ics.shortBed,
                  cost: 120,
                  level: 20,
                  time: 122,
                  onConfirm: () {},
                ),
              ],
            );
          }),
          itemBottomBar(context, Ics.heart, Keys.mint, () {
            Navigator.pushNamed(context, R.mint);
          }),
          itemBottomBar(context, Ics.shopping, Keys.sell, () {
            showCustomDialog(context, children: [
              PopUpSell(
                onConfirm: () {},
                time: 1,
                cost: 1,
                icon: Ics.flexibleBed,
                level: 2,
              ),
            ]);
          }),
          itemBottomBar(context, Ics.recycling, Keys.recycle, () {
            Navigator.pushNamed(context, R.recycle);
          }),
          itemBottomBar(context, Ics.transfer, Keys.transfer, () {
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
          }),
        ],
      ),
    );
  }
}
