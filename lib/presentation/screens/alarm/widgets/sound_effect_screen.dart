import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/alarm/widgets/sound_effect_list.dart';

class AlarmSoundEffectScreen extends StatelessWidget {
  const AlarmSoundEffectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.sound_effect,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: const SafeArea(child: AlarmSoundEffectList()),
    );
  }
}
