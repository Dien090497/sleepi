import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/sound_effect_list.dart';

import '../../../../common/style/app_colors.dart';
import '../../../../common/widgets/sf_back_button.dart';
import '../../../../di/translations/keys.dart';

class AlarmSoundEffectScreen extends StatelessWidget {
  const AlarmSoundEffectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              margin: const EdgeInsets.only(left: 8.0),
              alignment: Alignment.centerLeft,
              child: const SFBackButton(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
              color: AppColors.greyBottomNavBar,
              height: 67,
              width: double.infinity,
              child: Center(child: SFText(keyText: Keys.soundEffect, style: TextStyles.bold32black,)),
            ),
            const Expanded(
                child: AlarmSoundEffectList(),
            ),
          ],
        ),
      ),
    );
  }
}
