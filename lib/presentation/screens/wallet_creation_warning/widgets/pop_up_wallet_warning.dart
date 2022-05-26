import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpWalletWarning extends StatelessWidget {
  const PopUpWalletWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFAlertDialog(
      padding: const EdgeInsets.all(20.0),
      children: [
        const Icon(
          Icons.warning_amber_outlined,
          color: AppColors.yellow,
          size: 32,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 24.0),
          child: SFText(
            keyText: Keys.yourWalletIsBeingCreated,
            style: TextStyles.bold18LightWhite,
          ),
        ),
        SFText(
          keyText: Keys.yourWalletIsBeingCreated,
          style: TextStyles.lightGrey16,
        )
      ],
    );
  }
}