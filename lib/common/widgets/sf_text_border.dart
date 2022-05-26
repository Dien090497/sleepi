import 'package:flutter/material.dart';

class SFTextBorder extends StatelessWidget {
  const SFTextBorder({
    Key? key,
    this.radius = 100,
    required this.text,
    this.textColor = Colors.white,
    this.fontSize = 14,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Color textColor;
  final double fontSize;
  final VoidCallback? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 9.5,
          horizontal: 16,
        ),
        decoration: BoxDecoration(
          color: textColor.withOpacity(0.05),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: textColor,
          ),
        ),
      ),
    );
  }
}
