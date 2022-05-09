import 'package:flutter/material.dart';

class SFButton extends StatelessWidget {
  const SFButton(
      {required this.text,
      this.textStyle,
      this.onPressed,
      this.width,
      this.height,
      Key? key})
      : super(key: key);

  final String text;
  final TextStyle? textStyle;
  final VoidCallback? onPressed;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Text(text, style: textStyle),
      ),
    );
  }
}
