import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';

class PopupConfirmBuy extends StatelessWidget {
  const PopupConfirmBuy(
      {Key? key,
      required this.nft,
      required this.onConfirmTap,
      required this.cubit})
      : super(key: key);

  final MarketPlaceModel nft;
  final VoidCallback onConfirmTap;
  final MarketPlaceCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.confirm,
          style: TextStyles.white1w700size16,
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SFText(
              keyText: LocaleKeys.token_consumptions,
              style: TextStyles.lightGrey14,
            ),
            const SizedBox(width: 4),
            Expanded(
              child: SFText(
                keyText: '${nft.price} ${nft.symbol}',
                style: TextStyles.bold16LightWhite,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
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
                child: cubit.isBuying
                    ? const LoadingIcon()
                    : SFButton(
                        text: LocaleKeys.confirm,
                        onPressed: onConfirmTap,
                        textStyle: TextStyles.white16,
                        gradient: AppColors.blueGradient,
                        width: double.infinity,
                      )),
          ],
        ),
      ],
    );
  }
}
