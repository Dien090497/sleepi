import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/average_widget.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class AverageInfoWidget extends StatelessWidget {
  const AverageInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> texts = [
      LocaleKeys.average_of_bed_time,
      LocaleKeys.average_of_woke_up,
      LocaleKeys.average_of_sleep_duration,
      LocaleKeys.average_of_sleep_quality
    ];
    List<String> averages = [
      "10:55","09:55","07:55","87/100",
    ];
    List<Color> colors = [
      AppColors.blue.withOpacity(0.15),
      AppColors.yellow.withOpacity(0.15),
      AppColors.red.withOpacity(0.15),
      AppColors.green.withOpacity(0.15)
    ];
    List<TextStyle> textStyleTitle = [
      TextStyles.blue14,
      TextStyles.yellow14,
      TextStyles.red14,
      TextStyles.green14
    ];
    List<TextStyle> textStyleNum = [
      TextStyles.bold24Blue,
      TextStyles.bold24Yellow,
      TextStyles.bold24Red,
      TextStyles.bold24Green
    ];
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: (1 / .75),
      crossAxisSpacing: 15.0,
      mainAxisSpacing: 16.0,
      shrinkWrap: true,
      children: List.generate(texts.length, (i) {
        return AverageWidget(
          title: texts[i],
          average: averages[i],
          textStyle: textStyleTitle[i],
          textStyleNumber: textStyleNum[i],
          color: colors[i],
        );
      }),
    );
  }
}
