import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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
            linkImage: Imgs.efficiency,
            title: LocaleKeys.efficiency,
            valueActive: 10,
            colorIcon: AppColors.ruby,
          ),
          ItemAttribute(
            linkImage: Imgs.luck,
            title: LocaleKeys.luck,
            valueActive: 2.5,
            colorIcon: AppColors.blue,
          ),
          ItemAttribute(
            linkImage: Imgs.bonus,
            title: LocaleKeys.bonus,
            valueActive: 8.2,
            colorIcon: AppColors.green,
          ),
          ItemAttribute(
            linkImage: Imgs.special,
            title: LocaleKeys.special,
            valueActive: 5.3,
            colorIcon: AppColors.white,
          ),
          ItemAttribute(
            linkImage: Imgs.resilience,
            title: LocaleKeys.resilience,
            valueActive: 6.2,
            colorIcon: AppColors.amethst,
          ),
        ],
      ),
    );
  }
}
