import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore_for_file: depend_on_referenced_packages

class FilterSheet extends StatefulWidget {
  const FilterSheet({Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  double quality = 5;
  final List<String> filters = [
    LocaleKeys.efficiency,
    LocaleKeys.luck,
    LocaleKeys.resilience,
    LocaleKeys.special,
    LocaleKeys.bonus,
  ];
  List<String> listSelected = [];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              Row(
                children: [
                  SFText(
                    keyText: LocaleKeys.filter,
                    suffix: ' (${listSelected.length})',
                    style: TextStyles.white18W700,
                  ),
                  const Spacer(),
                  TextButton(
                      onPressed: () {
                        listSelected.clear();
                        setState(() {});
                      },
                      child: SFText(
                        keyText: LocaleKeys.clear_filter,
                        style: TextStyles.red14,
                      )),
                ],
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: SFText(
                  keyText: LocaleKeys.type,
                  style: TextStyles.lightGrey14,
                ),
              ),
              const SizedBox(height: 20),
              TypeSelectionWidget(
                types: filters,
                listSelected: listSelected,
                onSelect: (List<String> value) {
                  listSelected = value;
                  setState(() {});
                },
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        Container(
          alignment: Alignment.centerLeft,
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: SFText(
            keyText: LocaleKeys.quality,
            style: TextStyles.lightGrey14,
          ),
        ),
        SfSliderTheme(
          data: SfSliderThemeData(
            activeLabelStyle: TextStyles.lightGrey12,
            inactiveLabelStyle: TextStyles.lightGrey12,
          ),
          child: SfSlider(
            min: 0,
            max: 10,
            value: quality,
            interval: 10,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            showDividers: false,
            stepSize: 1,
            thumbIcon: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: AppColors.white,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(4),
              child: Container(
                decoration: const BoxDecoration(
                  color: AppColors.blue,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            minorTicksPerInterval: 1,
            onChanged: (dynamic value) {
              setState(() {
                quality = value;
              });
            },
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SFButton(
            text: LocaleKeys.confirm,
            textStyle: TextStyles.white16,
            width: size.width,
            gradient: AppColors.gradientBlueButton,
          ),
        ),
        const SizedBox(height: 28),
      ],
    );
  }
}

class TypeSelectionWidget extends StatelessWidget {
  const TypeSelectionWidget(
      {Key? key,
      required this.types,
      required this.onSelect,
      required this.listSelected})
      : super(key: key);

  final List<String> types;
  final List<String> listSelected;
  final ValueChanged<List<String>> onSelect;

  void _onTap(String type) {
    if (listSelected.contains(type)) {
      listSelected.remove(type);
    } else {
      listSelected.add(type);
    }
    onSelect(listSelected);
  }

  @override
  Widget build(BuildContext context) {
    final buildLength = (types.length / 2).ceil();
    return Column(
      children: List.generate(buildLength, (i) {
        final firstIdx = i * 2;
        final secondIdx = i * 2 + 1;
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: _Container(
                  text: types[firstIdx],
                  isSelected: listSelected.contains(types[firstIdx]),
                  onTap: () {
                    _onTap(types[firstIdx]);
                  },
                )),
                const SizedBox(width: 16),
                Expanded(
                  child: (secondIdx < types.length)
                      ? _Container(
                          text: types[secondIdx],
                          isSelected: listSelected.contains(types[secondIdx]),
                          onTap: () {
                            _onTap(types[secondIdx]);
                          },
                        )
                      : const SizedBox.shrink(),
                ),
              ],
            ),
            if (i < buildLength - 1) const SizedBox(height: 16),
          ],
        );
      }),
    );
  }
}

class _Container extends StatelessWidget {
  const _Container(
      {Key? key,
      required this.text,
      required this.isSelected,
      required this.onTap})
      : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
              color: isSelected ? AppColors.blue : AppColors.transparent),
          color: isSelected ? AppColors.transparent : AppColors.whiteOpacity5,
        ),
        alignment: Alignment.center,
        child: SFText(
          keyText: text,
          style: isSelected ? TextStyles.blue16 : TextStyles.lightGrey16,
        ),
      ),
    );
  }
}
