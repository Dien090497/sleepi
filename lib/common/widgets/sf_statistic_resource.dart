import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/resources/resources.dart';

class SFStatisticResource extends StatelessWidget {

  const SFStatisticResource(
      {Key? key, required this.valueSliver, required this.valueGold, required this.valueSolana,})
      : super(key: key);

  final double valueSliver;
  final double valueGold;
  final double valueSolana;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ItemResource(value: valueSliver, url: Ics.icSilver,),
          ItemResource(value: valueGold, url: Ics.icGold,),
          ItemResource(value: valueSolana, url: Ics.icSolana,),
          SvgPicture.asset(Ics.icSolanaCircle),
        ],
      ),
    );
  }
}

class ItemResource extends StatelessWidget {
  const ItemResource({Key? key, required this.value, required this.url})
      : super(key: key);
  final double value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(url),
        const SizedBox(width: 4,),
        Text(value.toStringAsFixed(2), style: TextStyles.white14,),
      ],
    );
  }
}

