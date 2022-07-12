import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/transfer/transfer_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_spending.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/spending_detail_list.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';

class TabSpendingDetail extends StatefulWidget {
  const TabSpendingDetail(
      {Key? key, required this.pendingBloc, required this.historyBloc})
      : super(key: key);
  final PendingBloc pendingBloc;
  final PendingBloc historyBloc;

  @override
  State<TabSpendingDetail> createState() => _TabSpendingDetailState();
}

class _TabSpendingDetailState extends State<TabSpendingDetail> {
  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          FocusDetector(
            onFocusGained: () {
              BlocProvider.of<UserBloc>(context).add(RefreshBalanceToken());
            },
            child: SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                header: const WaterDropHeader(),
                onRefresh: () async {
                  context.read<UserBloc>().add(RefreshBalanceToken());
                  await Future.delayed(const Duration(milliseconds: 1000));
                  refreshController.refreshCompleted();
                },
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 19.0),
                      const PopupInfoSpending(),
                      const SizedBox(height: 12.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: BlocBuilder<UserBloc, UserState>(
                          builder: (context, state) {
                            final tokenList = <TokenEntity>[];

                            if (state is UserLoaded) {
                              tokenList.addAll(state.listTokens);
                            }
                            return Column(
                              children: tokenList
                                  .map((e) => SFCard(
                                        onTap: () => openTransfer(e),
                                        margin: const EdgeInsets.only(top: 8),
                                        child: ListTile(
                                          leading: Padding(
                                              padding: e.symbol.contains('avax')
                                                  ? const EdgeInsets.only(
                                                      left: 5)
                                                  : EdgeInsets.zero,
                                              child: SFIcon(
                                                e.icon,
                                                width: e.symbol.contains('avax')
                                                    ? 30
                                                    : 40,
                                                height:
                                                    e.symbol.contains('avax')
                                                        ? 30
                                                        : 40,
                                              )),
                                          minLeadingWidth: 12,
                                          title: SFText(
                                              keyText: e.symbol.toUpperCase(),
                                              style: TextStyles.lightWhite16,
                                              stringCase: StringCase.upperCase),
                                          trailing: SFText(
                                            keyText:
                                                e.balance.formatBalanceToken,
                                            style: TextStyles.lightWhite16,
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            );
                          },
                        ),
                      ),
                      const SizedBox(height: 18.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                            height: 48,
                            child: SFButtonOutLined(
                              title: LocaleKeys.stake,
                              textStyle: TextStyles.bold16Blue,
                              borderColor: AppColors.blue,
                              onPressed: () {
                                Navigator.pushNamed(context, R.staking);
                              },
                            )),
                      ),
                      const SizedBox(height: 25),
                      SpendingDetailList(
                        historyBloc: widget.historyBloc,
                        pendingBloc: widget.pendingBloc,
                      ),
                    ],
                  ),
                )),
          ),

          // Positioned(
          //   bottom: 24,
          //   left: 24,
          //   right: 24,
          //   child: SFButton(
          //       text: LocaleKeys.transfer,
          //       textStyle: TextStyles.w600WhiteSize16,
          //       gradient: AppColors.gradientBlueButton,
          //       height: 48,
          //       width: double.infinity,
          //       onPressed: () {
          //         Navigator.pushNamed(context, R.passcode,
          //             arguments: PasscodeArguments(route: R.transfer,argNewRoute:TokenEntity(address: address, displayName: displayName, name: name, symbol: symbol, icon: icon, balance: balance) ));
          // //       }),
          // ),
        ],
      ),
    );
  }

  openTransfer(TokenEntity e) {
    final walletCubit = context.read<WalletCubit>();
    final walletState = walletCubit.state;
    if (walletState is WalletNotExisted) {
      _showCreateOrImportWallet(context).then((value) {
        if (value is PopWithResults) {
          walletCubit.importWallet(value.results);
        }
      });
    } else if (walletState is WalletNotOpen) {
      Navigator.pushNamed(context, R.passcode).then((value) {
        if (value == true) {
          Navigator.pushNamed(context, R.transfer,
              arguments: TransferScreenArg(
                e,
                true,
                TransferType.token,
              ));
        }
      });
    } else if (walletState is WalletStateLoaded) {
      Navigator.pushNamed(context, R.transfer,
          arguments: TransferScreenArg(
            e,
            true,
            TransferType.token,
          ));
    }
  }

  _showCreateOrImportWallet(BuildContext context) async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }
}
