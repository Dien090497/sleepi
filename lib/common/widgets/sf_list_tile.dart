import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFListTile extends ListTile {
SFListTile({
     String? text,
     TextStyle? textStyle,
     Widget? leading,
     VoidCallback? onPressed,
     Widget? trailing,
     bool toUpperCase = false,
    Key? key})
      : super(
          dense: true,
          contentPadding: const EdgeInsets.all(0),
          title: SFText(keyText: text ?? "",
            style: textStyle ?? TextStyles.lightWhite14,
            toUpperCase: toUpperCase,
          ),
          leading: leading,
          trailing: trailing,
          onTap: onPressed,
          key: key);

}
