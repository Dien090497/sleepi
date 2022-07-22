import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpLevelUp extends StatelessWidget {
  const PopUpLevelUp(
      {Key? key,
        required this.icon,
        required this.level,
        required this.cost,
        required this.sleepTime,
        required this.requiredTime,
        required this.onConfirm,
        this.onCancel})
      : super(key: key);

  final String icon;
  final int cost;
  final int level;
  final int? requiredTime;
  final int? sleepTime;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
          children: [
            SFText(
              keyText: LocaleKeys.level_up,
              style: TextStyles.white1w700size16,
            ),
            SFIcon(icon, height: 160,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: SFText(keyText: 'Lv $level', style: TextStyles.blue14),
            ),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: SFText(
                      keyText: LocaleKeys.level_up_to,
                       style: TextStyles.lightGrey14,)
                ),
                SFText(
                  keyText: 'Lv ${level + 1}',
                  style: TextStyles.bold14Blue)
              ],
            ),
            const SizedBox(height: 8),
            SFLabelValue(
              label: LocaleKeys.cost,
              value: '$cost SLFT',
              styleValue: TextStyles.textColorSize16,
            ),
            const SizedBox(height: 8),
            SFLabelValue(
              label: LocaleKeys.required_time,
              value: '${requiredTime ?? 0} mins',
              styleValue: TextStyles.textColorSize16,
            ), const SizedBox(height: 8),
            SFLabelValue(
              label: LocaleKeys.sleep_time,
              value: '${sleepTime ?? 0} mins',
              styleValue: TextStyles.textColorSize16,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.cancel,
                    onPressed: () {
                      onCancel;
                      Navigator.pop(context);
                    },
                    textStyle: TextStyles.lightGrey16,
                    color: AppColors.light4,
                    width: double.infinity,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.confirm,
                    width: double.infinity,
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                    },
                    textStyle: TextStyles.white16,
                    gradient: AppColors.gradientBlueButton,
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
