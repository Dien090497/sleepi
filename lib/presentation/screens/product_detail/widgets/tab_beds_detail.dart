import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/auto_reset_tab_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/refresh_list_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabBedsDetail extends StatelessWidget {
  const TabBedsDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = NFTListCubit(CategoryType.bed)..init();
    return BlocProvider(
      create: (_) => cubit,
      child: AutoResetTabWidget(
        onRefreshTab: () {
          cubit.refresh().then((value) => cubit.refreshBedBox());
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFSubTabBar(
                  labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                  texts: const [LocaleKeys.bed, LocaleKeys.bedbox]),
              const SizedBox(height: 12),
              Expanded(
                child: TabBarView(
                  children: [
                    BlocBuilder<NFTListCubit, NftListState>(
                      builder: (context, state) {
                        if (state is NftListLoading ||
                            state is NftListInitial) {
                          return const LoadingIcon();
                        }
                        final listBeds = state is NftListLoaded
                            ? state.listBed
                            : <BedEntity>[];
                        return RefreshListWidget(
                          isBed: true,
                          child: GridView.builder(
                            itemCount: listBeds.length,
                            shrinkWrap: true,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            keyboardDismissBehavior:
                                ScrollViewKeyboardDismissBehavior.onDrag,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 12,
                              childAspectRatio: 7 / 9,
                              mainAxisSpacing: 12,
                            ),
                            itemBuilder: (context, i) {
                              final bed = listBeds[i];
                              final qualityColor = bed.quality != null
                                  ? bed.quality!.qualityBedColor
                                  : AppColors.commonBed;
                              return GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, R.nftInfo,
                                      arguments: InfoIndividualParams(
                                          bed: bed, buy: true));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.lightDark,
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                  child: Stack(
                                    clipBehavior: Clip.hardEdge,
                                    children: [
                                      Positioned(
                                        top: 20,
                                        left: -30,
                                        child: TopLeftBanner(
                                          text: bed.nftClass
                                              .reCase(StringCase.camelCase),
                                          textColor: qualityColor,
                                        ),
                                      ),
                                      (listBeds[i].isLock == 1 &&
                                              listBeds[i].statusNftSale ==
                                                  'ON_SALE')
                                          ? Positioned(
                                              top: 14,
                                              right: 10,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.yellow,
                                                ),
                                                padding:
                                                    const EdgeInsets.all(2),
                                                child: SFText(
                                                  keyText: LocaleKeys.selling,
                                                  style: TextStyles.white10,
                                                ),
                                              ))
                                          : const SizedBox(),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 16.0),
                                        child: Column(
                                          children: [
                                            const SizedBox(height: 10),
                                            Expanded(
                                              child: Container(
                                                alignment: Alignment.center,
                                                child: CachedImage(
                                                  image: bed.image,
                                                  height: 80,
                                                  width: 80,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                border: Border.all(
                                                    color: qualityColor
                                                        .withOpacity(0.1)),
                                              ),
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5,
                                                      horizontal: 16),
                                              child: SFText(
                                                keyText: bed.name,
                                                style: TextStyles
                                                    .white1w700size12
                                                    .copyWith(
                                                        color: qualityColor),
                                              ),
                                            ),
                                            const SizedBox(height: 8),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SFText(
                                                    keyText:
                                                        '${LocaleKeys.mint.tr()} ${bed.bedMint}',
                                                    style: TextStyles
                                                        .lightGrey11W500),
                                                SFText(
                                                    keyText:
                                                        '${LocaleKeys.level.tr()} ${bed.level}',
                                                    style: TextStyles
                                                        .lightGrey11W500),
                                              ],
                                            ),
                                            SizedBox(height: 4.h),
                                            SFPercentBorderGradient(
                                              valueActive:
                                                  bed.bedMint.toDouble(),
                                              totalValue: Const.bedMintMax,
                                            ),
                                            const SizedBox(height: 12),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.3),
                      child: const Center(child: SFIcon(Ics.commingSoon)),
                    ),

                    /// BEDBOX INFORMATION
                    // BlocBuilder<NFTListCubit, NftListState>(
                    //   builder: (context, state) {
                    //     if (state is NftListLoading ||
                    //         state is NftListInitial ||
                    //         (state is NftListLoaded &&
                    //             state.listBedBox.isEmpty &&
                    //             state.isLoadMoreBedBox)) {
                    //       return const LoadingIcon();
                    //     }
                    //     final listBeds = state is NftListLoaded
                    //         ? state.listBedBox
                    //         : <BedEntity>[];
                    //     return RefreshListWidget(
                    //       isBed: false,
                    //       child: GridView.builder(
                    //         itemCount: listBeds.length,
                    //         shrinkWrap: true,
                    //         padding: const EdgeInsets.symmetric(vertical: 16),
                    //         keyboardDismissBehavior:
                    //             ScrollViewKeyboardDismissBehavior.onDrag,
                    //         gridDelegate:
                    //             const SliverGridDelegateWithFixedCrossAxisCount(
                    //           crossAxisCount: 2,
                    //           crossAxisSpacing: 12,
                    //           mainAxisSpacing: 12,
                    //         ),
                    //         itemBuilder: (context, index) => MyItemBedBox(
                    //           bed: listBeds[index],
                    //           onTap: () {
                    //             showCustomDialog(
                    //               context,
                    //               padding: const EdgeInsets.all(24),
                    //               children: [
                    //                 PopUpBedBoxDetail(
                    //                   bedEntity: listBeds[index],
                    //                   onTransfer: () {
                    //                     final walletState =
                    //                         context.read<WalletCubit>().state;
                    //                     if (walletState is WalletNotExisted) {
                    //                       showCreateOrImportWallet(
                    //                           context: context);
                    //                     } else {
                    //                       if (listBeds[index].isLock != 1) {
                    //                         Navigator.pop(context);
                    //                         final cubit =
                    //                             BottomBarInfoIndividualCubit()
                    //                               ..init();
                    //                         cubit.estimateGas(
                    //                             contractAddress: listBeds[index]
                    //                                 .contractAddress);
                    //                         showCustomDialog(context,
                    //                             children: [
                    //                               BlocProvider(
                    //                                 create: (context) => cubit,
                    //                                 child: BlocConsumer<
                    //                                     BottomBarInfoIndividualCubit,
                    //                                     BottomBarInfoIndividualState>(
                    //                                   listener:
                    //                                       (context, state) {
                    //                                     if (state
                    //                                         is BottomBarInfoIndividualError) {
                    //                                       showMessageDialog(
                    //                                           context,
                    //                                           state.message);
                    //                                     }
                    //                                     if (state
                    //                                         is BottomBarInfoIndividualLoaded) {
                    //                                       if (state
                    //                                           .successTransfer) {
                    //                                         Navigator.pop(
                    //                                             context);
                    //                                         showSuccessfulDialog(
                    //                                             context, null,
                    //                                             onBackPress:
                    //                                                 () {
                    //                                           Navigator
                    //                                               .pushNamedAndRemoveUntil(
                    //                                             context,
                    //                                             R.bottomNavigation,
                    //                                             (r) => false,
                    //                                           );
                    //                                         });
                    //                                       }
                    //                                     }
                    //                                   },
                    //                                   builder:
                    //                                       (context, state) {
                    //                                     return PopUpTransfer(
                    //                                       bedEntity:
                    //                                           listBeds[index],
                    //                                       cubit: cubit,
                    //                                       valueTransfer: 1,
                    //                                     );
                    //                                   },
                    //                                 ),
                    //                               ),
                    //                             ]);
                    //                       } else {}
                    //                     }
                    //                   },
                    //                   onOpen: () {
                    //                     context
                    //                         .read<NFTListCubit>()
                    //                         .openBedBox(listBeds[index]);
                    //                   },
                    //                   onSell: () {
                    //                     Navigator.pop(context);
                    //                     final cubit =
                    //                         BottomBarInfoIndividualCubit()
                    //                           ..init();
                    //                     showCustomDialog(context, children: [
                    //                       BlocProvider(
                    //                         create: (context) => cubit,
                    //                         child: BlocConsumer<
                    //                             BottomBarInfoIndividualCubit,
                    //                             BottomBarInfoIndividualState>(
                    //                           listener: (context, state) {
                    //                             if (state
                    //                                 is BottomBarInfoIndividualError) {
                    //                               showMessageDialog(
                    //                                   context, state.message);
                    //                             }
                    //                             if (state
                    //                                 is BottomBarInfoIndividualLoaded) {
                    //                               if (state.successTransfer) {
                    //                                 showSuccessfulDialog(
                    //                                     context, null,
                    //                                     onBackPress: () {
                    //                                   Navigator
                    //                                       .pushNamedAndRemoveUntil(
                    //                                     context,
                    //                                     R.bottomNavigation,
                    //                                     (r) => false,
                    //                                   );
                    //                                 });
                    //                               }
                    //                             }
                    //                           },
                    //                           builder: (context, state) {
                    //                             if (listBeds[index].isLock ==
                    //                                     1 &&
                    //                                 listBeds[index]
                    //                                         .statusNftSale ==
                    //                                     'ON_SALE') {
                    //                               return CancelSell(
                    //                                 bedEntity: listBeds[index],
                    //                                 cubit: cubit,
                    //                               );
                    //                             } else {
                    //                               return PopUpSell(
                    //                                 bedEntity: listBeds[index],
                    //                                 cubit: cubit,
                    //                               );
                    //                             }
                    //                           },
                    //                         ),
                    //                       ),
                    //                     ]);
                    //                   },
                    //                 )
                    //               ],
                    //             );
                    //           },
                    //         ),
                    //       ),
                    //     );
                    //   },
                    // ),

                    ///--------------------------------------
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
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
