import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_attribute.dart';
import 'package:slee_fi/resources/resources.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(15),
      ),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ItemAttribute(
              linkImage: Ics.efficiency,
              colorIcon: AppColors.ruby,
              title: LocaleKeys.efficiency.tr(),
              valueActive: 10),
          ItemAttribute(
              linkImage: Ics.gift,
              colorIcon: AppColors.blue,
              title: LocaleKeys.luck.tr(),
              valueActive: 2.5),
          ItemAttribute(
              linkImage: Ics.bonus,
              colorIcon: AppColors.green,
              title: LocaleKeys.bonus.tr(),
              valueActive: 8.2),
          ItemAttribute(
              linkImage: Ics.special,
              title: LocaleKeys.special.tr(),
              valueActive: 5.3),
          ItemAttribute(
              linkImage: Ics.resilience,
              title: LocaleKeys.resilience.tr(),
              valueActive: 6.2),
        ],
      ),
    );
  }
}
