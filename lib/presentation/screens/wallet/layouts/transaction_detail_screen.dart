import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/presentation/screens/trade/trade_screen.dart';
import 'package:slee_fi/presentation/screens/transfer/transfer_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/transaction_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/get_history_transaction_usecase.dart';

class TransactionDetailArguments {
  final String title;
  final String img;
  final HistoryTransactionParams? typeHistory;
  final TokenEntity tokenEntity;

  TransactionDetailArguments(
      {required this.title,
      required this.img,
      this.typeHistory,
      required this.tokenEntity});
}

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as TransactionDetailArguments;
    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        return BackgroundWidget(
            appBar: AppBar(
                toolbarHeight: 80,
                leading: const Padding(
                  padding: EdgeInsets.only(left: 16),
                  child: SFBackButton(),
                ),
                actions: [
                  GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, R.passcode).then((value) {
                      if (value == true) {
                        Navigator.pushNamed(context, R.settingWallet);
                      }
                    }),
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 12),
                      child: SFIcon(Ics.icSetting),
                    ),
                  )
                ],
                automaticallyImplyLeading: false,
                backgroundColor: AppColors.transparent,
                leadingWidth: 48,
                elevation: 0,
                centerTitle: true,
                titleSpacing: 14,
                title: SFText(
                  keyText: args.title,
                  style: TextStyles.bold14Blue,
                  stringCase: StringCase.upperCase,
                )),
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  SFIcon(
                    args.img,
                    width: args.img == Ics.icAvax ? 32 : 40,
                    height: args.img == Ics.icAvax ? 32 : 40,
                  ),
                  const SizedBox(height: 16.0),
                  SFText(
                      keyText:
                          "${args.tokenEntity.balance.formatBalanceToken} ${args.title}",
                      style: TextStyles.bold30White,
                      textAlign: TextAlign.center,
                      stringCase: StringCase.upperCase),
                  const SizedBox(height: 36.0),
                  ConstrainedBox(
                    constraints: const BoxConstraints(maxHeight: 130),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                if (state is WalletStateLoaded) {
                                  SFModalBottomSheet.show(
                                    context,
                                    0.7,
                                    ModalReceiveWallet(
                                      address: state.walletInfoEntity.address,
                                      networkName: state.walletInfoEntity.networkName
                                    ),
                                  );
                                }
                              },
                              text: LocaleKeys.receive,
                              assetImage: Ics.icDownload,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          args.tokenEntity.symbol != 'USDC' ? Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                Navigator.pushNamed(context, R.transfer,
                                    arguments: TransferScreenArg(
                                        address: args.tokenEntity.address,
                                        isToSpending: true));
                              },
                              text: LocaleKeys.to_spending,
                              assetImage: Ics.icRefresh,
                            ),
                          ) : const SizedBox(),
                          args.tokenEntity.symbol != 'USDC' ? const SizedBox(width: 10,) : const SizedBox(),
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  R.sendToExternal,
                                  arguments: SendToExternalArguments(
                                    tokenEntity: args.tokenEntity,
                                    symbol: args.title,
                                    icon: args.img,
                                  ),
                                );
                              },
                              text: LocaleKeys.to_external,
                              assetImage: Ics.icArrowUpRight,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  R.trade,
                                  arguments: TradeArguments(
                                      contractAddressFrom:
                                          args.tokenEntity.address),
                                );
                              },
                              text: LocaleKeys.trade
                                  .tr()
                                  .reCase(StringCase.titleCase),
                              assetImage: Ics.icTransfer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32.0),
                  TransactionDetailList(typeHistory: args.typeHistory)
                ],
              ),
            ));
      },
    );
  }
}
