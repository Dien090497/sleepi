import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_confirm.dart';

class PopUpJewelMarketPlace extends StatelessWidget {
  const PopUpJewelMarketPlace(
      {Key? key, required this.jewel, required this.onConfirmTap})
      : super(key: key);

  final MarketPlaceModel jewel;
  final VoidCallback onConfirmTap;

  void _showConfirmDialog(BuildContext context, MarketPlaceModel jewel) {
    Navigator.pop(context);
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupConfirmBuy(
        nft: jewel,
        onConfirmTap: onConfirmTap,
      ),
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
        Image.network(
          jewel.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        // SFText(
        //   keyText: '${LocaleKeys.luck_jewel.tr()} (${jewel.luck})',
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
            keyText: jewel.nftId.toString(),
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
                          '+${jewel.luck} ${jewel.type.reCase(StringCase.titleCase)}',
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
                          '+${jewel.efficiency}% ${LocaleKeys.base.tr()} ${jewel.type.reCase(StringCase.titleCase)}',
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
                child: SFButton(
              text: LocaleKeys.confirm,
              onPressed: (){
                _showConfirmDialog(context, jewel);
              },
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
