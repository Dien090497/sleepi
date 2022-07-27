import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFTextField extends StatefulWidget {
  const SFTextField({
    this.labelText,
    this.hintText,
    this.errorText,
    this.initialText,
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
    this.textAlign,
    this.enabled,
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final String? errorText;
  final String? initialText;
  final TextStyle? textStyle;
  final TextStyle? hintStyle;
  final Widget? suffix;
  final Widget? suffixIcon;
  final bool noBorder;
  final bool? enabled;
  final bool readonly;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final bool showLabel;
  final TextAlign? textAlign;
  final ValueChanged<String>? onChanged;
  final TextInputType? textInputType;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;

  @override
  State<SFTextField> createState() => _SFTextFieldState();
}

class _SFTextFieldState extends State<SFTextField> {
  late final controller = widget.controller ?? TextEditingController();

  @override
  void initState() {
    controller.text = widget.initialText ?? controller.text;
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final border = widget.noBorder
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
        widget.showLabel
            ? Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: SFText(
                  keyText: widget.labelText ?? "",
                  style: TextStyles.lightGrey14,
                ),
              )
            : const SizedBox(),
        TextField(
          style: widget.textStyle ?? TextStyles.w400White16,
          controller: controller,
          focusNode: widget.focusNode,
          onChanged: widget.onChanged,
          keyboardType: widget.textInputType,
          inputFormatters: widget.inputFormatters,
          readOnly: widget.readonly,
          textCapitalization: TextCapitalization.none,
          textAlign: widget.textAlign ?? TextAlign.start,
          enabled: widget.enabled,
          decoration: InputDecoration(
              isDense: true,
              // hintText: hintText != null ? translate(hintText!) : null,
              hintText: widget.hintText?.tr(),
              hintStyle: widget.hintStyle ?? TextStyles.lightGrey14,
              suffix: widget.suffix,
              suffixIcon: widget.suffixIcon,
              border: border,
              focusedBorder: border,
              disabledBorder: border,
              enabledBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              counterText: "",
              errorText: widget.errorText,
              errorMaxLines: 10),
          maxLines: widget.maxLine ?? 1,
          maxLength: widget.maxLength,
        ),
      ],
    );
  }
}
