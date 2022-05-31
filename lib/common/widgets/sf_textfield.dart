import 'package:flutter/material.dart';
// import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFTextField extends StatelessWidget {
  const SFTextField({
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.noBorder = false,
    this.showLabel = true,
    Key? key,
    this.maxLine,
    this.maxLength,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLength;
  final bool showLabel;

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
          style: TextStyles.w400White16,
          decoration: InputDecoration(
            isDense: true,
            // hintText: hintText != null ? translate(hintText!) : null,
            hintText: hintText != null ? hintText! : null,
            hintStyle: hintStyle ?? TextStyles.lightGrey14,
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
          maxLength: maxLength,
        ),
      ],
    );
  }
}
