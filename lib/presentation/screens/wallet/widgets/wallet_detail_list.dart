import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/wallet/layouts/transaction_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletDetailList extends StatelessWidget {
  const WalletDetailList({Key? key, required this.tokenList}) : super(key: key);

  final List<TokenEntity> tokenList;

  @override
  Widget build(BuildContext context) {
    List keyList = [
      "SLFT",
      "SLGT",
      "AVAX",
      LocaleKeys.beds.tr(),
      LocaleKeys.jewels.tr(),
      LocaleKeys.bed_box.tr(),
      LocaleKeys.item.tr(),
    ];
    List icons = [
      Ics.icSlft,
      Ics.icSlgt,
      Ics.icAvax,
      Ics.icBeds,
      Ics.icJewels,
      Ics.icBedBoxes,
      Imgs.icItems
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
      child: SafeArea(
        top: false,
        child: tokenList.isEmpty ?
        ListView.builder(
            itemCount: keyList.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            itemBuilder: (BuildContext context, int index) {
              return SFCard(
                onTap: () {
                  if (index < 3) {
                    Navigator.pushNamed(context, R.transactionDetail,
                        arguments: TransactionDetailArguments(
                          keyList[index],
                          icons[index],
                        ));
                  }
                },
                child: ListTile(
                  leading: Padding(
                    padding:
                        EdgeInsets.only(left: icons[index] == Ics.icAvax ? 4 : 0),
                    child: SFIcon(
                      icons[index],
                      width: icons[index] == Ics.icAvax ? 32 : 40,
                      height: icons[index] == Ics.icAvax ? 32 : 40,
                    ),
                  ),
                  title: SFText(
                      keyText: keyList[index], style: TextStyles.lightWhite16),
                  trailing: SFText(
                    keyText: "0.00",
                    style: TextStyles.lightWhite16,
                  ),
                ),
              );
            }) :
        ListView.builder(
            itemCount: tokenList.length,
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
            itemBuilder: (BuildContext context, int index) {
              return SFCard(
                onTap: () {
                  if (index < 3) {
                    Navigator.pushNamed(context, R.transactionDetail,
                        arguments: TransactionDetailArguments(
                          tokenList[index].displayName,
                          tokenList[index].icon,
                        ));
                  }
                },
                child: ListTile(
                  leading: Padding(
                    padding:
                    EdgeInsets.only(left: tokenList[index].icon == Ics.icAvax ? 4 : 0),
                    child: SFIcon(
                      tokenList[index].icon,
                      width: tokenList[index].icon == Ics.icAvax ? 32 : 40,
                      height: tokenList[index].icon == Ics.icAvax ? 32 : 40,
                    ),
                  ),
                  title: SFText(
                      keyText: tokenList[index].displayName, style: TextStyles.lightWhite16),
                  trailing: SFText(
                    keyText: index < 3 ? tokenList[index].balance.toStringAsFixed(2) : tokenList[index].balance.toStringAsFixed(0),
                    style: TextStyles.lightWhite16,
                  ),
                ),
              );
            })
      ),
    );
  }
}
