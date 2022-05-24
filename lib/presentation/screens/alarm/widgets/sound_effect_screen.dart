import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/sound_effect_list.dart';

import '../../../../common/style/app_colors.dart';
import '../../../../common/widgets/sf_back_button.dart';
import '../../../../di/translations/keys.dart';

class AlarmSoundEffectScreen extends StatelessWidget {
  const AlarmSoundEffectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(context: context, title: Keys.soundEffect, textStyle: TextStyles.bold18LightWhite,),
        body: const SafeArea(
          child: AlarmSoundEffectList(),
        ),
      ),
    );
  }
}
