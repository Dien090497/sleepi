import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/bed_model/beb_model.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class GridViewBedItem extends StatelessWidget {
  const GridViewBedItem(
      {Key? key,
      required this.beds,
      this.onBedTap,
      this.onBuyTap,
      this.isScroll = true, this.onRefresh})
      : super(key: key);

  final List<BedModel> beds;
  final ValueChanged<BedModel>? onBedTap;
  final ValueChanged<BedModel>? onBuyTap;
  final bool isScroll;
  final Function? onRefresh;

  @override
  Widget build(BuildContext context) {
    return SFGridView(
      count: beds.length,
      isScroll: isScroll,
      onRefresh: onRefresh,
      childAspectRatio: 8 / 10,
      itemBuilder: (context, i) {
        final bed = beds[i];
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
                  left: -40,
                  child: TopLeftBanner(
                    text: bed.type.reCase(StringCase.titleCase),
                    textColor: AppColors.white,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          child: CachedNetworkImage(
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
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          border: Border.all(color: AppColors.light4),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 16),
                        child: SFText(
                          keyText: bed.nftId.toString(),
                          style: TextStyles.white1w700size12,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SFText(
                              keyText: '${LocaleKeys.mint.tr()} ${bed.isMint}',
                              style: TextStyles.lightGrey11W500),
                          SFText(
                              keyText: '${LocaleKeys.level.tr()} ${bed.level}',
                              style: TextStyles.lightGrey11W500),
                        ],
                      ),
                      SizedBox(height: 4.h),
                      const SFPercentBorderGradient(
                          valueActive: 70, totalValue: 100),
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
}
