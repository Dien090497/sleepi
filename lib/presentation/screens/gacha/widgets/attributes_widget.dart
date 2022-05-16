import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class AttributesWidget extends StatelessWidget {
  const AttributesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> attributes = [
      Keys.efficiency,
      Keys.luck,
      Keys.bonus,
      Keys.special,
      Keys.resilience
    ];
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.greyBottomNavBar,
      ),
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(keyText: Keys.attributes),
          const SizedBox(height: 12),
          ...List.generate(
            attributes.length,
            (i) => Padding(
              padding: const EdgeInsets.only(left: 24.0, bottom: 8),
              child: SFText(
                keyText: attributes[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
