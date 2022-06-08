import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/wallet/layouts/transaction_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletDetailList extends StatelessWidget {
  const WalletDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List keyList = [
      LocaleKeys.avax,
      LocaleKeys.slft,
      LocaleKeys.slgt,
      LocaleKeys.beds,
      LocaleKeys.jewels,
      LocaleKeys.bed_box,
      LocaleKeys.item
    ];
    List icons = [
      Ics.icSolanaCircle,
      Ics.icGold,
      Ics.icSliver,
      Ics.icBeds,
      Imgs.jewels,
      Ics.icBedBoxes,
      Ics.icDiamond
    ];
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
          itemCount: keyList.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          itemBuilder: (BuildContext context, int index) {
            return SFCard(
              onTap: () {
                if(index < 3 )Navigator.pushNamed(context, R.transactionDetail, arguments: TransactionDetailArguments(keyList[index], icons[index]));
              },
              child: ListTile(
                leading: SFIcon(
                  icons[index],
                  width: 32,
                ),
                title: SFText(
                    keyText: keyList[index], style: TextStyles.lightWhite16),
                trailing: SFText(
                  keyText: "xxxxxxxxx",
                  style: TextStyles.lightWhite16,
                ),
              ),
            );
          }),
    );
  }
}
