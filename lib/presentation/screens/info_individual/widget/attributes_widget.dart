import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/resources/resources.dart';

import 'item_attribute.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(16),
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          ItemAttribute(
              linkImage: Imgs.efficiency, title: 'Efficiency', valueActive: 10),
          ItemAttribute(linkImage: Imgs.luck, title: 'Luck', valueActive: 2.5),
          ItemAttribute(
              linkImage: Imgs.bonus, title: 'Bonus', valueActive: 8.2),
          ItemAttribute(
              linkImage: Imgs.special, title: 'Special', valueActive: 5.3),
          ItemAttribute(
              linkImage: Imgs.resilience,
              title: 'Resilience',
              valueActive: 6.2),
        ],
      ),
    );
  }
}
