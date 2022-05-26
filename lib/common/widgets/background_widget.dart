import 'package:flutter/material.dart';
import 'package:slee_fi/resources/resources.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({this.child, Key? key}) : super(key: key);

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Imgs.background),
          fit: BoxFit.fill,
        ),
      ),
      child: child,
    );
  }
}
