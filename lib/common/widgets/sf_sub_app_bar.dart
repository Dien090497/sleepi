import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFSubAppBar extends StatelessWidget {
  const SFSubAppBar(
      {this.title, this.textStyle, this.toUpperCase = false, Key? key})
      : super(key: key);

  final String? title;
  final TextStyle? textStyle;
  final bool toUpperCase;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SFBackButton(),
        const SizedBox(
          width: 24.0,
        ),
        Expanded(
          child: SFText(
            keyText: title ?? "",
            style: textStyle,
            stringCase: StringCase.upperCase,
          ),
        )
      ],
    );
  }
}
