import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFChip extends StatelessWidget {
  const SFChip(
      {required this.text,
      this.textStyle,
      this.toUpperCase = false,
      this.color,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final bool toUpperCase;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Chip(
      labelPadding: const EdgeInsets.all(2.0),
      label: SFText(
        keyText: text,
        style: textStyle,
        toUpperCase: toUpperCase,
      ),
      backgroundColor: color ?? AppColors.white.withOpacity(0.05),
      // shadowColor: Colors.grey[60],
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
    );
  }
}
