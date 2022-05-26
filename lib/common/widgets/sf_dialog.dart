import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required List<Widget> children,
  Color? backgroundColor,
  EdgeInsets? padding,
}) async {
  return showDialog(
      context: context,
      builder: (_) {
        return SFDialog(
          backgroundColor: backgroundColor,
          padding: padding,
          children: children,
        );
      });
}

class SFDialog extends StatelessWidget {
  const SFDialog(
      {required this.children, Key? key, this.backgroundColor, this.padding})
      : super(key: key);

  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      child: Container(
        width: 1000,
        decoration: BoxDecoration(
		 borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? AppColors.lightDark,
        ),
        padding: padding ?? const EdgeInsets.all(8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
