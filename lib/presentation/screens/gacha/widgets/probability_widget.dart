import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ProbabilityWidget extends StatelessWidget {
  const ProbabilityWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: AppColors.greyBottomNavBar,
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
              ),
              child: SFText(keyText: Keys.probability),
            ),
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            height: 83,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
            ),
          ),
        ],
      ),
    );
  }
}
