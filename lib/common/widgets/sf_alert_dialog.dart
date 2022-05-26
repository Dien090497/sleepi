import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

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
    return AlertDialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(16.0)),
      ),
      backgroundColor: backgroundColor ?? AppColors.lightDark,
      insetPadding: EdgeInsets.zero,
      contentPadding: EdgeInsets.zero,
      clipBehavior: Clip.antiAliasWithSaveLayer,
      scrollable: true,
      content: Builder(
        builder: (context) {
          var sizeWidth = MediaQuery.of(context).size.width;

          return Container(
              height: height,
              width: width ?? sizeWidth * 0.95,
              padding: padding ?? const EdgeInsets.all(8),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Align(
                      alignment: Alignment.topRight,
                      child: GestureDetector(
                          onTap: () => Navigator.maybePop(context),
                          child: const Icon(
                            Icons.close,
                            color: AppColors.lightGrey,
                          ))),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment:
                          crossAxisAlignment ?? CrossAxisAlignment.center,
                      children: children,
                    ),
                  ),
                ],
              ));
        },
      ),
    );
  }
}