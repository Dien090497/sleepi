import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class AverageWidget extends StatelessWidget {
  const AverageWidget({
    this.color,
    this.textStyle,
    this.title,
    this.average,
    this.textStyleNumber,
    Key? key}) : super(key: key);

  final Color? color;
  final String? title;
  final String? average;
  final TextStyle? textStyle;
  final TextStyle? textStyleNumber;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: color,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(
            keyText: title ?? "",
            style: textStyle,
          ),
          const SizedBox(
            height: 11.0,
          ),
          SFText(keyText: average ?? "", style: textStyleNumber)
        ],
      ),
    );
  }
}
