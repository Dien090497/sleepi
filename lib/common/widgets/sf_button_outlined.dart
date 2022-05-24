import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class ButtonOutLined extends StatelessWidget {
  const ButtonOutLined({
    Key? key,
    required this.title,
    required this.onPressed,
    this.fixedSize,
    this.textStyle,
    this.bgColor,
    this.withBorder=2,
  }) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Size? fixedSize;
  final TextStyle? textStyle;
  final Color? bgColor;
  final double withBorder;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: bgColor ?? Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
        side: BorderSide(width: withBorder, color: AppColors.primary),
        fixedSize: fixedSize,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: textStyle ?? Theme.of(context).textTheme.button?.copyWith(color: AppColors.primary),
      ),
    );
  }
}
