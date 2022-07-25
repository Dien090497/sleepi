import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class SoundButton extends StatefulWidget {
  const SoundButton({Key? key}) : super(key: key);

  @override
  State<SoundButton> createState() => _SoundButtonState();
}

class _SoundButtonState extends State<SoundButton> {
  int indexSound = 0;

  late final SharedPreferences preferences;

  @override
  void initState() {
    _init();
    super.initState();
  }

  _init() async {
    preferences = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
        onFocusGained: _loadCurrentSound,
        child: SFButtonOutLined(
          title: LocaleKeys.alarm_bell.tr(args: [(indexSound + 1).toString()]),
          onPressed: () {
            Navigator.pushNamed(context, R.alarmSoundEffect);
          },
          fixedSize: const Size(274, 40),
          textStyle: TextStyles.blue16,
          borderColor: AppColors.blue,
          iconColor: AppColors.blue,
          withBorder: 1,
        ));
  }

  _loadCurrentSound() {
    setState(() {
      indexSound = preferences.getInt(Const.sound) ?? 0;
    });
  }
}
