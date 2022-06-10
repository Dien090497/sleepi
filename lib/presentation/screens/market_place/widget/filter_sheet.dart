import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

// ignore_for_file: depend_on_referenced_packages
enum FilterType { bed, jewel, item }

class FilterSheet extends StatefulWidget {
  final FilterType filterType;

  const FilterSheet({required this.filterType, Key? key}) : super(key: key);

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  double level = 5;
  double mint = 5;
  final List<String> filterJewels = [
    LocaleKeys.effciency,
    LocaleKeys.luck,
    LocaleKeys.resillience,
    LocaleKeys.special,
    LocaleKeys.bonus,
  ];
  final List<String> filterItems = [
    LocaleKeys.effciency,
    LocaleKeys.luck,
    LocaleKeys.resillience,
    LocaleKeys.special,
  ];
  final List<String> filterBedType = [
    LocaleKeys.beds,
    LocaleKeys.bed_box,
  ];

  final List<String> filterBedClass = [
    LocaleKeys.short_bed,
    LocaleKeys.middle_bed,
    LocaleKeys.long_bed,
    LocaleKeys.flexible_bed,
  ];
  final List<String> filterBedQuality = [
    LocaleKeys.common_bed,
    LocaleKeys.uncommon_bed,
    LocaleKeys.rare_bed,
    LocaleKeys.epic_bed,
    LocaleKeys.legendary_bed,
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
          child: Row(
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
        ),
        Expanded(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TypeSelectionWidget(
                  name: LocaleKeys.type,
                  types: widget.filterType == FilterType.bed
                      ? filterBedType
                      : widget.filterType == FilterType.jewel
                          ? filterJewels
                          : filterItems,
                  listSelected: listSelected,
                  onSelect: (List<String> value) {
                    listSelected = value;
                    setState(() {});
                  },
                ),
                if (widget.filterType == FilterType.bed)
                  TypeSelectionWidget(
                    name: LocaleKeys.class_,
                    types: filterBedClass,
                    listSelected: listSelected,
                    onSelect: (List<String> value) {
                      listSelected = value;
                      setState(() {});
                    },
                  ),
                if (widget.filterType == FilterType.bed)
                  TypeSelectionWidget(
                    name: LocaleKeys.quality,
                    types: filterBedQuality,
                    listSelected: listSelected,
                    onSelect: (List<String> value) {
                      listSelected = value;
                      setState(() {});
                    },
                  ),
                ..._slider(LocaleKeys.level, 25, 0, level,
                    (value) => setState(() => level = value)),
                if (widget.filterType == FilterType.bed)
                  ..._slider(LocaleKeys.mint, 25, 0, mint,
                      (value) => setState(() => mint = value)),
                // const Spacer(),
                const SizedBox(height: 26),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
          child: SFButton(
            text: LocaleKeys.confirm,
            textStyle: TextStyles.white16,
            width: size.width,
            gradient: AppColors.gradientBlueButton,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }

  List<Widget> _slider(String label, int max, int min, double currentValue,
      Function(double value) onChange) {
    return [
      const SizedBox(height: 28),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: SFText(keyText: label, style: TextStyles.lightGrey14),
      ),
      SfSliderTheme(
        data: SfSliderThemeData(
          activeLabelStyle: TextStyles.lightGrey12,
          inactiveLabelStyle: TextStyles.lightGrey12,
        ),
        child: SfSlider(
          min: min,
          max: max,
          value: currentValue,
          interval: currentValue > 1 ? currentValue : 2,
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
            child: const DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          // minorTicksPerInterval: 1,
          onChanged: (dynamic value) => onChange(value),
        ),
      )
    ];
  }
}

class TypeSelectionWidget extends StatelessWidget {
  const TypeSelectionWidget(
      {Key? key,
      required this.name,
      required this.types,
      required this.onSelect,
      required this.listSelected})
      : super(key: key);
  final String name;
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          SFText(keyText: name, style: TextStyles.lightGrey14),
          const SizedBox(height: 20),
          ...List.generate(buildLength, (i) {
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
                              isSelected:
                                  listSelected.contains(types[secondIdx]),
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
          })
        ],
      ),
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
