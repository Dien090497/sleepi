import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpJewelMarketPlace extends StatelessWidget {
  const PopUpJewelMarketPlace(
      {Key? key,
        required this.icon,
        required this.name,
        required this.level,
        required this.id,
        required this.attribute,
        required this.effect,
        required this.onConfirmTap})
      : super(key: key);

  final String icon;
  final String name;
  final String level;
  final String id;
  final String attribute;
  final String effect;
  final VoidCallback onConfirmTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 12),
        SFText(
          keyText: LocaleKeys.buy,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppColors.purple.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          alignment: Alignment.center,
          padding: const EdgeInsets.all(24),
          child: SFIcon(icon),
        ),
        const SizedBox(height: 20),
        SFText(
          keyText: 'Luck Jewel ($level)',
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: id,
            style: TextStyles.blue14,
          ),
        ),
        const SizedBox(height: 32),
        SFCard(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Row(
            children: [
              SFText(
                keyText: LocaleKeys.attributes,
                style: TextStyles.lightGrey16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: SFText(
                  keyText: '+2 Luck',
                  style: TextStyles.blue16,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SFCard(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Row(
            children: [
              SFText(
                keyText: LocaleKeys.effect,
                style: TextStyles.lightGrey16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: SFText(
                  keyText: '+5% Base Luck',
                  style: TextStyles.blue16,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SFCard(
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
          child: Row(
            children: [
              SFText(
                keyText: LocaleKeys.cost,
                style: TextStyles.lightGrey16,
              ),
              const SizedBox(width: 4),
              Expanded(
                child: SFText(
                  keyText: '0.14 AVAX',
                  style: TextStyles.bold16LightWhite,
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
                child: SFButton(
                  text: LocaleKeys.cancel,
                  onPressed: () => Navigator.pop(context),
                  textStyle: TextStyles.lightGrey16,
                  color: AppColors.whiteOpacity5,
                  width: double.infinity,
                )),
            const SizedBox(width: 12),
            Expanded(
                child: SFButton(
                  text: LocaleKeys.confirm,
                  onPressed: onConfirmTap,
                  textStyle: TextStyles.white16,
                  gradient: AppColors.blueGradient,
                  width: double.infinity,
                )),
          ],
        ),
      ],
    );
  }
}
