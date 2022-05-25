import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/enum_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyBedShortWidget extends StatelessWidget {
  const MyBedShortWidget({Key? key, required this.bedType}) : super(key: key);

  final BedType bedType;

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
            top: 14,
            left: -30,
            child: TopLeftBanner(
              text: bedType.name,
              textColor: bedType.color,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const Spacer(),
                SFIcon(bedType.icon, color: AppColors.blue),
                SizedBox(height: 24.h),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: AppColors.light4),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                  child: SFText(
                    keyText: 'IDIDIDID',
                    style: TextStyles.white1w700size12,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(keyText: 'Mint 3', style: TextStyles.lightGrey11W500),
                    SFText(
                        keyText: 'Level 15', style: TextStyles.lightGrey11W500),
                  ],
                ),
                SizedBox(height: 4.h),
                const SFPercentBorder(valueActive: 70, totalValue: 100),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
