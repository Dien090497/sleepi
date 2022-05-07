import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';

class SleeFiText extends Text {
  SleeFiText({
    required String keyText,
    Map<String, dynamic>? args,
    TextStyle? style,
    Key? key,
  }) : super(
          translate(keyText, args: args),
          style: style,
          key: key,
        );
}
