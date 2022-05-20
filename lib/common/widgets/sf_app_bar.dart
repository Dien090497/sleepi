import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFAppBar extends StatelessWidget {
  const SFAppBar({this.title, this.textStyle, this.trailing, this.onPressedBack, Key? key}) : super(key: key);

  final String? title;
  final TextStyle? textStyle;
  final VoidCallback? onPressedBack;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 73,
      width: double.infinity,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.black, width: 1),
          color: AppColors.greyBottomNavBar
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(0),
        leading:  IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined, color: AppColors.black,size: 44,),
          onPressed: onPressedBack,
        ),
        title: SFText(keyText: title ?? "", style: textStyle, textAlign: TextAlign.center,),
        trailing: trailing ?? const SizedBox(),
        ),
    );
  }
}

