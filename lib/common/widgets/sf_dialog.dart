import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
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

Future<T?> showMessageDialog<T>(
  BuildContext context,
  String message, {
  EdgeInsets? padding,
  TextStyle? style,
  bool barrierDismissible = true,
  bool showIcon = true,
}) async {
  return showCustomAlertDialog(
    context,
    barrierDismissible: barrierDismissible,
    padding: padding ?? const EdgeInsets.all(24),
    children: Padding(
      padding: const EdgeInsets.symmetric(vertical: 32, horizontal: 24),
      child: Column(
        children: [
          if (showIcon)
            const SFIcon(
              Imgs.errorNoBed,
              height: 100,
            ),
          const SizedBox(height: 32),
          SFText(
              keyText: message,
              textAlign: TextAlign.center,
              style: style ?? TextStyles.bold18White),
        ],
      ),
    ),
  );
}

Future<T?> showWarningDialog<T>(
  BuildContext context,
  String message,
  VoidCallback onTap, {
  VoidCallback? closeTap,
  EdgeInsets? padding,
  TextStyle? style,
  String? buttonText,
  bool barrierDismissible = true,
}) async {
  return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: AppColors.backgroundDialog,
      builder: (context) {
        return SFDialog(
          padding: EdgeInsets.zero,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: IconButton(
                onPressed: () {
                  if (closeTap != null) {
                    closeTap();
                  } else {
                    Navigator.pop(context);
                  }
                },
                icon: const Icon(Icons.close, color: AppColors.white),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Text(message.tr(),
                textAlign: TextAlign.center,
                style: style ?? TextStyles.bold18White),
            const SizedBox(height: 24),
            SFButton(
              // width: 180,
              height: 48,
              text: buttonText ?? LocaleKeys.continue_,
              onPressed: onTap,
              textStyle: TextStyles.white16,
              gradient: AppColors.gradientBlueButton,
            ),
            const SizedBox(height: 32),
          ],
        );
      });
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
                keyText: message ?? LocaleKeys.your_account_has_been_created,
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
            Center(
              child: SFText(
                textAlign: TextAlign.center,
                keyText: LocaleKeys.do_you_really_want_to_change,
                style: TextStyles.white1w700size18,
              ),
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
          padding: EdgeInsets.zero,
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
                keyText: LocaleKeys.successfull, style: TextStyles.bold18White),
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

Future<T?> showLoadingDialog<T>(
  BuildContext context, {
  String? message,
  bool barrierDismissible = false,
}) async {
  return showCustomAlertDialog(
    context,
    barrierDismissible: barrierDismissible,
    width: MediaQuery.of(context).size.width * 0.7,
    showClosed: false,
    children: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 16, right: 16),
              child: SizedBox(
                  width: 32,
                  height: 32,
                  child: Platform.isAndroid
                      ? const CircularProgressIndicator(strokeWidth: 3)
                      : const CupertinoActivityIndicator())),
          SFText(
            keyText: message ?? LocaleKeys.loading.tr(),
            style: TextStyles.white16,
            textAlign: TextAlign.center,
          )
        ]),
  );
}

Future<T?> showComingSoonDialog<T>(BuildContext context) async {
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
                keyText: LocaleKeys.coming_soon, style: TextStyles.bold18White),
            const SizedBox(height: 44),
            // const Center(child: SFIcon(Ics.commingSoon)),
            // const SizedBox(height: 50),
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

Future<T?> showApproveSuccessfulDialog<T>(
  BuildContext context,
  String? message, {
  EdgeInsets? padding,
  TextStyle? style,
  TextStyle? txIDStyle,
  VoidCallback? onBackPress,
  VoidCallback? showWebView,
  bool barrierDismissible = true,
  required String txHash,
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
              keyText: message ?? LocaleKeys.transaction_submitted,
              style: style ?? TextStyles.bold18White),
          const SizedBox(height: 15),
          GestureDetector(
            onTap: showWebView,
            child: SFText(
              keyText: txHash,
              style: const TextStyle(
                color: AppColors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 40),
        ],
      );
    },
  );
}
