import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';
import 'package:slee_fi/resources/resources.dart';

class ItemBedBuyWidget extends StatelessWidget {
  const ItemBedBuyWidget({required this.item, this.onPressedButton, Key? key})
      : super(key: key);

  final MarketPlaceModel item;
  final VoidCallback? onPressedButton;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 20,
            left: -40,
            child: TopLeftBanner(
              text: item.nftName,
              textColor: AppColors.white,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Image.network(item.image, width: 60,
                height: 60, fit: BoxFit.cover,),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.light4),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: item.id.toString(),
                      style: TextStyles.white1w700size12,
                    ),
                  ),
                  const SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: AppColors.green.withOpacity(0.15)),
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: '+ ${item.efficiency}%',
                      style: TextStyles.greenW700size12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    children: [
                      Expanded(
                          child: SFText(
                            keyText: '${item.price} ${item.symbol}',
                            style: TextStyles.white14W700,
                          )),
                      SFIconButton(
                          text: LocaleKeys.buy,
                         textStyle: TextStyles.white12,
                        stringCase: StringCase.upperCase,
                        icon: Ics.icCart,
                        onPressed: onPressedButton,
                      ),
                    ],
                  ),
              ),
              const SizedBox(height: 18),
            ],
          ),
        ],
      ),
    );
  }
}
