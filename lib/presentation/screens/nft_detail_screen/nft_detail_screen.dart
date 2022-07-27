import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/nft_detail_screen/widget/nft_detail_refresher.dart';
import 'package:slee_fi/presentation/screens/nft_detail_screen/widget/transfer_nft_widget.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_bed_short_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class NFTDetailArguments {
  final TokenEntity tokenEntity;
  final NftType nftType;

  NFTDetailArguments(this.tokenEntity, this.nftType);
}

class NFTDetailScreen extends StatelessWidget {
  const NFTDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as NFTDetailArguments;
    final token = args.tokenEntity;

    final nftDetailCubit = NftDetailCubit();

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, userState) {
        return BlocBuilder<WalletCubit, WalletState>(
          builder: (context, walletState) {
            if (walletState is WalletStateLoaded) {
              nftDetailCubit.init(
                  walletState.walletInfoEntity, token, args.nftType);
            }

            return BlocProvider(
              create: (_) => nftDetailCubit,
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
                            arguments:
                                PasscodeArguments(route: R.settingWallet)),
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
                            "${token.balance.formatBalanceToken} ${token.displayName}",
                        style: TextStyles.bold30White,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 18.0),
                      Container(
                        constraints: const BoxConstraints(maxHeight: 130),
                        padding: const EdgeInsets.symmetric(horizontal: 23),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Expanded(
                              child: BoxButtonWidget(
                                onTap: walletState is WalletStateLoaded
                                    ? () => SFModalBottomSheet.show(
                                          context,
                                          0.7,
                                          ModalReceiveWallet(
                                            address: walletState
                                                .walletInfoEntity.address,
                                            networkName: walletState
                                                .walletInfoEntity.networkName,
                                          ),
                                        )
                                    : null,
                                text: LocaleKeys.receive,
                                assetImage: Ics.icDownload,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: BoxButtonWidget(
                                onTap: () {
                                  if (state is NftDetailLoaded) {
                                    _showListNft(context);
                                  }
                                },
                                text: LocaleKeys.transfer,
                                assetImage: Ics.icArrowUpRight,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: BoxButtonWidget(
                                onTap: () {
                                  if (state is NftDetailLoaded) {
                                    _showListNft(context, isToSpending: true);
                                  }
                                },
                                text: LocaleKeys.to_spending,
                                assetImage: Ics.icRefresh,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      if (state is NftDetailLoaded)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: SFGridView(
                            isScroll: false,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (context, i) {
                              final nft = state.nftEntities[i];

                              return MyBedShortWidget(
                                bedId: nft.attribute?.tokenId,
                                level: nft.attribute?.level,
                                mint: nft.attribute?.bedMint,
                                type: nft.attribute?.type,
                                image: nft.attribute?.image,
                              );
                            },
                            count: state.nftEntities.length,
                          ),
                        ),
                    ];

                    return NftDetailRefresher(
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
          },
        );
      },
    );
  }

  void _showListNft(
    BuildContext context, {
    bool? isToSpending,
  }) {
    SFModalBottomSheet.show(
      context,
      0.85,
      ListTransferNftWidget(
        nftDetailCubit: BlocProvider.of<NftDetailCubit>(context),
        isToSpending: isToSpending ?? false,
      ),
      const EdgeInsets.fromLTRB(20, 32, 20, 0),
    );
  }
}
