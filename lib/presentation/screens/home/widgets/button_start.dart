import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_start_tracking.dart';

class ButtonStart extends StatefulWidget {
  const ButtonStart({Key? key}) : super(key: key);

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  Timer? _timer;
  int startTime = 1 * 60;

  @override
  void initState() {
    startTimer();
    super.initState();
  }

  void startTimer() {
    if (_timer != null) {
      _timer?.cancel();
      _timer = null;
    }
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          _timer?.cancel();
        } else {
          setState(() {
            startTime--;
          });
        }
      },
    );
  }

  String convertTimer() {
    if (startTime <= 0) {
      return '00:00:00';
    } else {
      return '${startTime ~/ (60 * 60) < 10 ? '0${startTime ~/ (60 * 60)}' : startTime ~/ (60 * 60)}'
          ':${(startTime % (60 * 60)) ~/ 60 < 10 ? '0${(startTime % (60 * 60)) ~/ 60}' : (startTime % (60 * 60)) ~/ 60}'
          ':${(startTime % (60 * 60)) % 60 < 10 ? '0${(startTime % (60 * 60)) % 60}' : (startTime % (60 * 60)) % 60}';
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SFButton(
      text: startTime == 0 ? LocaleKeys.start.tr() : convertTimer(),
      textStyle: startTime == 0 ? TextStyles.white16 : TextStyles.lightGrey16,
      radius: 100,
      gradient: startTime == 0 ? AppColors.gradientBlueButton : null,
      color: AppColors.lightDark,
      height: 40,
      width: double.infinity,
      onPressed: () {
        if (startTime == 0) {
          showCustomAlertDialog(context,
            children:  PopUpConfirmStartTracking(
             onPressed: () {},
            )
        );
        }
      },
    );
  }
}
