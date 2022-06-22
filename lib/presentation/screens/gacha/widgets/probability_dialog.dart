import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/items_probability.dart';
import 'package:slee_fi/resources/resources.dart';

class ProbabilityDialog extends StatelessWidget {
  const ProbabilityDialog({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    //TODO: Just For Test Delete when have real data
    final List<FakeListData> fakeListBed = [
      FakeListData(title: LocaleKeys.common_bed, parameter: '100%'),
      FakeListData(title: LocaleKeys.uncommon, parameter: '90%'),
      FakeListData(title: LocaleKeys.rare_bed, parameter: '80%'),
      FakeListData(title: LocaleKeys.epic_bed, parameter: '15%'),
      FakeListData(title: LocaleKeys.legendary_bed, parameter: '5%'),
    ];
    final List<FakeListData> fakeListJewels = [
      FakeListData(title: '${LocaleKeys.level} 1', parameter: '100%'),
      FakeListData(title: '${LocaleKeys.level} 2', parameter: '90%'),
      FakeListData(title: '${LocaleKeys.level} 3', parameter: '80%'),
      FakeListData(title: '${LocaleKeys.level} 4', parameter: '15%'),
      FakeListData(title: '${LocaleKeys.level} 5', parameter: '5%'),
    ];
    final List<FakeListData> fakeListItems = [
      FakeListData(title: '${LocaleKeys.level} 1', parameter: '100%'),
      FakeListData(title: '${LocaleKeys.level} 2', parameter: '90%'),
      FakeListData(title: '${LocaleKeys.level} 3', parameter: '80%'),
      FakeListData(title: '${LocaleKeys.level} 4', parameter: '15%'),
      FakeListData(title: '${LocaleKeys.level} 5', parameter: '5%'),
    ];
    final List<FakeListData> fakeListToken = [
      FakeListData(title: 'SLFT', parameter: '100%'),
      FakeListData(title: 'SLGT', parameter: '90%'),
    ];
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
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SFText(keyText: LocaleKeys.product_line_up, style: TextStyles.bold14LightWhiteWithOpacity,),
                const SizedBox(height: 16),
                ItemsProbability(
                  iconPath: Ics.icBedsProbability,
                  fakeListData: fakeListBed,
                  title: LocaleKeys.bed,
                  colorBgIcon: [
                    AppColors.blue.withOpacity(0.1),
                    AppColors.blue.withOpacity(0.1)
                  ],
                ),
                const SizedBox(height: 12),
                ItemsProbability(
                  iconPath: Ics.icPillows,
                  fakeListData: fakeListJewels,
                  title: LocaleKeys.jewels,
                  colorBgIcon: [
                    AppColors.green.withOpacity(0.1),
                    AppColors.blue.withOpacity(0.1)
                  ],
                ),
                const SizedBox(height: 12),
                ItemsProbability(
                  iconPath: Imgs.icItems,
                  fakeListData: fakeListItems,
                  title: LocaleKeys.item,
                  colorBgIcon: [
                    AppColors.blue.withOpacity(0.1),
                    AppColors.purple.withOpacity(0.1)
                  ],
                  isGradientText: true,
                  width: 45,
                  height: 45,
                ),
                const SizedBox(height: 12),
                ItemsProbability(
                  iconPath: Imgs.doubleIcon,
                  fakeListData: fakeListToken,
                  title: LocaleKeys.token,
                  width: 40,
                  height: 40,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

//TODO: Just For Test Delete when have real data
class FakeListData {
  String title;
  String parameter;

  FakeListData({required this.title, required this.parameter});
}
