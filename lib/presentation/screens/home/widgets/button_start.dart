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
  const ButtonStart(
      {Key? key,
      this.userStatusTracking,
      required this.enableStart,
      required this.onStartTracking})
      : super(key: key);
  final bool enableStart;
  final UserStatusTrackingModel? userStatusTracking;
  final VoidCallback onStartTracking;

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  bool countDownEnded = true;

  @override
  Widget build(BuildContext context) {
    return HomeStartButton(
      radius: 100,
      gradient: widget.userStatusTracking != null &&
                  widget.userStatusTracking!.tracking != null ||
              widget.enableStart &&
                  countDownEnded &&
                  widget.userStatusTracking != null
          ? AppColors.gradientBlueButton
          : null,
      color: AppColors.lightDark,
      height: 40,
      disabled: !(widget.userStatusTracking != null &&
              widget.userStatusTracking!.tracking != null ||
          widget.enableStart &&
              countDownEnded &&
              widget.userStatusTracking != null),
      width: double.infinity,
      onPressed: () async {
        var isAppInstalledResult = await LaunchApp.isAppInstalled(
          androidPackageName: 'com.google.android.apps.fitness',
          iosUrlScheme: 'x-apple-health://',
        );
        if (isAppInstalledResult) {
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
        userStatusTracking: widget.userStatusTracking,
        onEnd: () {
          countDownEnded = true;
          setState(() {});
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
  int startTime = 0;

  @override
  void initState() {
    if (widget.userStatusTracking != null &&
        widget.userStatusTracking!.availableAt != 0) {
      startTime = DateTime.now()
          .difference(DateTime.fromMillisecondsSinceEpoch(
              widget.userStatusTracking!.availableAt * 1000))
          .inSeconds;
    }
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
          widget.onEnd();
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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      startTime == 0
          ? widget.userStatusTracking != null &&
                  widget.userStatusTracking!.tracking != null
              ? LocaleKeys.continue_.tr()
              : LocaleKeys.start.tr()
          : convertTimer(),
      style: startTime == 0 ? TextStyles.white16 : TextStyles.lightGrey16,
    );
  }
}
