import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpStaking extends StatelessWidget {
  const PopUpStaking({this.message, this.onPressed, Key? key})
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
            keyText: message ?? "",
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
                onPressed: () async {
                  await Navigator.maybePop(context);
                  if (onPressed != null) {
                    onPressed!();
                  }
                },
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: SFButton(
                text: LocaleKeys.no,
                width: double.infinity,
                textStyle: TextStyles.w600LightGreySize16,
                color: AppColors.light4,
                onPressed: () => Navigator.maybePop(context),
              ),
            ),
          ],
        )
      ],
    );
  }
}
