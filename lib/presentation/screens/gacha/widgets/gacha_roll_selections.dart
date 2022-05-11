import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class GachaRollSelections extends StatelessWidget {
  const GachaRollSelections({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            children: [
              SFText(
                keyText: '12SLFT',
              ),
              const SizedBox(height: 4),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyBottomNavBar,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SFText(keyText: Keys.singleGacha),
              ),
            ],
          ),
        ),
        const SizedBox(width: 18),
        Expanded(
          child: Column(
            children: [
              SFText(
                keyText: '100SLFT',
              ),
              const SizedBox(height: 4),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyBottomNavBar,
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SFText(
                  keyText: Keys.timesGacha,
                  args: const {'num': '10'},
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
