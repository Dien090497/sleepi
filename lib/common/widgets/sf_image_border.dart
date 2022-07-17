import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';

class SFImageBorder extends StatelessWidget {
  const SFImageBorder({
    Key? key,
    required this.icon,
    required this.onTap,
    this.radius = 100,
    this.size = const ui.Size(40, 40),
    this.iconColor,
    this.padding = 9,
  }) : super(key: key);

  final String icon;
  final Color? iconColor;
  final VoidCallback onTap;
  final double radius;
  final double padding;
  final ui.Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(radius),
        ),
        child: icon.isEmpty
            ? const SizedBox()
            : icon.startsWith('http')
                ? CachedImage(image: icon, boxFit: BoxFit.contain)
                : SFIcon(
                    icon,
                    color: iconColor,
                    fit: BoxFit.contain,
                  ),
      ),
    );
  }
}
