import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';


class OtpCountdownTimer extends StatefulWidget {
  const OtpCountdownTimer({
    Key? key,
    required this.duration,
    required this.onSendEmail,
  }) : super(key: key);

  /// seconds
  final int duration;
  final VoidCallback onSendEmail;

  @override
  State<OtpCountdownTimer> createState() => _OtpCountdownTimerState();
}

class _OtpCountdownTimerState extends State<OtpCountdownTimer> {
  Timer? timer;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  _startTimer() {
    if (timer?.isActive == true) {
      return;
    }
    widget.onSendEmail();
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > widget.duration) {
        this.timer!.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SFTextButton(
      text: timer?.isActive == true
          ? '${widget.duration - timer!.tick}s'
          : LocaleKeys.send_code,
      textStyle: TextStyles.blue12,
      onPressed: _startTimer,
    );
  }
}
