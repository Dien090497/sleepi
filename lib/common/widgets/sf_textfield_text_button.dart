import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class SFTextFieldTextButton extends StatelessWidget {
  const SFTextFieldTextButton({
    this.labelText,
    this.hintText,
    this.textButton,
    this.textButtonStyle,
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
  final String? textButton;
  final TextStyle? textButtonStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLength;
  final bool showLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
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
        const SizedBox(
          height: 4,
        ),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: AppColors.white.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.only(left: 12, right: 4),
          child: Row(
            children: [
              Expanded(
                child: SFTextField(
                  hintText: hintText,
                  hintStyle: hintStyle ?? TextStyles.lightGrey14,
                  suffix: suffix,
                  suffixIcon: suffixIcon,
                  showLabel: false,
                  noBorder: true,
                ),
              ),
              SFTextButton(
                text: textButton ?? Keys.sendCode,
                textStyle: textButtonStyle ?? TextStyles.blue12,
                // color: Colors.transparent,
              ),
            ],
          ),
        ),
      ],
    );
  }
}