import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

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

Future<T?> showSuccessfulDialog<T>(BuildContext context) async {
  return showDialog(
      context: context,
      builder: (_) {
        return SFDialog(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.close,
                  color: AppColors.white,
                ),
              ),
            ),
            const SFIcon(Ics.successful),
            const SizedBox(height: 36),
            SFText(keyText: Keys.successful, style: TextStyles.bold18White),
            const SizedBox(height: 40),
          ],
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
        padding: padding ?? const EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
