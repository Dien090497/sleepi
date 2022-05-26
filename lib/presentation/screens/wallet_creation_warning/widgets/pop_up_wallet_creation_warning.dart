import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpWalletCreationWarning extends StatelessWidget {
  const PopUpWalletCreationWarning({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFAlertDialog(
      padding: const EdgeInsets.all(12.0),
      children: [
        const Icon(Icons.warning_amber_outlined, size: 28, color: AppColors.yellow,),
        const SizedBox(height: 20,),
        SFText(keyText: Keys.yourWalletIsBeingCreated, style: TextStyles.bold18LightWhite,),
        const SizedBox(height: 24,),

        SFButtonOutLined(title: Keys.createANewWallet, onPressed: () {}),
        const SizedBox(height: 6.0),
        SFButton(text: Keys.displaysWalletWarningInfo, onPressed: () {},)
      ],
    );
  }
}