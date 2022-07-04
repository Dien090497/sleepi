import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/resources/resources.dart';

class SFTextFieldPassword extends StatefulWidget {
  const SFTextFieldPassword({
    this.labelText,
    this.hintText,
    this.hintStyle,
    this.suffixIcon,
    this.noBorder = false,
    this.showLabel = true,
    Key? key,
    this.maxLine,
    this.maxLength,
    this.controller,
    this.valueChanged,
    this.errorText = '',
  }) : super(key: key);

  final String? labelText;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? suffixIcon;
  final bool noBorder;
  final int? maxLine;
  final int? maxLength;
  final TextEditingController? controller;
  final bool showLabel;
  final ValueChanged<String>? valueChanged;
  final String errorText;

  @override
  State<SFTextFieldPassword> createState() => _SFTextFieldPasswordState();
}

class _SFTextFieldPasswordState extends State<SFTextFieldPassword> {
  bool obscureText = true;

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
          style: TextStyles.w400White16,
          controller: widget.controller,
          onChanged: widget.valueChanged,
          obscureText: obscureText,
          decoration: InputDecoration(
            isDense: true,
            // hintText: widget.hintText != null ? translate(widget.hintText!) : null,
            hintText: widget.hintText != null ? widget.hintText! : null,
            hintStyle: widget.hintStyle ?? TextStyles.lightGrey14,
            suffixIcon: InkWell(
              onTap: () {
                setState(() {
                  obscureText = !obscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: obscureText
                    ? const SFIcon(
                        Ics.icEye,
                        width: 24,
                        height: 24,
                      )
                    : const Icon(
                        CupertinoIcons.eye,
                        size: 28,
                        color: AppColors.lightGrey,
                      ),
              ),
            ),
            border: border,
            focusedBorder: border,

            disabledBorder: border,
            enabledBorder: border,
            errorBorder: border,
            focusedErrorBorder: border,
          ),
          maxLines: widget.maxLine ?? 1,
          maxLength: widget.maxLength,
        ),
         const SizedBox(height: 4),
         SizedBox(
           height: 30,
           child:   Text(widget.errorText, style: TextStyles.w400Red12,maxLines: 2,),
         ),
      ],
    );
  }
}
