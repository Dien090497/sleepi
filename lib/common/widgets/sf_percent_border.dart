import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFPercentBorder extends StatelessWidget {
  const SFPercentBorder(
      {Key? key,
      required this.valueActive,
      this.colorActive = Colors.blueAccent,
      this.titleActive,
      required this.totalValue})
      : super(key: key);

  final double valueActive;
  final Color? colorActive;
  final String? titleActive;
  final double totalValue;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        Positioned(
            left: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity * (valueActive / totalValue),
              decoration: BoxDecoration(
                color: colorActive,
                borderRadius: BorderRadius.circular(20),
              ),
              child: titleActive != null ? Text(titleActive!, style: TextStyles.label10,) : Container(),
            ),
        ),
      ],
    );
  }
}
