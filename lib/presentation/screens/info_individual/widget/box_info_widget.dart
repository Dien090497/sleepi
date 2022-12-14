import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'dart:math' as math;

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
            if (bed.startTime != null)
              Text(
                '${LocaleKeys.time.tr()}: ${bed.startTime!.formatBalanceToken}h - ${bed.endTime!.formatBalanceToken}h',
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: (bed.quality!.qualityBedColor).withOpacity(0.05),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                  child: Text(
                    '${bed.quality}'.reCase(StringCase.titleCase),
                    style: TextStyles.blue14
                        .copyWith(color: bed.quality!.qualityBedColor),
                  ),
                ),
              SizedBox(width: 8.w),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColors.blue.withOpacity(0.05),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: SFText(
                  keyText: bed.nftClass,
                  style: TextStyles.blue14,
                ),
              ),
              SizedBox(width: 8.w),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.yellow.withOpacity(0.05),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
                child: Text(
                  '${bed.durability.toInt()}/100',
                  style: TextStyles.yellow14,
                ),
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
                  valueActive:
                      math.min(bed.level.toDouble(), Const.bedLevelMax),
                  totalValue: Const.bedLevelMax,
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
                  valueActive:
                      math.min(bed.bedMint.toDouble(), Const.bedMintMax),
                  totalValue: Const.bedMintMax,
                  linearGradient: AppColors.gradientBluePurple,
                  lineHeight: 18,
                  barRadius: 20,
                  backgroundColor: Colors.white.withOpacity(0.05),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    '${LocaleKeys.bed_mint.tr()} ${bed.bedMint.toInt()}/${Const.bedMintMax.toInt()}',
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
