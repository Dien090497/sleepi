import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ButtonStart extends StatefulWidget {
  const ButtonStart({Key? key}) : super(key: key);

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  late Timer _timer;
  late int startTime = 0;

  @override
  void initState() {
    startTime = 1 * 60;
    startTimer();
    super.initState();
  }


  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (startTime == 0) {
          _timer.cancel();
        } else {
          setState(() {
            startTime--;
          });
        }
      },
    );
  }

  convertTimer() {
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SFButton(
      text: startTime == 0 ? LocaleKeys.start.tr() : '${convertTimer()}',
      textStyle:
      startTime == 0 ? TextStyles.white16 : TextStyles.lightGrey16,
      radius: 100,
      gradient: startTime == 0 ? AppColors.gradientBlueButton : null,
      color: AppColors.lightDark,
      height: 40,
      width: size.width,
      onPressed: () {
        if (startTime == 0) Navigator.pushNamed(context, R.tracking);
      },
    );
  }
}
