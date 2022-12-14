import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_statistic_resource.dart';
import 'package:slee_fi/common/widgets/sf_sub_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class TopBarStaking extends StatelessWidget {
  const TopBarStaking({this.valueGold, this.valueSilver, Key? key})
      : super(key: key);

  final double? valueGold;
  final double? valueSilver;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: SFSubAppBar(
              title: LocaleKeys.staking,
              textStyle: TextStyles.bold18LightWhite,
            ),
          ),
          GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 1, color: Colors.white.withOpacity(0.15)),
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ItemResource(
                      value: formatToken(valueSilver!),
                      url: Ics.icSlgt,
                    ),
                    const SizedBox(
                      width: 16,
                    ),
                    ItemResource(
                      value: formatToken(valueGold!),
                      url: Ics.icSlft,
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
