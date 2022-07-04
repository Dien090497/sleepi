import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:easy_localization/easy_localization.dart';

class SFTextField extends StatelessWidget {
  const SFTextField({
    this.labelText,
    this.hintText,
    this.errorText,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.noBorder = false,
    this.readonly = false,
    this.showLabel = true,
    Key? key,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.onChanged,
    this.textInputType,
    this.textStyle,
    this.inputFormatters,
    this.focusNode,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final bool readonly;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final bool showLabel;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final border = noBorder
        ? InputBorder.none
        : OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.white.withOpacity(0.1),
            ),
          );

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        showLabel
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SFText(
                  keyText: labelText ?? "",
                  style: TextStyles.lightGrey14,
                ),
              )
            : const SizedBox(),
        TextField(
          style: textStyle ?? TextStyles.w400White16,
          controller: controller,
          focusNode: focusNode,
          onChanged: onChanged,
          keyboardType: textInputType,
          inputFormatters: inputFormatters,
          readOnly: readonly,
          decoration: InputDecoration(
              isDense: true,
              // hintText: hintText != null ? translate(hintText!) : null,
              hintText: hintText?.tr(),
              hintStyle: hintStyle ?? TextStyles.lightGrey14,
              suffix: suffix,
              suffixIcon: suffixIcon,
              border: border,
              focusedBorder: border,
              disabledBorder: border,
              enabledBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              counterText: "",
              errorText: errorText,
              errorMaxLines: 10),
          maxLines: maxLine ?? 1,
          maxLength: maxLength,
        ),
      ],
    );
  }
}

class DecimalTextInputFormatter extends TextInputFormatter {
  DecimalTextInputFormatter({this.decimalRange})
      : assert(decimalRange == null || decimalRange > 0);

  final int? decimalRange;

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue, // unused.
    TextEditingValue newValue,
  ) {
    TextSelection newSelection = newValue.selection;
    String truncated = newValue.text;

    if (decimalRange != null) {
      String value = newValue.text;

      if (value.contains(".") &&
          value.substring(value.indexOf(".") + 1).length > decimalRange!) {
        truncated = oldValue.text;
        newSelection = oldValue.selection;
      } else if (value == ".") {
        truncated = "0.";

        newSelection = newValue.selection.copyWith(
          baseOffset: math.min(truncated.length, truncated.length + 1),
          extentOffset: math.min(truncated.length, truncated.length + 1),
        );
      }

      return TextEditingValue(
        text: truncated,
        selection: newSelection,
        composing: TextRange.empty,
      );
    }
    return newValue;
  }
}
