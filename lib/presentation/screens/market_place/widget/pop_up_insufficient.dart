import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';

class PopupInsufficient extends StatelessWidget {
  const PopupInsufficient({Key? key, required this.nft}) : super(key: key);

  final MarketPlaceModel nft;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SFText(
          keyText: LocaleKeys.insufficient_avax,
          style: TextStyles.white1w700size18,
        ),
        SFText(
          keyText: LocaleKeys.spending_account,
          style: TextStyles.bold18Blue,
        ),
        const SizedBox(height: 32),
        Image.network(
          nft.image,
          width: 60,
          height: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 30),
        Container(
          decoration: BoxDecoration(
            color: AppColors.blue.withOpacity(0.1),
            borderRadius: BorderRadius.circular(100),
          ),
          padding: const EdgeInsets.all(8),
          child: SFText(
            keyText: nft.id.toString(),
            style: TextStyles.blue14,
          ),
        ),
        const SizedBox(height: 32,),
        SFCard(
          margin: EdgeInsets.zero,
          radius: 8,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 16),
          child: SFText(
            keyText: LocaleKeys.don_worry_transfer,
            style: TextStyles.w400lightGrey12,
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
                child: SFButton(
                  text: LocaleKeys.confirm,
                  onPressed: (){
                    Navigator.pushNamed(context, R.createPassword);
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
