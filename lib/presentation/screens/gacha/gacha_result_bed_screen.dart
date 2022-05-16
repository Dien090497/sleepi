import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';

class GachaResultBedScreen extends StatelessWidget {
  const GachaResultBedScreen({Key? key}) : super(key: key);

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
                decoration: BoxDecoration(
                  color: AppColors.greyBottomNavBar,
                  border: Border.all(color: AppColors.black),
                ),
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 12),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: SFText(keyText: 'QuolityQuolityQuolity'),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 4, horizontal: 16),
                      child: SFText(keyText: 'BedTypeBedType'),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: AppColors.greyBottomNavBar,
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      height: 100,
                      width: double.infinity,
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.black),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 2, horizontal: 24),
                      child: SFText(keyText: 'IDIDIDIDID'),
                    ),
                    const SizedBox(height: 28),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const AttributesWidget(),
              const SizedBox(height: 16),
              Center(
                child: SFButton(
                  text: Keys.next,
                  toUpperCase: true,
                  width: double.infinity,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(height: 16),
              Center(
                child: SFButton(
                  width: double.infinity,
                  text: Keys.showAllResult,
                  toUpperCase: true,
                  onPressed: () {
                    Navigator.pushNamed(context, R.gachaResultOverview);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
