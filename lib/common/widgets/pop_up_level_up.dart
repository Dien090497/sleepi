import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpLevelUp extends StatelessWidget {
  const PopUpLevelUp(
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
              keyText: Keys.levelUp,
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 20),
            SFIcon(icon),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SFText(keyText: 'Lv $level', style: TextStyles.blue14),
            ),
            const SizedBox(height: 32),
            Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                    text: 'Level up to ',
                    style: TextStyles.lightGrey14,
                    children: [
                      TextSpan(text: 'Lv $level', style: TextStyles.bold14Blue),
                    ]),
              ),
            ),
            const SizedBox(height: 8),
            SFCard(
              margin: EdgeInsets.zero,
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
              child: Row(
                children: [
                  SFText(
                    keyText: Keys.attributes,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText: '+2 Luck',
                      style: TextStyles.blue16,
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
                    keyText: Keys.attributes,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText: '+2 Luck',
                      style: TextStyles.blue16,
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
                )),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: Keys.confirm,
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
