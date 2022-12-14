import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
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

class PopUpJewelMarketPlace extends StatelessWidget {
  const PopUpJewelMarketPlace(
      {Key? key,
      required this.jewel,
      required this.onConfirmTap,
      required this.cubit})
      : super(key: key);

  final MarketPlaceModel jewel;
  final MarketPlaceCubit cubit;
  final VoidCallback onConfirmTap;

  void _showConfirmDialog(BuildContext context, MarketPlaceModel jewel) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupConfirmBuy(
        cubit: cubit,
        nft: jewel,
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

  Future<bool?> _showCreateOrImportWallet(BuildContext context) async {
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
          imageUrl: jewel.image,
          placeholder: (context, url) => const Center(
            child: SizedBox(
              width: 40.0,
              height: 40.0,
              child: CircularProgressIndicator(),
            ),
          ),
          errorWidget: (context, url, error) => Container(
              decoration: const BoxDecoration(
                color: AppColors.transparent,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: const Icon(Icons.error)),
          imageBuilder: (context, imageProvider) => Container(
            decoration: BoxDecoration(
              image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
            ),
          ),
          width: 60,
          height: 60,
        ),
        const SizedBox(height: 30),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SFText(keyText: jewel.name, style: TextStyles.blue14),
            ),
            const SizedBox(width: 15),
            Container(
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.1),
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: SFText(
                keyText: 'Lv ${jewel.level}',
                style: TextStyles.blue14,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
        SFCard(
          radius: 8,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.attributes,
                style: TextStyles.lightGrey16,
              ),
              const SizedBox(width: 4),
              SFText(
                keyText: jewel.type.reCase(StringCase.titleCase),
                style: TextStyles.blue16,
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        SFCard(
          radius: 8,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.effect,
                style: TextStyles.lightGrey16,
              ),
              const SizedBox(width: 4),
              SFText(
                keyText: '+${jewel.percentEffect}%',
                style: TextStyles.blue16,
                textAlign: TextAlign.right,
              ),
            ],
          ),
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
                keyText: '${jewel.price} ${jewel.symbol}',
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
                              if (element.balance < double.parse(jewel.price)) {
                                if (walletState is WalletNotExisted) {
                                  _showCreateOrImportWallet(context);
                                } else {
                                  _showDonWorryDialog(context, jewel);
                                }
                              } else {
                                _showConfirmDialog(context, jewel);
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
