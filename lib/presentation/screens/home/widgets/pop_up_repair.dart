import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PopUpRepair extends StatelessWidget {
  const PopUpRepair(
      {Key? key,
      required this.icon,
      required this.cost,
      required this.level,
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
              keyText: LocaleKeys.repair,
              style: TextStyles.white1w700size16,
            ),
            const SizedBox(height: 20),
            SFIcon(icon),
            const SizedBox(height: 24),
            SFText(
              keyText: LocaleKeys.durability,
              suffix: ' : 78/100',
              style: TextStyles.white16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: SfSlider(
                value: 78,
                min: 0,
                max: 100,
                activeColor: AppColors.green,
                thumbIcon: Container(
                  width: 16,
                  height: 16,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                    shape: BoxShape.circle,
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: AppColors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                onChanged: (v) {},
              ),
            ),
            const SizedBox(height: 32),
            const SFLabelValue(
              label: LocaleKeys.cost,
              value: '120 SLFT',
              styleValue: TextStyles.white16,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.cancel,
                    onPressed: onCancel,
                    width: double.infinity,
                    textStyle: TextStyles.lightGrey16,
                    color: AppColors.light4,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.confirm,
                    onPressed: () {
                      onConfirm();
                      Navigator.pop(context);
                      showSuccessfulDialog(context);
                    },
                    width: double.infinity,
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
