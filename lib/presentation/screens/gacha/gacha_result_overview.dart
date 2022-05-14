import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class GachaResultOverview extends StatelessWidget {
  const GachaResultOverview({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyBottomNavBar,
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 80),
                child: SFText(keyText: Keys.result),
              ),
              const SizedBox(height: 16),
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.greyBottomNavBar,
                ),
                width: double.infinity,
                padding:
                    const EdgeInsets.symmetric(vertical: 90, horizontal: 20),
                child:
                    SFText(keyText: Keys.displaysTheNftDischargedFromTheGacha),
              ),
              const SizedBox(height: 28),
              SFButton(
                text: Keys.back,
                width: double.infinity,
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
