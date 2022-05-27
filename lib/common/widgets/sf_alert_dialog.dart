import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';



Future<T?> showCustomAlertDialog<T>(
    BuildContext context, {
      required List<Widget> children,
      Color? backgroundColor,
      CrossAxisAlignment? crossAxisAlignment,
      EdgeInsets? padding,
      double? width,
      double? height,
    }) async {
  return showDialog(
      context: context,
      builder: (_) {
        return SFAlertDialog(
          backgroundColor: backgroundColor,
          width: width,
          height: height,
          padding: padding,
          crossAxisAlignment: crossAxisAlignment,
          children: children,
        );
      });
}

class SFAlertDialog extends StatelessWidget {
  const SFAlertDialog(
      {required this.children,
      Key? key,
      this.backgroundColor,
      this.crossAxisAlignment,
      this.padding,
      this.height,
      this.width})
      : super(key: key);

  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final CrossAxisAlignment? crossAxisAlignment;

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;

    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      backgroundColor: backgroundColor ?? AppColors.lightDark,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      scrollable: true,
      content: Container(
          height: height,
          width: width ?? sizeWidth * 0.95,
          padding: padding ?? const EdgeInsets.all(8),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment:
              crossAxisAlignment ?? CrossAxisAlignment.center,
              children: children,
            ),
          )),
    );
  }
}
