import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/apple_health_status_change_widget.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/microphone_status_change_widget.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/motion_data_status_change_widget.dart';
import 'package:slee_fi/presentation/screens/setting_permission/widgets/notification_status_change_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class SettingPermissionScreen extends StatelessWidget {
  const SettingPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Divider divider = Divider(
      color: AppColors.white.withOpacity(0.05),
      height: 1,
    );
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.permissions,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          children: [
            const SizedBox(
              height: 36.0,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(left: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16.0),
                color: AppColors.white.withOpacity(0.05),
              ),
              child: Column(
                children: [
                  SFListTile(
                    leading:const Padding(
                      padding:  EdgeInsets.only(right: 8),
                      child:  SFIcon(Ics.icQuestion, width: 24, color: AppColors.white,),
                    ),
                    text: LocaleKeys.about_permissions,
                    onPressed: () {},
                  ),
                  divider,
                  const AppleHealthStatusChangeWidget(),
                  divider,
                  const MicrophoneStatusChangeWidget(),
                  divider,
                  const MotionDataStatusChangeWidget(),
                  divider,
                  const NotificationStatusChangeWidget(),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
