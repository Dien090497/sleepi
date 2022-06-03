import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';
import 'package:slee_fi/resources/resources.dart';

class UpGradeTab extends StatelessWidget {
  const UpGradeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                  color: AppColors.purple.withOpacity(0.035),
                  spreadRadius: 3,
                  blurRadius: 7,
                  offset: const Offset(0, 3), // changes position of shadow
                ),
              ], borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/upgrade.png',
                fit: BoxFit.cover,
              ),
            ),
            const SFLabelValue(label: LocaleKeys.cost,
              value: '21 SLFT',
              styleLabel: TextStyles.lightGrey16,
              styleValue: TextStyles.textColorSize16,),
            const SizedBox(height: 24,),
            SFText(
              keyText: LocaleKeys.success_rate, style: TextStyles.lightWhite14,),
            const SizedBox(height: 16,),
            Container(
              decoration: BoxDecoration(
                color: AppColors.whiteOpacity5,
                borderRadius: BorderRadius.circular(8),
              ),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AttributeProcessWidget(linkImage: Imgs.efficiency,
                    title: '${LocaleKeys.level.tr()} 2 Jewel',
                    totalValue: 10,
                    valueActive: 3.3,
                    isUpGrade: true,),
                  const AttributeProcessWidget(linkImage: Imgs.efficiency,
                    title: LocaleKeys.failure,
                    totalValue: 10,
                    valueActive: 6.8,
                    isUpGrade: true,),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}