import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/phoenix.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

Future<T?> showCustomDialog<T>(
  BuildContext context, {
  required List<Widget> children,
  Color? backgroundColor,
  EdgeInsets? padding,
  EdgeInsets? insetPadding,
}) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      builder: (context) {
        return SFDialog(
          backgroundColor: backgroundColor,
          padding: padding,
          insetPadding: insetPadding,
          children: children,
        );
      });
}

Future<T?> showSuccessfulDialog<T>(
  BuildContext context,
  String? message, {
  EdgeInsets? padding,
  TextStyle? style,
  VoidCallback? onBackPress,
  bool barrierDismissible = true,
}) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      barrierDismissible: barrierDismissible,
      builder: (context) {
        return SFDialog(
          padding: padding,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  if (onBackPress != null) {
                    onBackPress();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.close, color: AppColors.white),
              ),
            ),
            const SFIcon(Ics.successful),
            const SizedBox(height: 36),
            SFText(
                textAlign: TextAlign.center,
                keyText: message ?? LocaleKeys.success,
                style: style ?? TextStyles.bold18White),
            const SizedBox(height: 40),
          ],
        );
      });
}

Future<T?> showMessageDialog<T>(BuildContext context, String message,
    {EdgeInsets? padding, TextStyle? style}) async {
  return showCustomAlertDialog(
    context,
    padding: const EdgeInsets.all(24),
    children: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: SFText(
          keyText: message,
          textAlign: TextAlign.center,
          style: style ?? TextStyles.bold18White),
    ),
  );
}

Future<T?> showSignUpSuccess<T>(BuildContext context, String? message) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      builder: (context) {
        return SFDialog(
          padding: EdgeInsets.zero,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: AppColors.white),
              ),
            ),
            SFText(
                keyText: LocaleKeys.successfull,
                maxLines: 1,
                style: TextStyles.bold18White),
            const SizedBox(height: 12),
            SFText(
                keyText: message ?? LocaleKeys.your_account_has_been_create,
                maxLines: 1,
                style: TextStyles.lightGrey14),
            const SizedBox(height: 44),
            const SFIcon(Ics.successful),
            const SizedBox(height: 50),
            SFButton(
              width: 180,
              height: 48,
              text: LocaleKeys.continue_,
              textStyle: TextStyles.w600WhiteSize16,
              onPressed: () => Navigator.of(context).pop(),
              color: AppColors.blue,
            ),
            const SizedBox(height: 32),
          ],
        );
      });
}

Future<T?> showChangeLanguageDialog<T>(BuildContext context,
    {required Locale locale}) async {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      builder: (context) {
        return SFDialog(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.close, color: AppColors.white),
              ),
            ),
            const SFIcon(Ics.warning),
            const SizedBox(height: 20),
            SFText(
              keyText: LocaleKeys.do_you_really_want_to_change,
              style: TextStyles.white1w700size18,
            ),
            const SizedBox(height: 38),
            Row(
              children: [
                Expanded(
                  child: SFButton2(
                    text: LocaleKeys.cancel,
                    color: AppColors.greyBottomNavBar,
                    textStyle: TextStyles.lightGrey16,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: SFButton2(
                    text: LocaleKeys.ok,
                    gradient: AppColors.gradientBlue,
                    textStyle: TextStyles.white16,
                    onPressed: () {
                      showLanguageUpdatedDialog(context, locale);
                    },
                  ),
                ),
              ],
            ),
          ],
        );
      });
}

Future<T?> showLanguageUpdatedDialog<T>(BuildContext context, Locale locale) {
  return showDialog(
      context: context,
      barrierColor: AppColors.backgroundDialog,
      barrierDismissible: false,
      builder: (context) {
        return SFDialog(
          padding:  EdgeInsets.zero,
          children: [
            // Align(
            //   alignment: Alignment.centerRight,
            //   child: IconButton(
            //     onPressed: () {
            //       Navigator.pop(context);
            //     },
            //     icon: const Icon(Icons.close, color: AppColors.white),
            //   ),
            // ),
            const SizedBox(height: 12),
            SFText(
                keyText: LocaleKeys.successfull,
                style: TextStyles.bold18White),
            const SizedBox(height: 12),
            SFText(
                keyText: LocaleKeys.the_language_setting_has_been_updated,
                textAlign: TextAlign.center,
                style: TextStyles.lightGrey14),
            const SizedBox(height: 44),
            const SFIcon(Ics.successful),
            const SizedBox(height: 50),
            SFButton(
              width: 180,
              height: 48,
              text: LocaleKeys.ok,
              textStyle: TextStyles.w600WhiteSize16,
              onPressed: () {
                context.setLocale(locale);
                Phoenix.rebirth(context);
              },
              color: AppColors.blue,
            ),
            const SizedBox(height: 32),
          ],
        );
      });
}

class SFDialog extends StatelessWidget {
  const SFDialog(
      {required this.children,
      Key? key,
      this.backgroundColor,
      this.padding,
      this.insetPadding})
      : super(key: key);

  final List<Widget> children;
  final Color? backgroundColor;
  final EdgeInsets? padding;
  final EdgeInsets? insetPadding;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      insetPadding: insetPadding ??
          const EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0),
      child: Container(
        width: 1000,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: backgroundColor ?? AppColors.lightDark,
        ),
        padding: padding ?? const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}
