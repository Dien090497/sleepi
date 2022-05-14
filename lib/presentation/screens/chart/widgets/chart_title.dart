import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ChartTitle extends StatelessWidget {
  const ChartTitle({Key? key, required this.text, this.child})
      : super(key: key);

  final String text;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SFText(keyText: text),
        const SizedBox(width: 8),
        if (child != null) Expanded(child: child!),
      ],
    );
  }
}
