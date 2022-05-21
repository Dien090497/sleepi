import 'package:flutter/material.dart';
import 'package:slee_fi/resources/resources.dart';

class SFBackground extends StatelessWidget {
  const SFBackground({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage(Imgs.background)),
      ),
      child: child,
    );
  }
}
