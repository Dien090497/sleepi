import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_prercent_blue.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class AtributeProcessWidget extends StatelessWidget {
  const AtributeProcessWidget({Key? key, required this.linkImage, required this.title, required this.totalValue, required this.valueActive}) : super(key: key);

  final String linkImage;
  final String title;
  final double totalValue;
  final double valueActive;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(linkImage),
          const SizedBox(width: 5),
          Expanded(flex: 2,child: SFText(keyText: title, style: TextStyles.white14WithOpacity,),),
          Expanded(flex: 3,child: SFPercentBlue(totalValue: totalValue, valueActive: valueActive,),),
          const SizedBox(width: 35),
          SFText(keyText: (valueActive/totalValue * 10).toStringAsFixed(1), style: TextStyles.boldWhite14,),
        ],
      ),
    );
  }
}
