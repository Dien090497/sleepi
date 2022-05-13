import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFTextField extends StatelessWidget {
  const SFTextField({
    this.hintText,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.noBorder = false,
    Key? key, this.maxLine, this.maxLenght,
  }) : super(key: key);

  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLenght;

  @override
  Widget build(BuildContext context) {
    final border = noBorder
        ? InputBorder.none
        : OutlineInputBorder(borderRadius: BorderRadius.circular(10));

    return TextField(
      decoration: InputDecoration(
        isDense: true,
        hintText: hintText != null ? translate(hintText!) : null,
        hintStyle: hintStyle ?? TextStyles.textBasic15,
        suffix: suffix,
        suffixIcon: suffixIcon,
        border: border,
        focusedBorder: border,
        disabledBorder: border,
        enabledBorder: border,
        errorBorder: border,
        focusedErrorBorder: border,
      ),
      maxLines: maxLine ?? 1,
      maxLength: maxLenght,
    );
  }
}
