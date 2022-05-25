import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_prercent_blue.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ChanceWidget extends StatelessWidget {
  const ChanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: SizedBox(
            height: 10,
            child: SFPercentBlue(
              valueActive: 30,
              totalValue: 50,
            ),

          ),
        ),

        GestureDetector(
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.blue)
              ),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
              child: SFText(keyText: 'Get', style: TextStyles.blue14,),
            ),
          ),
          onTap: () {
            Navigator.pushNamed(context, R.gacha500TimesChance);
          },
        )
      ],
    );
  }
}
