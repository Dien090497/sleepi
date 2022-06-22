import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/resources/resources.dart';

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

class SFButton2 extends StatelessWidget {
  const SFButton2({
    required this.text,
    this.textStyle,
    this.onPressed,
    this.width,
    this.height,
    this.color,
    this.stringCase,
    this.gradient,
    Key? key,
  }) : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final StringCase? stringCase;
  final LinearGradient? gradient;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(100);

    return Container(
      width: width,
      height: height ?? 48,
      decoration: BoxDecoration(
        gradient: gradient,
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed)) {
              return color?.withOpacity(0.5) ?? AppColors.blue.withOpacity(0.5);
            } else if (states.contains(MaterialState.disabled)) {
              return AppColors.greyBottomNavBar;
            }
            return gradient == null ? color : AppColors.transparent;
          }),
          // minimumSize: MaterialStateProperty.all(Size.fromHeight(height ?? 48)),
          shadowColor: MaterialStateProperty.all(AppColors.transparent),
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
          ),
        ),
        child: SFText(
          keyText: text,
          style: textStyle,
          stringCase: stringCase,
        ),
      ),
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

class SFIconButton extends StatelessWidget {
  const SFIconButton(
      {required this.text,
      this.textStyle,
      this.stringCase,
      this.onPressed,
      this.width,
      this.height,
      this.color,
      this.radius = 100,
      this.icon,
      Key? key})
      : super(key: key);

  final String text;
  final String? icon;
  final double? height;
  final double? width;
  final double radius;
  final Color? color;
  final TextStyle? textStyle;
  final StringCase? stringCase;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 70,
      height: height ?? 28,
      child: ElevatedButton.icon(
        icon: SFIcon(
          icon ?? Ics.icCart,
          width: 18,
        ),
        label: SFText(keyText: text, stringCase: stringCase, style: textStyle),
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          primary: color,
          padding: const EdgeInsets.symmetric(horizontal: 6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radius),
          ),
        ),
      ),
    );
  }
}
