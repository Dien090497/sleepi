import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/otp_countdown_timer.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

import 'send_email_button.dart';

class TextfieldVerificationEmail extends StatelessWidget {
  const TextfieldVerificationEmail({
    this.labelText = LocaleKeys.email_verification_code,
    this.hintText,
    this.textButtonStyle,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.noBorder = false,
    this.showLabel = true,
    required this.onPressed,
    Key? key,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.valueChanged,
    this.textInputType = TextInputType.number,
    this.stringCase,
    this.errorText = '',
    this.duration = 60,
    this.validate,
  }) : super(key: key);

  /// [duration]  seconds
  final int duration;
  final String? labelText;
  final String? hintText;
  final TextStyle? textButtonStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLength;
  final bool showLabel;
  final VoidCallback onPressed;
  final TextEditingController? controller;
  final ValueChanged<String>? valueChanged;
  final TextInputType? textInputType;
  final StringCase? stringCase;
  final String? errorText;
  final bool Function()? validate;

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
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: errorText != ''
                    ? AppColors.red.withOpacity(0.1)
                    : AppColors.white.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.only(left: 12, right: 4),
          child: Row(
            children: [
              Expanded(
                child: SFTextField(
                  hintText: hintText,
                  controller: controller,
                  onChanged: valueChanged,
                  textInputType: textInputType,
                  maxLength: maxLength,
                  hintStyle: hintStyle ?? TextStyles.lightGrey14,
                  suffix: suffix,
                  suffixIcon: suffixIcon,
                  showLabel: false,
                  noBorder: true,
                ),
              ),
              OtpCountdownTimer(
                duration: duration,
                onSendEmail: onPressed,
                validate: validate,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (errorText != null && errorText != '')
          SFText(
            style: TextStyles.w400Red12,
            maxLines: 3,
            keyText: errorText!,
          ),
      ],
    );
  }
}

class TextfieldVerifiEmail extends StatelessWidget {
  const TextfieldVerifiEmail({
    this.labelText = LocaleKeys.email_verification_code,
    this.hintText,
    this.textButtonStyle,
    this.hintStyle,
    this.suffix,
    this.suffixIcon,
    this.noBorder = false,
    this.showLabel = true,
    Key? key,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.valueChanged,
    this.textInputType = TextInputType.number,
    this.stringCase,
    this.errorText = '',
    this.duration = 60,
    required this.otpType,
    required this.onError,
    required this.getEmail,
  }) : super(key: key);

  /// [duration]  seconds
  final int duration;
  final String? labelText;
  final String? hintText;
  final TextStyle? textButtonStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLength;
  final bool showLabel;
  final TextEditingController? controller;
  final ValueChanged<String>? valueChanged;
  final TextInputType? textInputType;
  final StringCase? stringCase;
  final String? errorText;

  final OTPType otpType;
  final Function(String message) onError;
  final String Function() getEmail;

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
        const SizedBox(height: 4),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: errorText != ''
                    ? AppColors.red.withOpacity(0.1)
                    : AppColors.white.withOpacity(0.1)),
          ),
          padding: const EdgeInsets.only(left: 12, right: 4),
          child: Row(
            children: [
              Expanded(
                child: SFTextField(
                  hintText: hintText,
                  controller: controller,
                  onChanged: valueChanged,
                  textInputType: textInputType,
                  maxLength: maxLength,
                  hintStyle: hintStyle ?? TextStyles.lightGrey14,
                  suffix: suffix,
                  suffixIcon: suffixIcon,
                  showLabel: false,
                  noBorder: true,
                ),
              ),
              SendEmailButton(
                duration: duration,
                otpType: otpType,
                getEmail: getEmail,
                onError: onError,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        if (errorText != null && errorText != '')
          SFText(
            style: TextStyles.w400Red12,
            maxLines: 3,
            keyText: errorText!,
          ),
      ],
    );
  }
}
