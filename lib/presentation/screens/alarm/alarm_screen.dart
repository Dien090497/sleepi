import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/alarm_status_change_widget.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/alarm_volume_change_widget.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/snooze_status_change.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/vibration_status_change.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const icon = Icon(
      Icons.chevron_right,
      color: AppColors.lightGrey,
    );
    Divider divider = Divider(
      color: AppColors.white.withOpacity(0.05),
      height: 1,
    );
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.alarm,
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
                  const AlarmStatusChangeWidget(),
                  divider,
                  SFListTile(
                    text: LocaleKeys.sound,
                    trailing: const Padding(
                      padding: EdgeInsets.only(right: 16),
                      child: icon,
                    ),
                    onPressed: () =>
                        Navigator.pushNamed(context, R.alarmSoundEffect),
                  ),
                  divider,
                  const VibrationStatusChangeWidget(),
                  divider,
                  const SnoozeStatusChangeWidget(),
                  divider,
                  const AlarmVolumeChangeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
