import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TextInfo extends StatelessWidget {
  const TextInfo(
      {Key? key,
      required this.text,
      this.color,
      this.width,
      this.center = false})
      : super(key: key);

  final String text;
  final Color? color;
  final double? width;
  final bool center;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: center ? Alignment.center : null,
      width: width,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.black),
        color: color,
      ),
      child: SFText(
        keyText: text,
        style: TextStyles.black12,
      ),
    );
  }
}
