import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFText extends Text {
  SFText({
    required String keyText,
    Map<String, dynamic>? args,
    TextStyle? style,
    Key? key,
  }) : super(
          translate(keyText, args: args),
          style: style ?? TextStyles.h1,
          key: key,
        );
}
