import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';

// import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class BoxInfoWidget extends StatelessWidget {
  const BoxInfoWidget({
    Key? key,
    required this.bed,
  }) : super(key: key);
  final BedEntity bed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _Col(
          children: [
            SFButton(
              text: bed.contractAddress.formatAddress,
              color: Colors.white.withOpacity(0.05),
              height: 32,
              textStyle: TextStyles.lightWhite14,
            ),
            const SizedBox(height: 16),
            Text(
              '${LocaleKeys.time.tr()}: 6h -8h',
              style: TextStyles.lightGrey14,
            ),
            const SizedBox(height: 24),
          ],
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (bed.quality != null)
                SFButton(
                  text: bed.quality!.reCase(StringCase.titleCase),
                  textStyle: TextStyles.blue14,
                  color: Colors.blue.withOpacity(0.05),
                  radius: 50.h,
                ),
              SizedBox(width: 8.w),
              SFButton(
                text: bed.type.reCase(StringCase.titleCase),
                textStyle: TextStyles.green14,
                color: Colors.green.withOpacity(0.05),
                radius: 50.h,
              ),
              SizedBox(width: 8.w),
              SFButton(
                text: '${bed.durability}/100',
                textStyle: TextStyles.yellow14,
                color: Colors.yellow.withOpacity(0.05),
                radius: 50,
              ),
            ],
          ),
        ),
        _Col(
          children: [
            const SizedBox(height: 24),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SFPercentBorderGradient(
                  valueActive: 20,
                  totalValue: 100,
                  linearGradient: AppColors.gradientBlueButton,
                  lineHeight: 18,
                  barRadius: 20,
                  backgroundColor: Colors.white.withOpacity(0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SFText(
                    keyText: '${LocaleKeys.level.tr()} ${bed.level}',
                    style: TextStyles.white10,
                  ),
                )
              ],
            ),
            const SizedBox(height: 8),
            Stack(
              alignment: Alignment.centerLeft,
              children: [
                SFPercentBorderGradient(
                  valueActive: 30,
                  totalValue: 100,
                  linearGradient: AppColors.gradientBluePurple,
                  lineHeight: 18,
                  barRadius: 20,
                  backgroundColor: Colors.white.withOpacity(0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '${LocaleKeys.bed_mint.tr()} ${bed.isMint}/${bed.bedMint}',
                    style: TextStyles.white10,
                  ),
                )
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _Col extends StatelessWidget {
  const _Col({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(children: children),
    );
  }
}
