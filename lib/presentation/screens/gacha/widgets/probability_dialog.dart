import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_probability_config_response/probability_config.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_probability.dart';
import 'package:slee_fi/resources/resources.dart';

class ProbabilityDialog extends StatelessWidget {
  final bool normalGacha;
  final ProbabilityConfig? dialogData;
  const ProbabilityDialog({required this.dialogData,  required this.normalGacha, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SFText(
              keyText: LocaleKeys.probability,
              style: TextStyles.bold18LightWhite,
            ),
          ),
          const SizedBox(height: 24),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SFText(keyText: LocaleKeys.product_line_up,
                  style: TextStyles.bold14LightWhiteWithOpacity,),
                const SizedBox(height: 16),
                ItemsProbability(
                  // iconPath: Ics.icBedsProbability,
                  configInfo: dialogData?.configs,
                  // title: LocaleKeys.bed,
                  // style: TextStyles.bold14Blue,
                  // colorBgIcon: [
                  //   AppColors.blue.withOpacity(0.1),
                  //   AppColors.blue.withOpacity(0.1)
                  // ],
                ),
                const SizedBox(height: 12),
                // ItemsProbability(
                //   iconPath: Ics.icPillows,
                //   configInfo: dialogData?.jewels,
                //   title: LocaleKeys.jewels,
                //   style: TextStyles.bold14Green,
                //   colorBgIcon: [
                //     AppColors.green.withOpacity(0.1),
                //     AppColors.blue.withOpacity(0.1)
                //   ],
                // ),
                // const SizedBox(height: 12),
                // ItemsProbability(
                //   iconPath: Ics.jewel,
                //   configInfo: dialogData?.items,
                //   title: LocaleKeys.item,
                //   isGradient: true,
                //   colorBgIcon: [
                //     AppColors.blue.withOpacity(0.1),
                //     AppColors.purple.withOpacity(0.1)
                //   ],
                //   width: 45,
                //   height: 45,
                // ),
                // const SizedBox(height: 12),
                // ItemsProbability(
                //   iconPath: Imgs.doubleIcon,
                //   configInfo: dialogData?.token,
                //   title: LocaleKeys.token,
                //   isToken: true,
                //   style: TextStyles.bold14White,
                //   colorBgIcon: [
                //     AppColors.blue.withOpacity(0.1),
                //     AppColors.purple.withOpacity(0.1)
                //   ],
                //   width: 45,
                //   height: 45,
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
