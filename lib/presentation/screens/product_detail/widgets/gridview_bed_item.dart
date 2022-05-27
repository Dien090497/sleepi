import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/enum_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class GridViewBedItem extends StatelessWidget {
  const GridViewBedItem(
      {Key? key,
      required this.beds,
      this.onBedTap,
      this.price,
      this.onBuyTap,
      this.isScroll = true})
      : super(key: key);

  final List<BedType> beds;
  final ValueChanged<BedType>? onBedTap;
  final ValueChanged<BedType>? onBuyTap;
  final int? price;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    return SFGridView(
      count: beds.length,
      isScroll: isScroll,
      itemBuilder: (context, i) {
        final bed = beds[i % BedType.values.length];

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
                    top: 14,
                    left: -30,
                    child: TopLeftBanner(
                      text: bed.name,
                      textColor: bed.color,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const Spacer(),
                        SFIcon(bed.icon, color: AppColors.blue),
                        const SizedBox(height: 20),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            border: Border.all(color: AppColors.light4),
                          ),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 16),
                          child: SFText(
                            keyText: 'IDIDIDID',
                            style: TextStyles.white1w700size12,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SFText(
                                keyText: 'Mint 3',
                                style: TextStyles.lightGrey11W500),
                            SFText(
                                keyText: 'Level 15',
                                style: TextStyles.lightGrey11W500),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        const SFPercentBorderGradient(valueActive: 70, totalValue: 100),
                        const SizedBox(height: 12),
                        if (price != null)
                          Row(
                            children: [
                              Expanded(
                                  child: SFText(
                                keyText: '$price ${translate(Keys.avax)}',
                                style: TextStyles.white14W700,
                              )),
                              SFText(
                                keyText: Keys.buy,
                                style: TextStyles.blue14W700,
                              ),
                            ],
                          ),
                        const SizedBox(height: 12),
                      ],
                    ),
                  ),
                ],
              ),
            ));
      },
    );
  }
}
