import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class MyJewelsShortWidget extends StatelessWidget {
  const MyJewelsShortWidget({required this.id, required this.icon, this.color, this.increase = true, Key? key})
      : super(key: key);

  final String icon;
  final Color? color;
  final String id;
  final bool increase;

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
              text: '${LocaleKeys.level.tr()} 3',
              textColor: AppColors.lightGrey,
              backgroundColor: AppColors.lightGrey.withOpacity(0.1),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                icon,
                width: 80,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.light4),
                    ),
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 16),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: id,
                      style: TextStyles.white1w700size12,
                    ),
                  ),
                  const SizedBox(width: 4),
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        // border: Border.all(color: AppColors.light4),
                        color: increase ? AppColors.green.withOpacity(0.15) : AppColors.red.withOpacity(0.15)),
                    padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 8),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: increase ? '+ 25%' : '- 25%',
                      style: increase ? TextStyles.greenW700size12: TextStyles.red12W700,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
