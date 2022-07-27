import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_confirm.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_insufficient.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpBedMarketPlace extends StatelessWidget {
  const PopUpBedMarketPlace(
      {Key? key,
      required this.bed,
      required this.onConfirmTap,
      required this.cubit})
      : super(key: key);

  final MarketPlaceModel bed;
  final MarketPlaceCubit cubit;
  final VoidCallback onConfirmTap;

  void _showConfirmDialog(BuildContext context, MarketPlaceModel bed) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupConfirmBuy(
        cubit: cubit,
        nft: bed,
        onConfirmTap: onConfirmTap,
      ),
    );
  }

  void _showDonWorryDialog(BuildContext context, MarketPlaceModel nft) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupInsufficient(nft: nft),
    );
  }

  Future<bool?> _showCreateOrImportWallet(BuildContext context) async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final qualityColor = bed.quality != null
        ? bed.quality!.qualityBedColor
        : AppColors.commonBed;
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.buy,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        CachedImage(
          image: bed.image,
          width: 80,
          height: 80,
        ),
        const SizedBox(height: 30),
        // SFText(
        //   keyText: '${LocaleKeys.luck_jewel.tr()} (${bed.luck})',
        //   style: TextStyles.white1w700size16,
        // ),
        // const SizedBox(height: 24),
        Container(
          decoration: BoxDecoration(
            color: qualityColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          child: SFText(
            keyText: bed.nftName,
            style: TextStyle(
                fontSize: 14, color: qualityColor, fontWeight: FontWeight.w500),
          ),
        ),
        const SizedBox(height: 32),
        _Detail(bed: bed),
        const SizedBox(height: 16),
        Row(
          children: [
            SFText(
              keyText: LocaleKeys.cost,
              style: TextStyles.lightGrey16,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: SFText(
                keyText: '${bed.price} ${bed.symbol}',
                style: TextStyles.bold16LightWhite,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Row(
          children: [
            Expanded(
                child: SFButton(
              text: LocaleKeys.cancel,
              onPressed: () => Navigator.pop(context),
              textStyle: TextStyles.lightGrey16,
              color: AppColors.whiteOpacity5,
              width: double.infinity,
            )),
            const SizedBox(width: 12),
            Expanded(
              child: BlocBuilder<UserBloc, UserState>(
                  builder: (context, userState) {
                return BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, walletState) {
                    return SFButton(
                      text: LocaleKeys.confirm,
                      onPressed: () {
                        Navigator.pop(context);
                        if (userState is UserLoaded) {
                          for (final element in userState.listTokens) {
                            if (element.symbol.toLowerCase() == 'avax') {
                              if (element.balance < double.parse(bed.price)) {
                                if (walletState is WalletNotExisted) {
                                  _showCreateOrImportWallet(context);
                                } else {
                                  _showDonWorryDialog(context, bed);
                                }
                              } else {
                                _showConfirmDialog(context, bed);
                              }
                            }
                          }
                        }
                      },
                      textStyle: TextStyles.white16,
                      gradient: AppColors.blueGradient,
                      width: double.infinity,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ],
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({Key? key, required this.bed}) : super(key: key);

  final MarketPlaceModel bed;

  @override
  Widget build(BuildContext context) {
    return SFCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(keyText: LocaleKeys.class_, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              Row(
                children: [
                  const SFIcon(
                    Ics.icTwoEyes,
                    color: AppColors.blue,
                  ),
                  const SizedBox(width: 12),
                  SFText(
                      keyText: bed.classNft == null
                          ? bed.type.reCase(StringCase.titleCase)
                          : bed.classNft!.reCase(StringCase.camelCase),
                      style: TextStyles.lightWhite16W700),
                ],
              ),
              SizedBox(height: 24.h),
              SFText(
                  keyText: LocaleKeys.durability,
                  style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(
                  keyText: '${double.parse(bed.durability).toInt()}/100',
                  style: TextStyles.lightWhite16W700),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(keyText: LocaleKeys.level, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(
                  keyText: bed.level.toString(),
                  namedArgs: const {'num': ''},
                  style: TextStyles.lightWhite16W700),
              SizedBox(height: 24.h),
              SFText(
                  keyText: LocaleKeys.bed_mint, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(
                  keyText: '${bed.bedMint}/${Const.bedMintMax.toInt()}',
                  style: TextStyles.lightWhite16W700),
            ],
          ),
        ],
      ),
    );
  }
}
