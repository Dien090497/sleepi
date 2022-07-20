import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/nft_entity/nft_entity.dart';
import 'package:slee_fi/entities/user/user_info_entity.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/failures/failure.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/nft_detail_screen/widget/nft_pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_approve.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/is_nft_approve_for_all_usecase.dart';
import 'package:slee_fi/usecase/send_nft_to_spending_usecase.dart';
import 'package:slee_fi/usecase/set_nft_approval_for_all_usecase.dart';
import 'package:slee_fi/usecase/transfer_nft_usecase.dart';

class ListTransferNftWidget extends StatefulWidget {
  const ListTransferNftWidget({
    Key? key,
    required this.nftDetailCubit,
    required this.isToSpending,
  }) : super(key: key);

  final bool isToSpending;
  final NftDetailCubit nftDetailCubit;

  @override
  State<ListTransferNftWidget> createState() => _ListTransferNftWidgetState();
}

class _ListTransferNftWidgetState extends State<ListTransferNftWidget> {
  final refreshController = RefreshController();
  final isLoadingNotifier = ValueNotifier(false);

  @override
  void dispose() {
    refreshController.dispose();
    isLoadingNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NftDetailCubit, NftDetailState>(
      bloc: widget.nftDetailCubit,
      builder: (context, state) {
        if (state is NftDetailLoaded) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(
                  keyText: LocaleKeys.transfer, style: TextStyles.white18W700),
              const SizedBox(height: 12),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  enablePullUp: state.hasMore,
                  enablePullDown: true,
                  onRefresh: () {
                    widget.nftDetailCubit.refresh().then((_) {
                      refreshController.refreshCompleted();
                    });
                  },
                  onLoading: () {
                    widget.nftDetailCubit.loadMore().then((_) {
                      refreshController.loadComplete();
                    });
                  },
                  child: ListView.separated(
                    itemCount: state.nftEntities.length,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    itemBuilder: (context, index) {
                      final nft = state.nftEntities[index];
                      final bedType =
                          BedType.values[index % BedType.values.length];
                      final userState =
                          context.read<UserBloc>().state as UserLoaded;
                      final walletState =
                          context.read<WalletCubit>() as WalletStateLoaded;

                      return GestureDetector(
                        onTap: () async {
                          if (widget.isToSpending) {
                            final isApproveNftRes =
                                await getIt<IsNftApproveForAllUseCase>()
                                    .call(IsNftApproveForAllParams(
                              nftAddress: nft.attribute!.contractAddress,
                              ownerAddress:
                                  walletState.walletInfoEntity.address,
                              operatorAddress: null,
                              credentials:
                                  walletState.walletInfoEntity.credentials,
                            ));
                            isApproveNftRes.fold(
                              (l) {},
                              (isApproved) {
                                if (isApproved) {
                                  _showTransferDialog(
                                    context,
                                    nft: nft,
                                    walletInfo: walletState.walletInfoEntity,
                                    isToSpending: widget.isToSpending,
                                    userInfo: userState.userInfoEntity,
                                  );
                                } else {
                                  showCustomAlertDialog(
                                    context,
                                    showClosed: false,
                                    children: PopUpConfirmApprove(
                                      tokenName:
                                          '${nft.symbol} #${nft.attribute!.tokenId!}',
                                      isLoadingNotifier: isLoadingNotifier,
                                      onConfirm: () async {
                                        isLoadingNotifier.value = true;
                                        final approveRes = await getIt<
                                                SetNftApprovalForAllUseCase>()
                                            .call(SetNftApprovalForAllParams(
                                          nftAddress:
                                              nft.attribute!.contractAddress,
                                          operatorAddress: walletState
                                              .walletInfoEntity.address,
                                          credentials: walletState
                                              .walletInfoEntity.credentials,
                                        ));
                                        approveRes.fold(
                                          (l) {
                                            showMessageDialog(context, '$l');
                                            Navigator.pop(context);
                                          },
                                          (r) {
                                            Navigator.pop(context);
                                          },
                                        );
                                        isLoadingNotifier.value = false;
                                      },
                                    ),
                                  );
                                }
                              },
                            );
                          } else {
                            _showTransferDialog(
                              context,
                              nft: nft,
                              walletInfo: walletState.walletInfoEntity,
                              isToSpending: widget.isToSpending,
                              userInfo: userState.userInfoEntity,
                            );
                          }
                        },
                        child: TransferNftWidget(
                          bedType: bedType,
                          bedId: nft.attribute?.tokenId,
                        ),
                      );
                    },
                    separatorBuilder: (_, i) => const SizedBox(height: 12),
                  ),
                ),
              ),
            ],
          );
        }
        return const SizedBox();
      },
    );
  }

  void _showTransferDialog(
    BuildContext context, {
    bool? isToSpending,
    required NFTEntity nft,
    required UserInfoEntity userInfo,
    required WalletInfoEntity walletInfo,
  }) async {
    final isLoadingNotifier = ValueNotifier<bool>(false);

    showCustomDialog(
      context,
      children: [
        NftPopUpTransfer(
          onConfirm: (toAddress) async {
            if (isLoadingNotifier.value) return;
            if (nft.attribute?.contractAddress.isEmpty ?? true) return;
            if (nft.attribute?.tokenId == null) return;
            isLoadingNotifier.value = true;
            final res = toAddress.isEmpty
                ? await getIt<SendNftToSpendingUseCase>()
                    .call(SendNftToSpendingParams(
                    nftAddress: nft.attribute!.contractAddress,
                    nftId: nft.attribute!.tokenId!,
                    userId: userInfo.id,
                    credentials: walletInfo.credentials,
                  ))
                : await getIt<TransferNftUseCase>().call(TransferNftParams(
                    nftAddress: nft.attribute!.contractAddress,
                    ownerAddress: walletInfo.address,
                    toAddress: toAddress,
                    nftId: nft.attribute!.tokenId!,
                    credentials: walletInfo.credentials,
                  ));
            await res.fold(
              (l) async {
                if ('$l' == Failure.notApprovalForNft) {
                  showCustomAlertDialog(
                    context,
                    showClosed: false,
                    children: PopUpConfirmApprove(
                      tokenName: '${nft.symbol} #${nft.attribute!.tokenId!}',
                      isLoadingNotifier: isLoadingNotifier,
                      onConfirm: () async {
                        isLoadingNotifier.value = true;
                        final approveRes =
                            await getIt<SetNftApprovalForAllUseCase>()
                                .call(SetNftApprovalForAllParams(
                          nftAddress: nft.attribute!.contractAddress,
                          operatorAddress: toAddress,
                          credentials: walletInfo.credentials,
                        ));
                        approveRes.fold(
                          (l) {
                            Navigator.pop(context);
                            showMessageDialog(context, '$l');
                          },
                          (r) {
                            Navigator.pop(context);
                          },
                        );
                        isLoadingNotifier.value = false;
                      },
                    ),
                  );
                } else {
                  showMessageDialog(context, '$l');
                }
              },
              (r) async {
                showSuccessfulDialog(context, null, onBackPress: () {
                  Navigator.popUntil(
                      context, (r) => r.settings.name == R.nftDetail);
                });
              },
            );
            isLoadingNotifier.value = false;
          },
          isToSpending: isToSpending,
          nft: nft,
          ownerAddress: walletInfo.address,
          isLoadingNotifier: isLoadingNotifier,
        )
      ],
    );
  }
}

class TransferNftWidget extends StatelessWidget {
  const TransferNftWidget({
    Key? key,
    required this.bedType,
    required this.bedId,
  }) : super(key: key);

  final BedType bedType;
  final BigInt? bedId;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      child: Row(
        children: [
          // TODO example data
          const SFIcon(Imgs.shortBed, width: 70, height: 70),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('$bedId', style: TextStyles.lightWhite16W700),
              const SizedBox(height: 4),
              Text(bedType.type.reCase(StringCase.titleCase),
                  style: TextStyles.lightWhite16W700),
            ],
          ),
        ],
      ),
    );
  }
}
