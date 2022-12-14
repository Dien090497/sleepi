import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class BoxButtonWidget extends StatelessWidget {
  const BoxButtonWidget(
      {this.text, this.textStyle, this.assetImage, this.onTap, Key? key})
      : super(key: key);

  final VoidCallback? onTap;
  final String? text;
  final TextStyle? textStyle;
  final String? assetImage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
          color: AppColors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.blue,
              child: SFIcon(assetImage!),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: SFText(
                keyText: text ?? "",
                style: textStyle ?? TextStyles.lightGrey12,
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
