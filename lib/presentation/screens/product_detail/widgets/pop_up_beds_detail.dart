import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpBedsDetail extends StatelessWidget {
  const PopUpBedsDetail(
      {Key? key,
        required this.icon,
        required this.level,
        required this.cost,
        required this.time,
        required this.onConfirm,
        this.onCancel})
      : super(key: key);

  final String icon;
  final int cost;
  final int level;
  final int time;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.close,
              color: AppColors.lightGrey,
            ),
          ),
        ),
        Column(
          children: [
            SFText(
              keyText: Keys.matchingBed,
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 20),
            SFIcon(icon),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Ics.shortBed),
                  ),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SFIcon(icon),
                  ),
                ),

                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Ics.bedsCouple),
                  ),
                ),

                const SizedBox(width: 10,),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                        color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Ics.bedBunk),
                  ),
                )
              ],
            ),
            const SizedBox(height: 26,),
            SFCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Row(
                children: [
                  SFText(
                    keyText: Keys.cost,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText: '21 SLFT',
                      style: TextStyles.white16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            SFCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Row(
                children: [
                  SFText(
                    keyText: Keys.cost,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText: '21 SLFT',
                      style: TextStyles.white16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    child: SFButton(
                      text: Keys.cancel,
                      onPressed: onCancel,
                      textStyle: TextStyles.lightGrey16,
                      color: AppColors.whiteOpacity5,
                    )),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: Keys.confirm,
                    textStyle: TextStyles.white16,
                    gradient: AppColors.blueGradient,
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                      showSuccessfulDialog(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
