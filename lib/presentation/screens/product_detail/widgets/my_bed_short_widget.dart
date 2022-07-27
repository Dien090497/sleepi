import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyBedShortWidget extends StatelessWidget {
  const MyBedShortWidget({
    Key? key,
    required this.bedId,
    required this.level,
    required this.mint,
    required this.type,
    required this.image,
  }) : super(key: key);

  final BigInt? bedId;
  final int? level;
  final int? mint;
  final String? type;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(16),
      ),
      // margin: const EdgeInsets.only(right: 24, bottom: 24),
      child: Stack(
        clipBehavior: Clip.hardEdge,
        children: [
          Positioned(
            top: 18,
            left: -30,
            child: TopLeftBanner(
              text: '$type',
              textColor: AppColors.green,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const Spacer(),
                SFIcon(image ?? ''),
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.light4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: SFText(
                    keyText: "$bedId",
                    style: TextStyles.white1w700size12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                        keyText: '${LocaleKeys.mint} $mint',
                        style: TextStyles.lightGrey11W500),
                    SFText(
                        keyText: '${LocaleKeys.level} $level',
                        style: TextStyles.lightGrey11W500),
                  ],
                ),
                SizedBox(height: 4.h),
                const SFPercentBorderGradient(valueActive: 70, totalValue: 100),
                const Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
