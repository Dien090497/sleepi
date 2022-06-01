import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpItem extends StatelessWidget {
  const PopUpItem(
      {Key? key, required this.icon, required this.onConfirm, this.onCancel})
      : super(key: key);

  final String icon;
  final VoidCallback onConfirm;
  final VoidCallback? onCancel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: "ID",
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 20),
        SFIcon(icon),
        const SizedBox(height: 24),
        SFText(keyText: 'Level 5', style: TextStyles.lightGrey14),
        const SizedBox(height: 32),
        SFCard(
          width: double.infinity,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                keyText: LocaleKeys.effect,
                style: TextStyles.lightWhite16,
              ),
              const SizedBox(height: 4),
              SFText(
                keyText: LocaleKeys.displays_message_effect_item,
                style: TextStyles.lightGrey14,
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: SFButton(
                  text: LocaleKeys.cancel,
                  textStyle: TextStyles.w600LightGreySize16,
                  color: AppColors.light4,
                  onPressed: () {
                    onCancel;
                    Navigator.maybePop(context);
                  }),
            ),
            const SizedBox(
              width: 16.0,
            ),
            Expanded(
              child: SFButton(
                text: LocaleKeys.confirm,
                textStyle: TextStyles.bold14LightWhite,
                color: AppColors.blue,
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
    );
  }
}
