import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFButton extends StatelessWidget {
  const SFButton(
      {required this.text,
      this.textStyle,
      this.onPressed,
      this.width,
      this.height,
      this.color,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          padding: const EdgeInsets.symmetric(horizontal: 74),
          primary: color ?? AppColors.greyBottomNavBar,
          onPrimary: color ?? AppColors.greyBottomNavBar,
          onSurface: color ?? AppColors.greyBottomNavBar,
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: const BorderSide(color: AppColors.black),
          ),
        ),
        child: SFText(keyText: text, style: textStyle),
      ),
    );
  }
}

class SFTextButton extends StatelessWidget {
  const SFTextButton({required this.text, this.onPressed, Key? key})
      : super(key: key);

  final String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SFText(keyText: text),
    );
  }
}
