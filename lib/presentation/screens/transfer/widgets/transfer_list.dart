import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

import 'modal_transfer_between.dart';

class TransferList extends StatelessWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.all(12.0),
      child: ListView(
        children: [
          SFText(
            keyText: Keys.asset,
            style: TextStyles.lightGrey14,
          ),
          const SizedBox(
            height: 4.0,
          ),
          SFCard(
            onTap: () => SFModalBottomSheet.show(
                context, 0.55, const ModalTransferBetween()),
            child: ListTile(
              leading: Image.asset(Imgs.avax),
              title: SFText(
                keyText: Keys.avax,
                toUpperCase: true,
                style: TextStyles.lightWhite16,
              ),
              trailing: const Icon(
                Icons.chevron_right,
                size: 32,
                color: AppColors.lightGrey,
              ),
            ),
          ),
          const SizedBox(
            height: 24.0,
          ),
          const SFTextFieldTextButton(
            labelText: Keys.amount,
            textButton: Keys.all,
          ),
          const SizedBox(
            height: 4.0,
          ),
          const SizedBox(
            height: 4.0,
          ),
          SFText(
            keyText: "Available : 0 AVAX",
            style: TextStyles.lightGrey14,
          ),
          const SizedBox(
            height: 32.0,
          ),
        ],
      ),
    );
  }
}
