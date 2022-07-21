import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class AttributeProcessWidget extends StatelessWidget {
  const AttributeProcessWidget({
    Key? key,
    required this.linkImage,
    required this.title,
    required this.totalValue,
    required this.valueActive,
    this.isUpGrade = false,
  }) : super(key: key);

  final String linkImage;
  final String title;
  final double totalValue;
  final double valueActive;
  final bool isUpGrade;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          isUpGrade ? const SizedBox() : SFIcon(linkImage),
          const SizedBox(width: 5),
          Expanded(
            flex: 2,
            child: SFText(
              keyText: title,
              style: TextStyles.lightGrey14,
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            flex: 3,
            child: SFPercentBorderGradient(
              totalValue: totalValue,
              valueActive: valueActive,
              backgroundColor: AppColors.borderDarkColor,
              linearGradient: AppColors.gradientBlueButton,
              lineHeight: 6,
              barRadius: 20,
            ),
          ),
          const SizedBox(width: 10),
          isUpGrade
              ? Container(
                  alignment: Alignment.centerRight,
                  width: 50,
                  child: SFText(
                    keyText:
                        '${(valueActive / totalValue * 100).toStringAsFixed(0)} %',
                    style: TextStyles.bold14LightWhite,
                  ),
                )
              : SFText(
                  keyText: (valueActive / totalValue * 10).toStringAsFixed(1),
                  style: TextStyles.bold14LightWhite,
                ),
        ],
      ),
    );
  }
}
