import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SFIcon extends StatelessWidget {
  const SFIcon({required this.icon, Key? key}) : super(key: key);

  final String icon;

  @override
  Widget build(BuildContext context) {
    final tail = icon.split('.').last;
    if (tail.contains('svg')) {
      return SvgPicture.asset(icon);
    }
    return Image.asset(icon);
  }
}
