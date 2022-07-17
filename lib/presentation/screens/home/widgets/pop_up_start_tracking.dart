import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpConfirmStartTracking extends StatelessWidget {
  const PopUpConfirmStartTracking({this.onPressed, Key? key}) : super(key: key);

  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SFText(
            keyText: LocaleKeys.start_sleep_tracking,
            style: TextStyles.w600LightWhiteSize16,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButton(
                text: LocaleKeys.yes,
                width: double.infinity,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SFButtonOutLined(
                fixedSize: Size(102.w, 48.h),
                title: LocaleKeys.no,
                textStyle: TextStyles.bold16Blue,
                borderColor: AppColors.blue,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
      ],
    );
  }
}
