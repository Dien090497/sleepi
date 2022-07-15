import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpConfirmWakeUp extends StatelessWidget {
  const PopUpConfirmWakeUp({this.message, this.onPressed, Key? key})
      : super(key: key);

  final String? message;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: SFText(
            keyText: LocaleKeys.you_have_only_just_started,
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
                text: LocaleKeys.cancel,
                width: double.infinity,
                textStyle: TextStyles.w600LightGreySize16,
                color: AppColors.light4,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SFButton(
                text: LocaleKeys.confirm,
                width: double.infinity,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pushNamed(context, R.result);
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
