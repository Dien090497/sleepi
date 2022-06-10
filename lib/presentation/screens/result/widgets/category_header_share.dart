import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class CategoryHeaderShare extends StatelessWidget {
  const CategoryHeaderShare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          width: 16,
        ),
        Container(
          height: 80,
          width: 95,
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SFText(
                keyText: LocaleKeys.earning.tr(),
                style: TextStyles.lightGrey11,
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: SFIcon(
                      Ics.icSlft,
                    ),
                  ),
                  const SizedBox(
                    width: 4,
                  ),
                  SFText(
                    keyText: '1,000',
                    style: const TextStyle(
                        fontSize: 16,
                        color: AppColors.blue,
                        fontWeight: FontWeight.w700,
                        height: 24 / 16),
                  ),
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              SFText(
                keyText: '~ 100 USD',
                style: TextStyles.lightGrey10,
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Container(
          height: 80,
          width: 95,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SFText(
                keyText: LocaleKeys.sleep_duration,
                style: TextStyles.lightGrey11,
              ),
              SFText(
                keyText: '7h35min',
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w700,
                    height: 24 / 16),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 13,
        ),
        Container(
          height: 80,
          width: 95,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: AppColors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              SFText(
                keyText: LocaleKeys.sleep_score,
                style: TextStyles.lightGrey11,
              ),
              SFText(
                keyText: '99/100',
                style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.blue,
                    fontWeight: FontWeight.w700,
                    height: 24 / 16),
              ),
            ],
          ),
        ),
        const SizedBox(
          width: 16,
        ),
      ],
    );
  }
}
