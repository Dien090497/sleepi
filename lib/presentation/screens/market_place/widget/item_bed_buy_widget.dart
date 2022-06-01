import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class ItemBedBuyWidget extends StatelessWidget {
  const ItemBedBuyWidget({required this.icon, this.color, Key? key})
      : super(key: key);

  final String icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: 'Level 3',
              textColor: AppColors.lightGrey,
              backgroundColor: AppColors.lightGrey.withOpacity(0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 37.h),
              Image.asset(
                icon,
                width: 62,
                height: 60,
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        keyText: 'IDIDIDID',
                        style: TextStyles.white1w700size12,
                      ),
                    ),
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
                        keyText: '25%',
                        style: TextStyles.greenW700size12,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                    children: [
                      Expanded(
                          child: SFText(
                            keyText: '10 ${translate(Keys.avax)}',
                            style: TextStyles.white14W700,
                          )),
                      SFText(
                        keyText: Keys.buy,
                        style: TextStyles.blue14W700,
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
