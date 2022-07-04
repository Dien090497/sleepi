import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpWarningBindWallet extends StatelessWidget {
  const PopUpWarningBindWallet({this.onPressed, Key? key,  this.content}) : super(key: key);
  final VoidCallback? onPressed;
  final String? content ;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 24),
      child: Column(
        children: [
          const Icon(
            Icons.warning_amber_outlined,
            color: AppColors.yellow,
            size: 32,
          ),
          const SizedBox(height: 28),
          SFText(
            keyText: content??LocaleKeys.warning_bind_wallet,
            style: TextStyles.lightGrey16.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SFButton(
            text: LocaleKeys.confirm,
            textStyle: TextStyles.w600WhiteSize16,
            height: 48,
            width: double.infinity,
            color: AppColors.blue,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
