import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_confirm.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_insufficient.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';

class PopUpItemMarketPlace extends StatelessWidget {
  const PopUpItemMarketPlace(
      {Key? key, required this.item, required this.onConfirmTap, required this.cubit})
      : super(key: key);

  final MarketPlaceModel item;
  final MarketPlaceCubit cubit;
  final VoidCallback onConfirmTap;

  void _showConfirmDialog(BuildContext context, MarketPlaceModel item) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupConfirmBuy(
        nft: item,
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

  void _showCreateOrImportWallet(BuildContext context) async {
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
          imageUrl: item.image,
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
        // SFText(
        //   keyText: '${LocaleKeys.luck_jewel.tr()} (${item.luck})',
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
            keyText: item.id.toString(),
            style: TextStyles.blue14,
          ),
        ),
        const SizedBox(height: 32),
        SFCard(
          radius: 8,
          margin: EdgeInsets.zero,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
          child: Column(
            children: [
              Row(
                children: [
                  SFText(
                    keyText: LocaleKeys.attributes,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText:
                          '+${item.luck} ${item.type.reCase(StringCase.titleCase)}',
                      style: TextStyles.blue16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  SFText(
                    keyText: LocaleKeys.effect,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: SFText(
                      keyText:
                          '+${item.efficiency}% ${LocaleKeys.base.tr()} ${item.type.reCase(StringCase.titleCase)}',
                      style: TextStyles.blue16,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
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
                keyText: '${item.price} ${item.symbol}',
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
                        for (var element in userState.listTokens) {
                          if (element.symbol.toLowerCase() == 'avax') {
                            if (element.balance < double.parse(item.price)) {
                              if(cubit.statusWallet) {
                                _showDonWorryDialog(context, item);
                              }else{
                                _showCreateOrImportWallet(context);
                              }
                            } else {
                              _showConfirmDialog(context, item);
                            }
                          }
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
