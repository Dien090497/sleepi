import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PopUpWalletWarning extends StatelessWidget {
  const PopUpWalletWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Icon(
          Icons.warning_amber_outlined,
          color: AppColors.yellow,
          size: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SFText(
            keyText: LocaleKeys.your_wallet_is_being_created,
            style: TextStyles.bold18LightWhite,
          ),
        ),
        SFText(
          keyText: LocaleKeys.your_wallet_is_being_created,
          style: TextStyles.lightGrey16,
        )
      ],
    );
  }
}
