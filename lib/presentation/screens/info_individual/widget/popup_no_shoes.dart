import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class PopupNoShoes extends StatelessWidget {
  const PopupNoShoes({Key? key}) : super(key: key);

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
            const SizedBox(height: 20),
            const SFIcon(
              Imgs.errorNoBed,
              height: 70,
            ),
            const SizedBox(height: 32),
            SFText(
              keyText: LocaleKeys.no_bed,
              style: TextStyles.lightGrey14,
            ),
            const SizedBox(height: 32),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white.withOpacity(0.05)),
              child: Padding(
                padding: const EdgeInsets.only(
                  top: 18.0,
                  left: 24,
                  right: 45,
                  bottom: 53
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SFText(
                          keyText: LocaleKeys.id,
                          style: TextStyles.lightGrey12,
                        ),
                        SFText(
                          keyText: LocaleKeys.level,
                          style: TextStyles.lightGrey12,
                        ),
                      ],
                    ),
                    const SizedBox(height: 59,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SFText(
                          keyText: LocaleKeys.class_sf,
                          style: TextStyles.lightGrey12,
                        ),
                        SFText(
                          keyText: LocaleKeys.bed_mint,
                          style: TextStyles.lightGrey12,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: SFButton(
                    text: LocaleKeys.cancel,
                    onPressed: () {
                      Navigator.pop(context);
                    },
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
                      Navigator.pop(context);
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
