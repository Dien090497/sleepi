import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_transfer.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_bed_short_widget.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class NFTDetailArguments {
  final TokenEntity tokenEntity;
  final WalletCubit walletCubit;

  NFTDetailArguments(this.tokenEntity, this.walletCubit);
}

class NFTDetailScreen extends StatelessWidget {
  const NFTDetailScreen({Key? key}) : super(key: key);

  void _showTransferDialog(BuildContext context) {
    showCustomDialog(
      context,
      children: [
        PopUpTransfer(
          onConfirm: () {},
          onCancel: () {
            Navigator.pop(context);
          },
          valueTransfer: 1,
          fee: 1,
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as NFTDetailArguments;
    final token = args.tokenEntity;
    final refreshController = RefreshController();

    return BlocBuilder<WalletCubit, WalletState>(
      bloc: args.walletCubit,
      builder: (context, walletState) {
        if (walletState is WalletStateLoaded &&
            walletState.walletInfoEntity != null) {
          return BlocProvider(
            create: (_) =>
                NftDetailCubit(walletState.walletInfoEntity!, token)..init(),
            child: BackgroundWidget(
              appBar: AppBar(
                  toolbarHeight: 80,
                  leading: const Padding(
                    padding: EdgeInsets.only(left: 16),
                    child: SFBackButton(),
                  ),
                  actions: [
                    GestureDetector(
                      onTap: () => Navigator.pushNamed(context, R.passcode,
                          arguments: PasscodeArguments(R.settingWallet)),
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
                    keyText: token.displayName,
                    style: TextStyles.bold14Blue,
                    stringCase: StringCase.titleCase,
                  )),
              child: BlocBuilder<NftDetailCubit, NftDetailState>(
                buildWhen: (prev, cur) => cur is! NftDetailError,
                builder: (context, state) {
                  final List<Widget> children = [
                    const SizedBox(width: 16),
                    SFIcon(token.icon),
                    const SizedBox(height: 16.0),
                    SFText(
                      keyText:
                          "${token.balance.toStringAsFixed(6)} ${token.displayName}",
                      style: TextStyles.bold30White,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 36.0),
                    Container(
                      constraints: const BoxConstraints(maxHeight: 130),
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () => SFModalBottomSheet.show(
                                context,
                                0.7,
                                const ModalReceiveWallet(
                                  address: 'input the address',
                                  networkName: LocaleKeys.avalanche_wallet,
                                ),
                              ),
                              text: LocaleKeys.receive,
                              assetImage: Ics.icDownload,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  R.sendToExternal,
                                  arguments: SendToExternalArguments(
                                    tokenEntity: token,
                                    symbol: token.symbol,
                                    icon: token.icon,
                                  ),
                                );
                              },
                              text: LocaleKeys.transfer,
                              assetImage: Ics.icArrowUpRight,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: BoxButtonWidget(
                              onTap: () {
                                Navigator.pushNamed(context, R.transfer,
                                    arguments: token);
                              },
                              text: LocaleKeys.to_spending,
                              assetImage: Ics.icRefresh,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32.0),
                    if (state is NftDetailLoaded)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: SFGridView(
                          isScroll: false,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, i) {
                            return MyBedShortWidget(
                              bedType: BedType.flexible,
                              bedId: state.nftEntities[i].id,
                            );
                          },
                          count: state.nftEntities.length,
                        ),
                      ),
                  ];

                  final nftCubit = context.read<NftDetailCubit>();

                  return SmartRefresher(
                    controller: refreshController,
                    enablePullUp: state is NftDetailLoaded && state.hasMore,
                    enablePullDown: state is NftDetailLoaded,
                    onRefresh: () {
                      nftCubit.refresh().then((_) {
                        refreshController.refreshCompleted();
                      });
                    },
                    onLoading: () {
                      nftCubit.loadMore().then((_) {
                        refreshController.loadComplete();
                      });
                    },
                    child: ListView.builder(
                      itemCount: children.length,
                      shrinkWrap: true,
                      itemBuilder: (context, i) {
                        return children[i];
                      },
                    ),
                  );
                },
              ),
            ),
          );
        }
        return const LoadingScreen();
      },
    );
  }
}
