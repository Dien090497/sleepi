import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class BottomBarMarketPlaceWidget extends StatelessWidget {
  const BottomBarMarketPlaceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: 56,
              decoration: BoxDecoration(
                gradient: AppColors.gradientBlueButton,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            Container(
              height: 54,
              margin: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                color: AppColors.lightDark,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: SFText(
                        keyText: '1000 SLFT',
                        style: TextStyles.white16,
                      ),
                    ),
                    SFButton(
                      text: LocaleKeys.buy_now,
                      textStyle: TextStyles.white14W700,
                      gradient: AppColors.gradientBlueButton,
                      onPressed: () {
                        // showCustomDialog(context,
                        //     children: [const PopUpBuyMarketPlace()]);
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
