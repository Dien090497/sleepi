import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/sound_effect_list.dart';

class AlarmSoundEffectScreen extends StatelessWidget {
  const AlarmSoundEffectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: Keys.soundEffect,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: const SafeArea(
          child: AlarmSoundEffectList(),
        ),
      ),
    );
  }
}
