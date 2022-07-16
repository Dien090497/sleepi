import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpWalletWarning extends StatelessWidget {
  final VoidCallback? onPressed;
  const PopUpWalletWarning({this.onPressed, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 24.0, horizontal: 16),
      child: Column(
        children: [
          const Icon(
            Icons.warning_amber_outlined,
            color: AppColors.yellow,
            size: 32,
          ),
          const SizedBox(height: 20),
          SFText(
            keyText: LocaleKeys.your_wallet_is_being_created,
            style: TextStyles.bold18LightWhite,
          ),
          const SizedBox(height: 24),
          SFText(
            keyText: LocaleKeys.caution_please_check_your_seed_phrase,
            style: TextStyles.lightGrey16.copyWith(height: 1.5),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          SFButton(
            text: LocaleKeys.click_here_to_proceed,
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
