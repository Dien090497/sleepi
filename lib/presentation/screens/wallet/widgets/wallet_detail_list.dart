import 'package:flutter/material.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/presentation/screens/nft_detail_screen/nft_detail_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/layouts/transaction_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

class WalletDetailList extends StatelessWidget {
  const WalletDetailList({
    Key? key,
    required this.tokenList,
  }) : super(key: key);

  final List<TokenEntity> tokenList;

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
      padding: const EdgeInsets.only(top: 20),
      child: SafeArea(
        top: false,
        child: ListView.builder(
          itemCount: tokenList.length,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          itemBuilder: (BuildContext context, int index) {
            return SFCard(
              padding: EdgeInsets.zero,
              onTap: () {
                if (index < 4) {
                  Navigator.pushNamed(context, R.transactionDetail,
                      arguments: TransactionDetailArguments(
                          title: tokenList[index].displayName,
                          img: tokenList[index].icon,
                          tokenEntity: tokenList[index],
                          typeHistory: HistoryTransactionParams(
                              typeHistory: index == 2
                                  ? Const.listTypeHistory.elementAt(0)
                                  : Const.listTypeHistory.elementAt(1),
                              tokenSymbol: tokenList[index].symbol,
                              page: 1)));
                } else {
                  Navigator.pushNamed(
                    context,
                    R.nftDetail,
                    arguments: NFTDetailArguments(
                      tokenList[index],
                      [
                        NftType.bed,
                        NftType.jewel,
                        NftType.bedbox,
                        NftType.item,
                      ][index - 4],
                    ),
                  );
                }
              },
              child: ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(
                      left: tokenList[index].icon == Ics.icAvax ||
                              tokenList[index].icon == Ics.icUsdc
                          ? 4
                          : 0),
                  child: SFIcon(
                    tokenList[index].icon,
                    width: tokenList[index].icon == Ics.icAvax ||
                            tokenList[index].icon == Ics.icUsdc
                        ? 32
                        : 40,
                    height: tokenList[index].icon == Ics.icAvax ||
                            tokenList[index].icon == Ics.icUsdc
                        ? 32
                        : 40,
                  ),
                ),
                horizontalTitleGap: 6,
                title: Row(
                  children: [
                    SFText(
                        keyText: index < 4
                            ? tokenList[index].displayName.toUpperCase()
                            : tokenList[index].displayName,
                        style: TextStyles.lightWhite16),
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        alignment: Alignment.centerRight,
                        child: Text(
                          tokenList[index].balance < 0.000001
                              ? '0'
                              : tokenList[index].balance.formatBalanceToken,
                          style: TextStyles.lightWhite16,
                          textAlign: TextAlign.end,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
