import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield_text_button.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

import 'asset_tile.dart';

class TransferList extends StatefulWidget {
  const TransferList({Key? key}) : super(key: key);

  @override
  State<TransferList> createState() => _TransferListState();
}

class _TransferListState extends State<TransferList> {
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      // width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.5,
      padding: EdgeInsets.fromLTRB(
          24, 24, 24, MediaQuery.of(context).viewInsets.bottom),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(
            keyText: LocaleKeys.asset,
            style: TextStyles.lightGrey14,
          ),
          const SizedBox(
            height: 4.0,
          ),
          const AssetTile(),
          const SizedBox(
            height: 24.0,
          ),
          const SFTextFieldTextButton(
            labelText: LocaleKeys.amount,
            textButton: LocaleKeys.all,
            textInputType: TextInputType.number,
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
