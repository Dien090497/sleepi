import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class ItemBed extends StatelessWidget {
  const ItemBed(
      {Key? key,
      required this.bedType,
      required this.image,
      required this.selected,
      required this.id,
      required this.onTap})
      : super(key: key);

  final String bedType;
  final String image;
  final bool selected;
  final String id;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.lightDark,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color:
                selected ? AppColors.blue : AppColors.white.withOpacity(0.05),
            width: 1,
          ),
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            Positioned(
              top: 20,
              left: -40,
              child: TopLeftBanner(
                  text: bedType, textColor: bedType.qualityBedColor),
            ),
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                      child: Container(
                          alignment: Alignment.center, child: SFIcon(image))),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.light4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    margin: const EdgeInsets.only(bottom: 20),
                    child: SFText(
                      keyText: id,
                      style: TextStyles.white1w700size12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
