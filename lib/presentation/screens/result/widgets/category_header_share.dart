import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/result/layout/pre_result_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class CategoryHeaderShare extends StatelessWidget {
  const CategoryHeaderShare({Key? key, required this.preResultParams})
      : super(key: key);

  final PreResultParams preResultParams;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 80,
            width: 95.w,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                    const SFIcon(
                      Ics.icSlft,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    SFText(
                      keyText:
                          double.parse(preResultParams.resultModel.actualEarn!)
                              .formatBalance2Digits,
                      style: const TextStyle(
                          fontSize: 16,
                          color: AppColors.blue,
                          fontWeight: FontWeight.w700,
                          height: 24 / 16),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 4,
                // ),
                // SFText(
                //   keyText: '~ 100 USD',
                //   style: TextStyles.lightGrey10,
                // ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 95.w,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                  keyText: '${preResultParams.resultModel.sleepDurationTime}',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w700,
                      height: 24 / 16),
                ),
              ],
            ),
          ),
          Container(
            height: 80,
            width: 95.w,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
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
                  keyText: '${preResultParams.resultModel.sleepQuality}',
                  style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.blue,
                      fontWeight: FontWeight.w700,
                      height: 24 / 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
