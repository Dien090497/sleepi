import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PupUpConfirmSpeedUp extends StatelessWidget {
  const PupUpConfirmSpeedUp(
      {Key? key, required this.amount, required this.onConfirm})
      : super(key: key);
  final String amount;
  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.speed_luck_box_with_cost.tr(args: [amount]),
          style: TextStyles.w600LightWhiteSize16,
        ),
        const SizedBox(height: 33.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButtonOutLined(
                fixedSize: Size(102.w, 48.h),
                title: LocaleKeys.cancel,
                textStyle: TextStyles.bold16Blue,
                borderColor: AppColors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SFButton(
                text: LocaleKeys.speed_up,
                width: double.infinity,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {
                  Navigator.pop(context);
                  onConfirm();
                },
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
