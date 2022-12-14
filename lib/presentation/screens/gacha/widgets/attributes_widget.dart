import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/item_attribute.dart';
import 'package:slee_fi/resources/resources.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({
    Key? key,
    this.efficiency = 0,
    this.luck = 0,
    this.bonus = 0,
    this.special = 0,
    this.resilience = 0,
  }) : super(key: key);

  final double? efficiency;
  final double? luck;
  final double? bonus;
  final double? special;
  final double? resilience;

  @override
  Widget build(BuildContext context) {
    List values = [efficiency, luck, bonus, special, resilience];
    double maxNumber = values.fold<double>(0, (max, e) => e > max ? e : max);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteOpacity5,
        borderRadius: BorderRadius.circular(16),
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
              valueActive: efficiency ?? 0,
              totalValue: maxNumber,
          ),
          ItemAttribute(
              linkImage: Ics.gift,
              colorIcon: AppColors.blue,
              title: LocaleKeys.luck.tr(),
              valueActive: luck ?? 0,
            totalValue: maxNumber,
          ),
          ItemAttribute(
              linkImage: Ics.bonus,
              colorIcon: AppColors.green,
              title: LocaleKeys.bonus.tr(),
              valueActive: bonus ?? 0,
            totalValue: maxNumber,
          ),
          ItemAttribute(
              linkImage: Ics.special,
              colorIcon: AppColors.white,
              title: LocaleKeys.special.tr(),
              valueActive: special ?? 0,
            totalValue: maxNumber,
          ),
          ItemAttribute(
              linkImage: Ics.resilience,
              colorIcon: AppColors.purple,
              title: LocaleKeys.resilience.tr(),
              valueActive: resilience ?? 0,
            totalValue: maxNumber,
          ),
        ],
      ),
    );
  }
}
