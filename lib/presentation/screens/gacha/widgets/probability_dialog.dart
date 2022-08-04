import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_probability.dart';

class ProbabilityDialog extends StatelessWidget {
  final bool normalGacha;
  final List<dynamic>? dialogData;
  const ProbabilityDialog({required this.dialogData,  required this.normalGacha, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: SFText(
              keyText: LocaleKeys.probability,
              style: TextStyles.bold18LightWhite,
            ),
          ),
          const SizedBox(height: 24),
          SFText(keyText: LocaleKeys.product_line_up,
            style: TextStyles.bold14LightWhiteWithOpacity,),
          const SizedBox(height: 16),
          ItemsProbability(
            configInfo: dialogData,
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
