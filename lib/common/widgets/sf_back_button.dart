import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/resources/resources.dart';

class SFBackButton extends StatelessWidget {
  const SFBackButton({Key? key, this.onBack}) : super(key: key);

  final VoidCallback? onBack;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onBack ?? () => Navigator.pop(context),
      child: const SFIcon(
        Ics.arrowLeft,
        width: 24,
        height: 24,
      ),
    );
  }
}
