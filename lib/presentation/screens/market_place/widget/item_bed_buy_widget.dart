import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/enum_x.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';
import 'package:slee_fi/resources/resources.dart';

class ItemBedBuyWidget extends StatelessWidget {
  const ItemBedBuyWidget({required this.id, required this.item, this.color, this.onPressedButton, Key? key})
      : super(key: key);

  final ItemType item;
  final Color? color;
  final String id;
  final VoidCallback? onPressedButton;

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
              text: item.name,
              textColor: item.color,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 20.h),
              SFIcon(item.image, width: 80,),
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
                      keyText: id,
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
                      keyText: '+ 25%',
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
                            keyText: '10 AVAX',
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
