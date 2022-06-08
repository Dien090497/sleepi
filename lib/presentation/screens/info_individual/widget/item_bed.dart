import 'dart:math';

import 'package:flutter/material.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/enum_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/top_left_banner.dart';

class ItemBed extends StatelessWidget {
  const ItemBed({Key? key, required this.beds, required this.i})
      : super(key: key);
  final List<BedType> beds;
  final int i;

  @override
  Widget build(BuildContext context) {
    final bed = beds[i % BedType.values.length];
    var rnd = Random();
    var id = rnd.nextDouble() * 1000000;
    while (id < 100000) {
      id *= 10;
    }
    return GestureDetector(
      onTap: (){},
      child: Container(
        decoration: BoxDecoration(
            color: AppColors.lightDark,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.white.withOpacity(0.05),
              width: 1,
            )),
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
            Container(
              alignment: Alignment.center,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SFIcon(bed.icon, color: AppColors.blue),
                  const SizedBox(height: 24),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: AppColors.light4),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                    child: SFText(
                      keyText: '#${id.toInt()}',
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
