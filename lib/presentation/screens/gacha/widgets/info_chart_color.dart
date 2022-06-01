import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class InfoChartColor extends StatelessWidget {
  const InfoChartColor(
      {Key? key,
      required this.color,
      required this.typeBed,
      required this.valueInChart})
      : super(key: key);

  final Color color;
  final String typeBed;
  final String valueInChart;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          Container(
            height: 25,
            width: 25,
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          SFText(
            keyText: typeBed,
            style: TextStyles.lightWhite14,
          ),
          const Expanded(child: SizedBox()),
          SFText(
            keyText: valueInChart,
            style: TextStyles.lightWhite14,
          )
          //SFText(keyText: ,),
        ],
      ),
    );
  }
}
