import 'package:flutter/material.dart';

class DecoratedWidget extends StatelessWidget {
  const DecoratedWidget(
      {Key? key, required this.child, this.padding, this.width, this.alignment})
      : super(key: key);

  final Widget child;
  final EdgeInsets? padding;
  final double? width;
  final Alignment? alignment;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: alignment ?? Alignment.centerLeft,
      child: Container(
        width: width,
        padding: padding,
        child: child,
      ),
    );
  }
}
