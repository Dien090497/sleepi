import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';

class SFBackButton extends StatelessWidget {
  const SFBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pop(context),
      child: const SFIcon(
        "assets/icons/arrow_left.svg",
        width: 32,
        height: 32,
      ),
    );
  }
}
