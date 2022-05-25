import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ChanceWidget extends StatelessWidget {
  const ChanceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.black)),
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: const Text('30/500'),
            ),
          ),
          const SizedBox(width: 5),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, R.gacha500TimesChance);
            },
            child: Container(
              decoration:
                  BoxDecoration(border: Border.all(color: AppColors.black)),
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              child: SFText(
                keyText: Keys.get,
                toUpperCase: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
