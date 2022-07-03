import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_state.dart';
import 'package:slee_fi/presentation/screens/wallet/layouts/transaction_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletDetailList extends StatelessWidget {
  WalletDetailList({
    Key? key,
  }) : super(key: key);

  final List keyList = [
    "SLFT",
    "SLGT",
    "AVAX",
    LocaleKeys.beds.tr(),
    LocaleKeys.jewels.tr(),
    LocaleKeys.bed_box.tr(),
    LocaleKeys.item.tr(),
  ];
  final List icons = [
    Ics.icSlft,
    Ics.icSlgt,
    Ics.icAvax,
    Ics.icBeds,
    Ics.icJewels,
    Ics.icBedBoxes,
    Imgs.icItems
  ];

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<DetailWalletCubit>();
    cubit.loadCurrentWallet();

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
          child: BlocBuilder<DetailWalletCubit, DetailWalletState>(
            builder: (context, state) {
              if (state is DetailWalletStateSuccess) {
                final tokenList = state.tokenList;

                if (tokenList?.isEmpty ?? true) {
                  return ListView.builder(
                      itemCount: keyList.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      itemBuilder: (BuildContext context, int index) {
                        return SFCard(
                          onTap: () {
                            if (tokenList != null) {
                              if (index < 3) {
                                Navigator.pushNamed(
                                    context, R.transactionDetail,
                                    arguments: TransactionDetailArguments(
                                      img: icons[index],
                                      title: keyList[index],
                                      tokenEntity: tokenList[index],
                                    ));
                              } else {
                                Navigator.pushNamed(
                                    context, R.transactionDetail,
                                    arguments: TransactionDetailArguments(
                                      img: icons[index],
                                      title: keyList[index],
                                      tokenEntity: tokenList[index],
                                    ));
                              }
                            }
                          },
                          child: ListTile(
                            leading: Padding(
                              padding: EdgeInsets.only(
                                  left: icons[index] == Ics.icAvax ? 4 : 0),
                              child: SFIcon(
                                icons[index],
                                width: icons[index] == Ics.icAvax ? 32 : 40,
                                height: icons[index] == Ics.icAvax ? 32 : 40,
                              ),
                            ),
                            title: SFText(
                                keyText: keyList[index],
                                style: TextStyles.lightWhite16),
                            trailing: SFText(
                              keyText: "-",
                              style: TextStyles.lightWhite16,
                            ),
                          ),
                        );
                      });
                } else if (tokenList != null) {
                  return ListView.builder(
                      itemCount: tokenList.length,
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 12.0),
                      itemBuilder: (BuildContext context, int index) {
                        return SFCard(
                          onTap: () {
                            if (index < 3) {
                              Navigator.pushNamed(context, R.transactionDetail,
                                  arguments: TransactionDetailArguments(
                                    title: tokenList[index].displayName,
                                    img: tokenList[index].icon,
                                    tokenEntity: tokenList[index],
                                  ));
                            } else {
                              Navigator.pushNamed(context, R.transactionDetail,
                                  arguments: TransactionDetailArguments(
                                    title: tokenList[index].displayName,
                                    img: tokenList[index].icon,
                                    tokenEntity: tokenList[index],
                                  ));
                            }
                          },
                          child: ListTile(
                            leading: Padding(
                              padding: EdgeInsets.only(
                                  left: tokenList[index].icon == Ics.icAvax
                                      ? 4
                                      : 0),
                              child: SFIcon(
                                tokenList[index].icon,
                                width: tokenList[index].icon == Ics.icAvax
                                    ? 32
                                    : 40,
                                height: tokenList[index].icon == Ics.icAvax
                                    ? 32
                                    : 40,
                              ),
                            ),
                            title: SFText(
                                keyText: tokenList[index].displayName,
                                style: TextStyles.lightWhite16),
                            trailing: SFText(
                              keyText:
                                  tokenList[index].balance.toStringAsFixed(2),
                              style: TextStyles.lightWhite16,
                            ),
                          ),
                        );
                      });
                }
                return const SizedBox();
              }
              return const SizedBox();
            },
          )),
    );
  }
}
