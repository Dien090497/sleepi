import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  int quality = 5;
  final List<String> filters = [
    Keys.efficiency,
    Keys.luck,
    Keys.resilience,
    Keys.special,
    Keys.bonus,
  ];
  List<String> selected = [];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Column(
        children: [
          Row(
            children: [
              SFText(
                keyText: Keys.filter,
                suffix: ' (${selected.length})',
                style: TextStyles.white18W700,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {},
                  child: SFText(
                    keyText: Keys.clearFilter,
                    style: TextStyles.red14,
                  )),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: SFText(
              keyText: Keys.type,
              style: TextStyles.lightGrey14,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            children: [
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      border: Border.all(),
                      color: AppColors.transparent,
                    ),
                    alignment: Alignment.center,
                    child: SFText(
                      keyText: filters[0],
                      style: TextStyles.lightGrey16,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerLeft,
            child: SFText(
              keyText: Keys.quality,
              style: TextStyles.lightGrey14,
            ),
          ),
          const SizedBox(height: 16),
          Slider(
            value: quality.toDouble(),
            min: 0,
            max: 10,
            // label: '$quality',

            // onChangeEnd: (v) {
            //   quality = v.round();
            //   setState(() {});
            // },
            onChanged: (v) {
              quality = v.round();
              setState(() {});
            },
            // values: const RangeValues(0, 10),
          ),
        ],
      ),
    );
  }
}
