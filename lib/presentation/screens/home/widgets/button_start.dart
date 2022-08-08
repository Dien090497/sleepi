import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';

class ButtonStart extends StatefulWidget {
  const ButtonStart({
    Key? key,
    required this.enableStart,
    required this.onStartTracking,
    this.availableAt,
  }) : super(key: key);

  final bool enableStart;
  final VoidCallback onStartTracking;
  final int? availableAt;

  @override
  State<ButtonStart> createState() => _ButtonStartState();
}

class _ButtonStartState extends State<ButtonStart> {
  late bool countDownEnded = (widget.availableAt ?? -1) <= 0;

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
        widget.onStartTracking();
      },
      child: _CountDownText(
        onEnd: () {
          countDownEnded = true;
          setState(() {});
        },
        availableAt: widget.availableAt,
      ),
    );
  }
}

class _CountDownText extends StatefulWidget {
  const _CountDownText(
      {Key? key, required this.onEnd, required this.availableAt})
      : super(key: key);

  final VoidCallback onEnd;
  final int? availableAt;

  @override
  State<_CountDownText> createState() => _CountDownTextState();
}

class _CountDownTextState extends State<_CountDownText> {
  Timer? _timer;
  int startTime = 0;
  int? availableAt;

  @override
  void initState() {
    availableAt = widget.availableAt;
    startTimer();
    super.initState();
  }

  void startTimer() {
    if (availableAt != null && availableAt != 0) {
      final timeAvailable =
          DateTime.fromMillisecondsSinceEpoch(availableAt! * 1000);
      if (DateTime.now().isBefore(timeAvailable)) {
        startTime = timeAvailable.difference(DateTime.now()).inSeconds;
        const oneSec = Duration(seconds: 1);
        _timer = Timer.periodic(
          oneSec,
          (Timer timer) {
            if (startTime == 0) {
              _timer?.cancel();
              widget.onEnd();
            } else {
              if (!mounted) return;
              setState(() {
                startTime--;
              });
            }
          },
        );
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
    _timer?.cancel();
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
