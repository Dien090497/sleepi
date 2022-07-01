import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';

import 'pop_up_warning_bind_wallet.dart';

class PopUpAvalancheWallet extends StatelessWidget {
  const PopUpAvalancheWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        children: [
          SFText(
            keyText: LocaleKeys.avalanche_wallet,
            style: TextStyles.bold18LightWhite,
          ),
          const SizedBox(
            height: 32,
          ),
          SizedBox(
              height: 48,
              child: SFButtonOutLined(
                title: LocaleKeys.create_a_new_wallet,
                textStyle: TextStyles.bold16Blue,
                borderColor: AppColors.blue,
                onPressed: () {
                  _showWarningDialog(context).then((_) =>
                      Navigator.pushNamed(context, R.createPasscode)
                          .then((value) {
                        if (value == true) {
                          Navigator.pushNamed(context, R.createWallet)
                              .then((value) {
                            if (value is PopWithResults) {
                              Navigator.pop(context, value);
                            }
                          });
                        }
                      }));
                },
              )),
          const SizedBox(
            height: 17,
          ),
          SFButton(
            text: LocaleKeys.import_a_wallet_using_seed_phrase,
            textStyle: TextStyles.w600WhiteSize16,
            height: 48,
            width: double.infinity,
            color: AppColors.blue,
            onPressed: () async {
              _showWarningDialog(context).then((value) =>
                  Navigator.pushNamed(context, R.importWallet).then((value) {
                    if (value is PopWithResults) {
                      Navigator.pop(context, value);
                    }
                  }));
            },
          ),
        ],
      ),
    );
  }

  _showWarningDialog(BuildContext context) async {
    await showCustomAlertDialog(
      context,
      showClosed: false,
      children: const PopUpWarningBindWallet(),
    );
  }
}
