import 'package:flutter/material.dart';
import 'dart:ui' as ui;


class SFIconBorder extends StatelessWidget {
  const SFIconBorder({
    Key? key,
    required this.icon,
    this.onTap,
    this.radius = 100,
    this.size = const ui.Size(40, 40),
    this.sizeIcon = 20,
    this.iconColor = Colors.white,
  }) : super(key: key);

  final IconData icon;
  final double sizeIcon;
  final Color iconColor;
  final VoidCallback? onTap;
  final double radius;
  final ui.Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: Icon(icon, size: sizeIcon, color: Colors.white,),
      ),
    );
  }
}
