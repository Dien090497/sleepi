import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/asset_tile.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_confirm_transfer.dart';

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
      child: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                SFText(
                  keyText: LocaleKeys.asset,
                  style: TextStyles.lightGrey14,
                ),
                const SizedBox(height: 4.0),
                const AssetTile(),
                const SizedBox(height: 24.0),
                const SFTextFieldTextButton(
                  labelText: LocaleKeys.amount,
                  textButton: LocaleKeys.all,
                  textInputType: TextInputType.number,
                ),
                const SizedBox(height: 8.0),
                SFText(
                  keyText: "${LocaleKeys.available.tr()} : 0 AVAX",
                  style: TextStyles.lightGrey14,
                ),
                const SizedBox(height: 32.0),
              ],
            ),
          ),
          SFButton(
            text: LocaleKeys.confirm_transfer,
            textStyle: TextStyles.w600WhiteSize16,
            width: double.infinity,
            gradient: AppColors.gradientBlueButton,
            onPressed: () {
              showCustomAlertDialog(context,
                  showClosed: false, children: const PopUpConfirmTransfer());
            },
          ),
        ],
      ),
    );
  }
}
