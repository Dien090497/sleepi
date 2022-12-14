import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class GridViewBedItem extends StatelessWidget {
  const GridViewBedItem(
      {Key? key,
      required this.beds,
      this.onBedTap,
      this.onBuyTap,
      this.isScroll = true,
      this.onRefresh,
      this.onLoadMore,
      required this.isLoadMore})
      : super(key: key);

  final List<BedEntity> beds;
  final ValueChanged<BedEntity>? onBedTap;
  final ValueChanged<BedEntity>? onBuyTap;
  final bool isScroll;
  final Function? onRefresh;
  final Function? onLoadMore;
  final bool isLoadMore;

  @override
  Widget build(BuildContext context) {
    return SFGridView(
      count: beds.length,
      isLoadMore: isLoadMore,
      isScroll: isScroll,
      onRefresh: onRefresh,
      onLoadMore: _onLoadMore(),
      childAspectRatio: 8 / 10,
      itemBuilder: (context, i) {
        final bed = beds[i];
        final qualityColor = bed.quality != null
            ? bed.quality!.qualityBedColor
            : AppColors.commonBed;
        return GestureDetector(
          onTap: () {
            if (onBuyTap != null) {
              onBuyTap!(bed);
            } else if (onBedTap != null) {
              onBedTap!(bed);
            }
          },
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.lightDark,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  top: 20,
                  left: -30,
                  child: TopLeftBanner(
                    text: bed.nftClass.reCase(StringCase.camelCase),
                    textColor: qualityColor,
                  ),
                ),
                (beds[i].isLock == 1 && beds[i].statusNftSale == 'ON_SALE')
                    ? Positioned(
                        top: 14,
                        right: 10,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: AppColors.yellow,
                          ),
                          padding: const EdgeInsets.all(2),
                          child: SFText(
                            keyText: LocaleKeys.selling,
                            style: TextStyles.white10,
                          ),
                        ))
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: CachedImage(
                            image: bed.image,
                            height: 80,
                            width: 80,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border:
                              Border.all(color: qualityColor.withOpacity(0.1)),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: SFText(
                          keyText: bed.name,
                          style: TextStyles.white1w700size12
                              .copyWith(color: qualityColor),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SFText(
                              keyText: '${LocaleKeys.mint.tr()} ${bed.bedMint}',
                              style: TextStyles.lightGrey11W500),
                          SFText(
                              keyText: '${LocaleKeys.level.tr()} ${bed.level}',
                              style: TextStyles.lightGrey11W500),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      SFPercentBorderGradient(
                        valueActive: bed.bedMint.toDouble(),
                        totalValue: Const.bedMintMax,
                      ),
                      const SizedBox(height: 12),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _onLoadMore() async {
    if (onLoadMore != null) {
      onLoadMore!();
    }
    await Future.delayed(const Duration(milliseconds: 1500));
    return;
  }
}
