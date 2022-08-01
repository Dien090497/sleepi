import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
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

class JewelsBuyWidget extends StatelessWidget {
  const JewelsBuyWidget({required this.jewel, this.onPressedButton, Key? key})
      : super(key: key);

  final MarketPlaceModel jewel;
  final VoidCallback? onPressedButton;

  @override
  Widget build(BuildContext context) {
   final qualityColor = jewel.jewelType?.qualityBedColor;

    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: '${LocaleKeys.level.tr()} ${jewel.level}',
              textColor: qualityColor,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              Expanded(
                child: CachedNetworkImage(
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
                      image: DecorationImage(
                          image: imageProvider, fit: BoxFit.cover),
                    ),
                  ),
                  width: 100,
                  height: 100,
                ),
              ),
              SizedBox(height: 22.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: qualityColor!.withOpacity(0.1)),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    alignment: Alignment.center,
                    child: SFText(
                      maxLines: 2,
                      keyText: jewel.name,
                      textAlign: TextAlign.center,
                      style: TextStyles.white1w700size12
                          .copyWith(color: qualityColor),
                    ),
                  )),
                  const SizedBox(width: 6),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: AppColors.light4),
                        color: AppColors.green.withOpacity(0.15)),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: '+ ${jewel.jewelCorrection}%',
                      style: TextStyles.greenW700size12,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Expanded(
                        child: SFText(
                      keyText: '${jewel.price} ${jewel.symbol}',
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
              const SizedBox(height: 10),
            ],
          ),
        ],
      ),
    );
  }
}
