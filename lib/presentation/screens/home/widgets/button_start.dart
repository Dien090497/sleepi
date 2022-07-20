import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';

class ButtonStart extends StatefulWidget {
  const ButtonStart({
    Key? key,
    required this.enableStart,
    required this.onStartTracking,
  }) : super(key: key);

  final bool enableStart;
  final VoidCallback onStartTracking;

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  bool countDownEnded = false;

  @override
  Widget build(BuildContext context) {
    return HomeStartButton(
      radius: 100,
      gradient: widget.enableStart && countDownEnded
          ? AppColors.gradientBlueButton
          : null,
      color: AppColors.lightDark,
      height: 40,
      disabled: !(widget.enableStart && countDownEnded),
      width: double.infinity,
      onPressed: () async {
        final isAppInstalled = await LaunchApp.isAppInstalled(
          androidPackageName: 'com.google.android.apps.fitness',
          iosUrlScheme: 'x-apple-health://',
        );
        if (isAppInstalled) {
          widget.onStartTracking();
        } else {
          await LaunchApp.openApp(
            androidPackageName: 'com.google.android.apps.fitness',
            iosUrlScheme: 'x-apple-health://',
            appStoreLink:
                'itms-apps://itunes.apple.com/us/app/apple-health/id1242545199',
            // openStore: false
          );
        }
      },
      child: _CountDownText(
        onEnd: () {
          countDownEnded = true;
        },
      ),
    );
  }
}

class _CountDownText extends StatefulWidget {
  const _CountDownText({Key? key, required this.onEnd, this.userStatusTracking})
      : super(key: key);

  final VoidCallback onEnd;
  final UserStatusTrackingModel? userStatusTracking;

  @override
  State<_CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends State<_CountDownText> {
  late Timer _timer;
  late UserStatusTrackingModel userStatusTracking = widget.userStatusTracking!;
  int startTime = 0;

  void updateUserStatus() {
    startTimer();
    setState(() {
      userStatusTracking = widget.userStatusTracking!;
    });
  }

  @override
  void initState() {
    startTimer();
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          _timer.cancel();
          widget.onEnd();
        } else {
          if (!mounted) return;
          setState(() {
            startTime--;
          });
        }
      },
    );
    super.initState();
  }

  void startTimer() {
    if (widget.userStatusTracking != null &&
        widget.userStatusTracking!.availableAt != 0) {
      if (DateTime.now().isBefore(DateTime.fromMillisecondsSinceEpoch(
          widget.userStatusTracking!.availableAt * 1000))) {
        startTime = DateTime.fromMillisecondsSinceEpoch(
                widget.userStatusTracking!.availableAt * 1000)
            .difference(DateTime.now())
            .inSeconds;
      } else {
        startTime = 0;
      }
    }
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
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      startTime == 0 ? LocaleKeys.start.tr() : convertTimer(),
      style: startTime == 0 ? TextStyles.white16 : TextStyles.lightGrey16,
    );
  }
}
