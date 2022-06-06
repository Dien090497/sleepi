import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ChartTitle extends StatelessWidget {
  const ChartTitle({
    this.title,
    this.result,
    this.textStyleTitle,
    this.textStyleResult,
    this.padding,
    this.toUpperCase = false,
    Key? key,
  }) : super(key: key);

  final String? title;
  final String? result;
  final TextStyle? textStyleTitle;
  final TextStyle? textStyleResult;
  final bool toUpperCase;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.symmetric(vertical: 14),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SFText(
            keyText: title ?? "",
            style: textStyleTitle ?? TextStyles.lightWhite14,
            stringCase: StringCase.upperCase,
          ),
          Expanded(
              child: SFText(
                  keyText: result ?? "",
                  style: textStyleResult ?? TextStyles.w400lightGrey14,
                  textAlign: TextAlign.end)),
        ],
      ),
    );
  }
}
