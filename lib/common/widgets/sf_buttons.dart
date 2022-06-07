import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFButton extends StatelessWidget {
  const SFButton({
    required this.text,
    this.textStyle,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.stringCase,
    this.disabled = false,
    this.radius = 100,
    this.gradient,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final double radius;
  final StringCase? stringCase;
  final bool disabled;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height ?? 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            gradient: gradient,
          ),
          child: ElevatedButton(
            onPressed: onPressed,
            style: gradient == null
                ? ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        color ?? AppColors.greyBottomNavBar),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  )
                : ButtonStyle(
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(radius),
                      ),
                    ),
                  ),
            child: FittedBox(
              fit: BoxFit.fitWidth,
              child: SFText(
                keyText: text,
                style: textStyle,
                stringCase: stringCase,
              ),
            ),
          ),
        ),
        if (disabled)
          Container(
            width: width,
            height: height ?? 48,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: AppColors.dark.withOpacity(0.4),
            ),
          ),
      ],
    );
  }
}

class SFTextButton extends StatelessWidget {
  const SFTextButton(
      {required this.text,
      this.textStyle,
      this.stringCase,
      this.onPressed,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final StringCase? stringCase;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: SFText(
        keyText: text,
        style: textStyle,
        stringCase: stringCase,
      ),
    );
  }
}
