import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class PopUpAvalancheWallet extends StatelessWidget {
  const PopUpAvalancheWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SFAlertDialog(
      padding: const EdgeInsets.all(12.0),
      children: [
        Align(
            alignment: Alignment.topRight,
            child: GestureDetector(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(
                  Icons.close,
                  color: AppColors.lightGrey,
                ))),
        SFText(
          keyText: Keys.avalancheWallet,
          style: TextStyles.bold18LightWhite,
        ),
        SFButtonOutLined(title: Keys.createANewWallet, onPressed: () {}),
        const SizedBox(height: 6.0),
        SFButton(
          text: Keys.importAWalletUsingSeedPhrase,
          onPressed: () {},
        )
      ],
    );
  }
}
