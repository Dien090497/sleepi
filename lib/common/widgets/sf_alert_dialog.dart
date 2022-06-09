import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';

Future<T?> showCustomAlertDialog<T>(
    BuildContext context, {
      required Widget? children,
      Color? backgroundColor,
      CrossAxisAlignment? crossAxisAlignment,
      EdgeInsets? padding,
      double? width,
      double? height,
      bool showClosed = true,
    }) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      builder: (_) {
        return SFAlertDialog(
          backgroundColor: backgroundColor,
          width: width,
          height: height,
          padding: padding,
          showClose: showClosed,
          children: children,
        );
      });
}

class SFAlertDialog extends StatelessWidget {
  const SFAlertDialog(
      {required this.children,
      Key? key,
      this.backgroundColor,
      this.padding,
      this.height,
        this.showClose = true,
      this.width})
      : super(key: key);

  final Widget? children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final bool showClose;

  @override
  Widget build(BuildContext context) {
    var sizeWidth = MediaQuery.of(context).size.width;

    return DismissKeyboardWidget(
      child: AlertDialog(
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
            child: Column(
              children: [
                showClose ? Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                        onTap: () => Navigator.maybePop(context),
                        child: const Icon(
                          Icons.close,
                          color: AppColors.lightGrey,
                        ))) : const SizedBox(),
                children!,
              ],
            )),
      ),
    );
  }
}
