import 'dart:async';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/usecase/send_otp_mail_usecase.dart';

import 'sf_buttons.dart';

class SendEmailButton extends StatefulWidget {
  const SendEmailButton({
    Key? key,
    required this.duration,
    required this.otpType,
    required this.onError,
    required this.getEmail,
  }) : super(key: key);

  /// seconds
  final int duration;
  final OTPType otpType;
  final Function(String message) onError;
  final String Function() getEmail;

  @override
  State<SendEmailButton> createState() => _OtpCountdownTimerState();
}

class _OtpCountdownTimerState extends State<SendEmailButton> {
  Timer? _timer;
  final _sendOtpUC = getIt<SendOTPMailUseCase>();
  bool process = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  _startTimer() {
    if (_timer?.isActive == true) {
      return;
    }

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (timer.tick > widget.duration) {
        _timer!.cancel();
      }
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return process
        ? const SizedBox(
            height: 48,
            width: 48,
            child: Padding(
              padding: EdgeInsets.all(10),
              child: CircularProgressIndicator(),
            ),
          )
        : SFTextButton(
            text: _timer?.isActive == true
                ? '${widget.duration - _timer!.tick}s'
                : LocaleKeys.send_code,
            textStyle: TextStyles.blue12,
            onPressed: _timer?.isActive == true ? (){} : _senOtp,
          );
  }

  bool _validateEmail(String email) {
    final message = email.validateEmail;

    widget.onError(message);
    return message.isEmpty;
  }

  void _senOtp() async {
    final email = widget.getEmail();
    if (!_validateEmail(email)) {
      return;
    }
    setState(() => process = true);
    final result =
        await _sendOtpUC.call(SendOTPParam(email.trim(), widget.otpType));
    result.fold(
      (l) => widget.onError('$l'),
      (r) => _startTimer(),
    );
    setState(() => process = false);
  }
}
