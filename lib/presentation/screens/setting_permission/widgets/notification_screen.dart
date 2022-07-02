import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class NotificationPermissionArg {
  final bool isSignUp;

  NotificationPermissionArg(this.isSignUp);
}

class NotificationPermissionScreen extends StatelessWidget {
  const NotificationPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final arg = ModalRoute.of(context)?.settings.arguments
        as NotificationPermissionArg?;
    return SafeArea(
      child: BackgroundWidget(
        child: Stack(
          children: [
            ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child: Image.asset(Imgs.notification, fit: BoxFit.fill)),
                const SizedBox(
                  height: 24.0,
                ),
                SFText(
                  keyText: LocaleKeys.would_like_to_send_you_notifications,
                  style: TextStyles.bold24LightWhite,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                SFText(
                  keyText:
                      LocaleKeys.notification_may_include_alert_sound_and_icon,
                  style: TextStyles.lightGrey16,
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                child: SFButton(
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    text: LocaleKeys.allow,
                    textStyle: TextStyles.w600WhiteSize16,
                    onPressed: () {
                      if (arg?.isSignUp == true) {
                        Navigator.pushNamedAndRemoveUntil(
                            context, R.bottomNavigation, (_) => false);
                        return;
                      }
                      Navigator.popUntil(
                          context, ModalRoute.withName(R.setting));
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
