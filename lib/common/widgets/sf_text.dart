import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFText extends Text {
  SFText({
    required String keyText,
    String extraText = '',
    Map<String, dynamic>? args,
    TextStyle? style,
    bool toUpperCase = false,
    TextAlign? textAlign,
    Key? key,
  }) : super(
    toUpperCase
              ? translate(keyText, args: args).toUpperCase() + extraText
              : translate(keyText, args: args) + extraText,
          style: style ?? TextStyles.textBasic15,
          textAlign: textAlign,
          key: key,
        );
}
