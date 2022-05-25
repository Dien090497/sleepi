import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';

class GachaChance500Screen extends StatelessWidget {
  const GachaChance500Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: AppColors.greyBottomNavBar,
              ),
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
              child: SFText(keyText: 'Congraduation'),
            ),
            const SizedBox(height: 24),
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.black),
                color: AppColors.greyBottomNavBar,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 24),
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    padding:
                        const EdgeInsets.symmetric(vertical: 4, horizontal: 24),
                    child: SFText(keyText: 'QuolityQuolityQuolity'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: AppColors.black),
                    ),
                    height: 101,
                  ),
                  const SizedBox(height: 12),
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.greyBottomNavBar,
                    ),
                    child: SFText(keyText: 'IDIDIDID'),
                  ),
                  const SizedBox(height: 14),
                ],
              ),
            ),
            const SizedBox(height: 14),
            const AttributesWidget(),
            const SizedBox(height: 14),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.greyBottomNavBar,
              ),
              padding: const EdgeInsets.fromLTRB(36, 12, 36, 8),
              child: SFText(keyText: Keys.selectBedType),
            ),
            const SizedBox(height: 14),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.greyBottomNavBar,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: SFText(keyText: 'Short Bed'),
                    ),
                  ),
                  const SizedBox(width: 38),
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: AppColors.greyBottomNavBar,
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: SFText(keyText: 'Middle Bed'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.greyBottomNavBar,
              ),
              padding: const EdgeInsets.fromLTRB(36, 12, 36, 8),
              child: SFText(keyText: 'Long Bed'),
            ),
            const SizedBox(height: 40),
            SFButton(
              text: Keys.confirm,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
