import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter_svg/flutter_svg.dart';

class SFImageBorder extends StatelessWidget {
  const SFImageBorder({
    Key? key,
    required this.icon,
    required this.onTap,
    this.radius = 100,
    this.size = const ui.Size(40, 40),
  }) : super(key: key);

  final String icon;
  final VoidCallback onTap;
  final double radius;
  final ui.Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      padding: const EdgeInsets.all(9),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: SvgPicture.asset(icon,),
    );
  }
}
