import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class BoxMessage extends StatelessWidget {
  const BoxMessage({Key? key, required this.message}) : super(key: key);

  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width * 0.9,
      height: 155,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: AppColors.black),
        borderRadius: BorderRadius.circular(10.0),
        color: AppColors.greyBottomNavBar
      ),
      child: SFText(keyText: message, style: TextStyles.bold20black,textAlign: TextAlign.center,),
    );
  }
}
