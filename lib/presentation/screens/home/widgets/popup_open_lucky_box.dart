import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpOpenLuckyBox extends StatelessWidget {
  const PopUpOpenLuckyBox({
    Key? key,
    required this.image,
    required this.id,
    required this.waitingTime,
    required this.onConfirm,
    required this.cost,
  }) : super(key: key);
  final String image;
  final int id;
  final String cost;
  final int waitingTime;
  final Function() onConfirm;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.lucky_box,
          style: TextStyles.w600LightWhiteSize16,
        ),
        SFIcon(image, width: 120, height: 120),
        const SizedBox(height: 24.0),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: id.toString(),
            style: TextStyles.blue14,
          ),
        ),
        const SizedBox(height: 24.0),
        SFCard(
          margin: EdgeInsets.zero,
          width: double.infinity,
          radius: 8,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: SFText(
            keyText:
                LocaleKeys.you_can_open_the_luck_box.tr(args: ['$waitingTime']),
            style: TextStyles.w400lightGrey12,
          ),
        ),
        const SizedBox(height: 17),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(keyText: LocaleKeys.cost, style: TextStyles.lightGrey14),
            SFText(keyText: '$cost AVAX', style: TextStyles.lightWhite16W700),
          ],
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
                  onConfirm;
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
