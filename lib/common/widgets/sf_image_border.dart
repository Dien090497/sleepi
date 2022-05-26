import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';

class SFImageBorder extends StatelessWidget {
  const SFImageBorder({
    Key? key,
    required this.icon,
    required this.onTap,
    this.radius = 100,
    this.size = const ui.Size(40, 40),
    this.iconColor,
  }) : super(key: key);

  final String icon;
  final Color? iconColor;
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
      child: SFIcon(
        icon,
        color: iconColor,
      ),
    );
  }
}