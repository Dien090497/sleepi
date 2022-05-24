import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFBackButton extends StatelessWidget {
  const SFBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: SvgPicture.asset("assets/icons/arrow_left.svg", width: 32, height: 32,),
    );
  }
}
