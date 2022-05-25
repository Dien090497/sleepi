import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TopLeftBanner extends StatelessWidget {
  const TopLeftBanner({Key? key, required this.text, this.textColor})
      : super(key: key);

  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: const AlwaysStoppedAnimation(315 / 360),
      child: Container(
        color: AppColors.red.withOpacity(.1),
        // width: 120.w,
        padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 40),
        child: SFText(
          keyText: text,
          style: TextStyles.red12W700.copyWith(color: textColor),
        ),
      ),
    );
  }
}
