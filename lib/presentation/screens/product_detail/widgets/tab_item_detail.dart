import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_item_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/auto_reset_tab_widget.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabItemDetail extends StatelessWidget {
  const TabItemDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoResetTabWidget(
        onRefreshTab: () {
          final bloc = BlocProvider.of<JewelBloc>(context);
          if (bloc.categoryType == CategoryType.jewel) {
            bloc.add(const InitEvent(CategoryType.item));
          } else {
            bloc.add(const JewelRefreshList());
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFSubTabBar(
                labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                texts: const [LocaleKeys.item, LocaleKeys.upgrade],
              ),
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
                                      /// DIALOG DETAIL ITEM
                                      // _showJewelDialog(
                                      //     context, state.jewels[i]);
                                      /// ------------------------------
                                      showComingSoonDialog(context);

                                    },
                                    child: MyItemsShortWidget(
                                      name: state.jewels[i].name,
                                      image: state.jewels[i].image,
                                      quality: state.jewels[i].quality,
                                      level: state.jewels[i].level,
                                      type: state.jewels[i].type,
                                      items: state.jewels[i],
                                    ),
                                  );
                                },
                              );
                      },
                    ),
                    /// UPGRADE TAB FUNCTION
                    // const UpGradeTab(isJewel: false),
                    /// ------------------------------

                    Padding(
                      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
                      child: const Center(child: SFIcon(Ics.commingSoon)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _onLoadMore(JewelBloc cubit) async {
    cubit.add(const JewelFetchAllList());
    await Future.delayed(const Duration(milliseconds: 1500));
  }

  // void _showJewelDialog(
  //   BuildContext context,
  //   BedEntity items,
  // ) {
  //   showCustomDialog(
  //     context,
  //     padding: const EdgeInsets.all(24),
  //     children: [
  //       JewelDialogBody(
  //         textOnSell: (items.isLock == 1 && items.statusNftSale == 'ON_SALE')
  //             ? LocaleKeys.cancel_sell
  //             : LocaleKeys.sell,
  //         jewel: items,
  //         isJewel: false,
  //         onSellTap: () {
  //           Navigator.pop(context);
  //           final cubit = BottomBarInfoIndividualCubit()..init();
  //           showCustomDialog(context, children: [
  //             BlocProvider(
  //               create: (context) => cubit,
  //               child: BlocConsumer<BottomBarInfoIndividualCubit,
  //                   BottomBarInfoIndividualState>(
  //                 listener: (context, state) {
  //                   if (state is BottomBarInfoIndividualError) {
  //                     Navigator.pop(context);
  //                     Navigator.pop(context);
  //                     showMessageDialog(context, state.message);
  //                   }
  //                   if (state is BottomBarInfoIndividualLoaded) {
  //                     if (state.successTransfer) {
  //                       showSuccessfulDialog(context, null, onBackPress: () {
  //                         Navigator.pushNamedAndRemoveUntil(
  //                           context,
  //                           R.bottomNavigation,
  //                           (r) => false,
  //                         );
  //                       });
  //                     }
  //                   }
  //                 },
  //                 builder: (context, state) {
  //                   if (items.isLock == 1 && items.statusNftSale == 'ON_SALE') {
  //                     return CancelSell(
  //                       bedEntity: items,
  //                       cubit: cubit,
  //                     );
  //                   } else {
  //                     return PopUpSell(
  //                       bedEntity: items,
  //                       cubit: cubit,
  //                     );
  //                   }
  //                 },
  //               ),
  //             ),
  //           ]);
  //         },
  //         onTransferTap: () {
  //           final stateWalletCubit = context.read<WalletCubit>().state;
  //           if (stateWalletCubit is WalletNotExisted) {
  //             showCreateOrImportWallet(context: context).then(
  //                     (value) => _showWarningDialog(value, context));
  //           } else {
  //             if (items.isLock != 1) {
  //               Navigator.pop(context);
  //               final cubit = BottomBarInfoIndividualCubit()..init();
  //               cubit.estimateGas(contractAddress: items.contractAddress);
  //               showCustomDialog(context, children: [
  //                 BlocProvider(
  //                   create: (context) => cubit,
  //                   child: BlocConsumer<BottomBarInfoIndividualCubit,
  //                       BottomBarInfoIndividualState>(
  //                     listener: (context, state) {
  //                       if (state is BottomBarInfoIndividualError) {
  //                         showMessageDialog(context, state.message);
  //                       }
  //                       if (state is BottomBarInfoIndividualLoaded) {
  //                         if (state.successTransfer) {
  //                           Navigator.pop(context);
  //                           showSuccessfulDialog(context, null, onBackPress: () {
  //                             Navigator.pushNamedAndRemoveUntil(
  //                               context,
  //                               R.bottomNavigation,
  //                                   (r) => false,
  //                             );
  //                           });
  //                         }
  //                       }
  //                     },
  //                     builder: (context, state) {
  //                       return PopUpTransfer(
  //                         bedEntity: items,
  //                         cubit: cubit,
  //                         valueTransfer: 1,
  //                       );
  //                     },
  //                   ),
  //                 ),
  //               ]);
  //             } else {}
  //           }
  //         },
  //       ),
  //     ],
  //   );
  // }

  showCreateOrImportWallet({required BuildContext context}) async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  // void _showWarningDialog(dynamic value, BuildContext context) {
  //   if (value is PopWithResults) {
  //     final cubit = context.read<WalletCubit>();
  //     cubit.importWallet(value.results);
  //   }
  // }
}
