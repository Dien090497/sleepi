import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/alarm_status_change_widget.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/alarm_volume_change_widget.dart';

class AlarmScreen extends StatelessWidget {
  const AlarmScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.greyBottomNavBar,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
          side: const BorderSide(color: AppColors.black, width: 1),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_circle_left_outlined, color: AppColors.black,size: 40,),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: SFText(keyText: Keys.setting, style: TextStyles.bold32black,),
      ),
      body: SafeArea(
        child: ListView(
          children:  [
            const SizedBox(height: 36.0,),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                color: AppColors.greyBottomNavBar,
                border: Border.all(color: AppColors.black, width: 2),
                borderRadius: BorderRadius.circular(16.0),
                boxShadow:  [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.6),
                    blurRadius: 4,
                    offset: const Offset(2, 4), // Shadow position
                  ),
                ],
              ),
              child: Column(
                children: [
                  const AlarmStatusChangeWidget(),
                  const Divider(color: AppColors.black, thickness: 1),
                  ListTile(
                    onTap: () => Navigator.pushNamed(context, R.alarmSoundEffect),
                    dense: true,
                    title: SFText(keyText: Keys.music,
                      style: TextStyles.bold20black,
                    ),
                    trailing: const Icon(Icons.chevron_right, size: 32,),
                  ),
                  const Divider(color: AppColors.black, thickness: 1),
                  ListTile(
                    dense: true,
                    title: SFText(keyText: Keys.vibration,
                      style: TextStyles.bold20black,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SFText(keyText: "ON", style: TextStyles.bold15black,),
                        const Icon(Icons.chevron_right, size: 32,),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.black, thickness: 1),
                  ListTile(
                    dense: true,
                    title: SFText(keyText: Keys.snooze,
                      style: TextStyles.bold20black,
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SFText(keyText: "ON", style: TextStyles.bold15black,),
                        const Icon(Icons.chevron_right, size: 32,),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.black, thickness: 1),
                  const AlarmVolumnChangeWidget(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

