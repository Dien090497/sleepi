import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_confirm.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_insufficient.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class PopUpBedMarketPlace extends StatelessWidget {
  const PopUpBedMarketPlace(
      {Key? key, required this.bed, required this.onConfirmTap})
      : super(key: key);

  final MarketPlaceModel bed;
  final VoidCallback onConfirmTap;

  void _showConfirmDialog(BuildContext context, MarketPlaceModel bed) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupConfirmBuy(
        nft: bed,
        onConfirmTap: onConfirmTap,
      ),
    );
  }

  void _showDonWorryDialog(BuildContext context, MarketPlaceModel nft) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupInsufficient(
        nft: nft,
      ),
    );
  }

  _showCreateOrImportWallet(BuildContext context) async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.buy,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 24),
        CachedNetworkImage(
          imageUrl: bed.image,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
              decoration: const BoxDecoration(
                color: AppColors.red,
                borderRadius:
                BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(Icons.error)),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: imageProvider, fit: BoxFit.cover),
            ),
          ),
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
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: bed.nftId.toString(),
            style: TextStyles.blue14,
          ),
        ),
        const SizedBox(height: 32),
        _Detail(
          bed: bed,
        ),
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
                return SFButton(
                  text: LocaleKeys.confirm,
                  onPressed: () {
                    Navigator.pop(context);
                    if (userState is UserLoaded) {
                      if (userState.userInfoEntity.wallet != null) {
                        if (userState.listTokens[2].balance <
                            double.parse(bed.price)) {
                          _showDonWorryDialog(context, bed);
                        } else {
                          _showConfirmDialog(context, bed);
                        }
                      } else {
                        _showCreateOrImportWallet(context);
                      }
                    }
                  },
                  textStyle: TextStyles.white16,
                  gradient: AppColors.blueGradient,
                  width: double.infinity,
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
                  const SizedBox(
                    width: 12,
                  ),
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
                  keyText: '${bed.time}/100',
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
                  keyText: '${bed.bedMint}/7',
                  style: TextStyles.lightWhite16W700),
            ],
          ),
        ],
      ),
    );
  }
}
