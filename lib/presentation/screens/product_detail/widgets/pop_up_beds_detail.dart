import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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
              keyText: LocaleKeys.matching_bed,
              style: TextStyles.white1w700size16,
            ),
            SFIcon(icon, height: 160,),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Imgs.shortBed),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: SFIcon(icon),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Imgs.flexibleBed),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
                    decoration: BoxDecoration(
                      color: AppColors.whiteOpacity5,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const SFIcon(Imgs.middleBed),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 26,
            ),
            const SFLabelValue(
              label: "ID",
              value: LocaleKeys.level,
              styleLabel: TextStyles.lightGrey16,
              styleValue: TextStyles.lightWhite16,
            ),
            const SizedBox(height: 8),
            const SFLabelValue(
              label: LocaleKeys.close,
              value: LocaleKeys.bed_mint,
              styleLabel: TextStyles.lightGrey16,
              styleValue: TextStyles.lightWhite16,
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                    child: SFButton(
                  text: LocaleKeys.cancel,
                  onPressed: onCancel,
                  textStyle: TextStyles.lightGrey16,
                  color: AppColors.whiteOpacity5,
                  width: double.infinity,
                )),
                const SizedBox(width: 12),
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.confirm,
                    textStyle: TextStyles.white16,
                    gradient: AppColors.blueGradient,
                    width: double.infinity,
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
