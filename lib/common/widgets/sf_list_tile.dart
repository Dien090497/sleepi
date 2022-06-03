import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFListTile extends StatelessWidget {
  const SFListTile({
    this.text,
    this.textStyle,
    this.trailing,
    this.leading,
    this.onPressed,
    this.toUpperCase = false,
    Key? key
  }) : super(key: key);

  final String? text;
  final TextStyle? textStyle;
  final Widget? leading;
  final VoidCallback? onPressed;
  final Widget? trailing;
  final bool toUpperCase;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            leading ?? const SizedBox(),
            Expanded(
              child: SFText(
                keyText: text ?? "",
                style: textStyle ?? TextStyles.lightWhite14,
                stringCase: toUpperCase,
              ),
            ),
            trailing ?? const SizedBox(),

          ],

        ),
      ),
    );
  }
}
//
// class SFListTile extends ListTile {
//   SFListTile(
//       {String? text,
//       TextStyle? textStyle,
//       Widget? leading,
//       VoidCallback? onPressed,
//       Widget? trailing,
//       bool toUpperCase = false,
//       Key? key})
//       : super(
//             dense: true,
//             contentPadding: const EdgeInsets.all(0),
//             mouseCursor: null,
//             title: SFText(
//               keyText: text ?? "",
//               style: textStyle ?? TextStyles.lightWhite14,
//               stringCase: toUpperCase,
//             ),
//             leading: leading,
//             trailing: trailing,
//             onTap: onPressed,
//             key: key);
// }
