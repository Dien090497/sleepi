import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_state.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_cancel_sell.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/pop_up_sell.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/auto_reset_tab_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';

import 'jewel_dialog_body.dart';

class TabJewelsDetail extends StatelessWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoResetTabWidget(
        onRefreshTab: () {
          BlocProvider.of<JewelBloc>(context).add(const JewelRefreshList());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFSubTabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  texts: const [LocaleKeys.jewels, LocaleKeys.upgrade]),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<JewelBloc, JewelState>(
                      builder: (context, state) {
                        final cubit = context.read<JewelBloc>();
                        return (state is! JewelStateLoaded ||
                                (state.loading && state.jewels.isEmpty))
                            ? const Center(child: CircularProgressIndicator())
                            : SFGridView(
                                isLoadMore: state.isLoadMore,
                                onLoadMore: _onLoadMore(cubit),
                                count: state.jewels.length,
                                childAspectRatio: 1,
                                onRefresh: () {
                                  cubit.add(const JewelRefreshList());
                                },
                                itemBuilder: (context, i) {
                                  return GestureDetector(
                                    onTap: () {
                                      _showJewelDialog(
                                        context,
                                        state.jewels[i],
                                        cubit,
                                      );
                                    },
                                    child: MyJewelsShortWidget(
                                        jewel: state.jewels[i]),
                                  );
                                },
                              );
                      },
                    ),

                    /// UPGRADE TAB FUNCTION
                    const UpGradeTab(isJewel: true),

                    /// ------------------------------
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _onLoadMore(JewelBloc cubit) async {
    cubit.add(const JewelFetchAllList());
    return Future.delayed(const Duration(milliseconds: 1500));
  }

  void _showJewelDialog(
    BuildContext context,
    BedEntity jewel,
    JewelBloc jewelBloc,
  ) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        BlocBuilder<WalletCubit, WalletState>(
          builder: (context, walletState) {
            return JewelDialogBody(
              textOnSell:
                  (jewel.isLock == 1 && jewel.statusNftSale == 'ON_SALE')
                      ? LocaleKeys.cancel_sell
                      : LocaleKeys.sell,
              jewel: jewel,
              onSellTap: () {
                Navigator.pop(context);
                final cubit = BottomBarInfoIndividualCubit()..init();
                showCustomDialog(context, children: [
                  BlocProvider(
                    create: (context) => cubit,
                    child: BlocConsumer<BottomBarInfoIndividualCubit,
                        BottomBarInfoIndividualState>(
                      listener: (context, state) {
                        if (state is BottomBarInfoIndividualError) {
                          showMessageDialog(context, state.message);
                        }
                        if (state is BottomBarInfoIndividualLoaded) {
                          if (state.successTransfer) {
                            Navigator.pop(context);
                            showSuccessfulDialog(context, null);
                            jewelBloc.add(const JewelRefreshList());
                          }
                        }
                      },
                      builder: (context, state) {
                        if (jewel.isLock == 1 &&
                            jewel.statusNftSale == 'ON_SALE') {
                          return CancelSell(
                            bedEntity: jewel,
                            cubit: cubit,
                          );
                        } else {
                          return PopUpSell(
                            bedEntity: jewel,
                            cubit: cubit,
                          );
                        }
                      },
                    ),
                  ),
                ]);
              },
              onTransferTap: () {
                if (walletState is WalletNotExisted) {
                  showCreateOrImportWallet(context: context);
                } else {
                  if (jewel.isLock != 1) {
                    Navigator.pop(context);
                    final cubit = BottomBarInfoIndividualCubit()..init();
                    cubit.estimateGas(contractAddress: jewel.contractAddress);
                    showCustomDialog(context, children: [
                      BlocProvider(
                        create: (context) => cubit,
                        child: BlocConsumer<BottomBarInfoIndividualCubit,
                            BottomBarInfoIndividualState>(
                          listener: (context, state) {
                            if (state is BottomBarInfoIndividualError) {
                              showMessageDialog(context, state.message);
                            }
                            if (state is BottomBarInfoIndividualLoaded) {
                              if (state.successTransfer) {
                                Navigator.pop(context);
                                showSuccessfulDialog(context, null,
                                    onBackPress: () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    R.bottomNavigation,
                                    (r) => false,
                                  );
                                });
                              }
                            }
                          },
                          builder: (context, state) {
                            return PopUpTransfer(
                              bedEntity: jewel,
                              cubit: cubit,
                              valueTransfer: 1,
                            );
                          },
                        ),
                      ),
                    ]);
                  } else {}
                }
              },
            );
          },
        ),
      ],
    );
  }

  Future<bool?> showCreateOrImportWallet(
      {required BuildContext context}) async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }
}
