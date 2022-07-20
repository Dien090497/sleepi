import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';

class ButtonStart extends StatefulWidget {
  const ButtonStart(
      {Key? key,
      required this.userStatusTracking,
      required this.enableStart,
      required this.onStartTracking})
      : super(key: key);
  final bool enableStart;
  final UserStatusTrackingModel userStatusTracking;
  final VoidCallback onStartTracking;

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  GlobalKey<_CountDownTextState> key = GlobalKey();
  bool countDownEnded = false;
  late UserStatusTrackingModel userStatusTrackingModel =
      widget.userStatusTracking;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded) {
          setState(() {
            userStatusTrackingModel = state.userStatusTracking!;
            key.currentState!.updateUserStatus();
          });
        }
      },
      builder: (context, state) {
        return FocusDetector(
          onFocusGained: () {
            context.read<HomeBloc>().add(UserStatusTracking());
          },
          child: HomeStartButton(
            radius: 100,
            gradient: widget.enableStart && countDownEnded
                ? AppColors.gradientBlueButton
                : null,
            color: AppColors.lightDark,
            height: 40,
            disabled: !(widget.enableStart && countDownEnded),
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
              key: key,
              userStatusTracking: userStatusTrackingModel,
              onEnd: () {
                countDownEnded = true;
                setState(() {});
              },
            ),
          ),
        );
      },
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
