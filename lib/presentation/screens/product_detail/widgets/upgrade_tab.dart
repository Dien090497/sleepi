import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';
import 'package:slee_fi/resources/resources.dart';

class UpGradeTab extends StatelessWidget {
  const UpGradeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
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
            Container(
              width: size.width,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8),
              ),
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    SFText(keyText: Keys.cost, style: TextStyles.lightWhite16,),
                    const Spacer(),
                    SFText(keyText: '21 SLFT', style: TextStyles.white14,),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: SFText(keyText: Keys.successRate, style: TextStyles.white14,),
            ),
        Container(
          decoration: BoxDecoration(
            color: AppColors.whiteOpacity5,
            borderRadius: BorderRadius.circular(15),
          ),
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 8),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              AttributeProcessWidget(linkImage: Imgs.efficiency, title: 'Level 2 Jewel', totalValue: 10, valueActive: 3.3, isUpGrade: true,),
              AttributeProcessWidget(linkImage: Imgs.efficiency, title: 'Failure', totalValue: 10, valueActive: 6.8, isUpGrade: true,),
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
