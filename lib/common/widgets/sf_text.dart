import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFText extends Text {
  SFText({
    required String keyText,
    String suffix = '',
    String prefix = '',
    Map<String, String>? args,
    TextStyle? style,
    bool stringCase = false,
    // StringCase? stringCase,
    TextAlign? textAlign,
    Key? key,
  }) : super(
          // prefix + keyText.tr(namedArgs: args).reCase(stringCase) + suffix,
          prefix + keyText.tr(namedArgs: args) + suffix,
          style: style ?? TextStyles.textBasic15,
          textAlign: textAlign,
          key: key,
        );
}
