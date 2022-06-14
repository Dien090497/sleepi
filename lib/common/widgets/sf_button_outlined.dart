import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFButtonOutLined extends StatelessWidget {
  const SFButtonOutLined({
    Key? key,
    required this.title,
    required this.onPressed,
    this.fixedSize,
    this.textStyle,
    this.borderColor = AppColors.lightGrey,
    this.iconColor = AppColors.lightGrey,
    this.withBorder = 1,
    this.icon, this.bgColor,
  }) : super(key: key);

  final String title;
  final VoidCallback onPressed;
  final Size? fixedSize;
  final TextStyle? textStyle;
  final Color borderColor;
  final Color iconColor;
  final IconData? icon;
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
        side: BorderSide(width: withBorder, color: borderColor),
        fixedSize: fixedSize,
      ),
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              size: 20,
              color: iconColor,
            ),
          if (icon != null) const SizedBox(width: 9),
          SFText(
            keyText: title,
            style: textStyle ??
                Theme.of(context)
                    .textTheme
                    .button
                    ?.copyWith(color: AppColors.black),
          ),
        ],
      ),
    );
  }
}
