import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/atribute_process.dart';

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
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          AtributeProcessWidget(linkImage: 'assets/icons/efficiency.png', title: 'Efficiency', totalValue: 10, valueActive: 10),
          AtributeProcessWidget(linkImage: 'assets/icons/efficiency.png', title: 'Luck', totalValue: 10, valueActive: 2.5),
          AtributeProcessWidget(linkImage: 'assets/icons/efficiency.png', title: 'Bonus', totalValue: 10, valueActive: 8.2),
          AtributeProcessWidget(linkImage: 'assets/icons/efficiency.png', title: 'Special', totalValue: 10, valueActive: 5.3),
          AtributeProcessWidget(linkImage: 'assets/icons/efficiency.png', title: 'Resilience', totalValue: 10, valueActive: 6.2),
        ],
      ),
    );
  }
}
