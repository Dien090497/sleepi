import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterSheet extends StatefulWidget {
  const FilterSheet(
      {Key? key,
      required this.sections,
      required this.sliders,
      required this.cubit})
      : super(key: key);

  final Map<String, FilterSliderValues> sliders;
  final Map<String, List<String>> sections;
  final MarketPlaceCubit cubit;

  @override
  State<FilterSheet> createState() => _FilterSheetState();
}

class _FilterSheetState extends State<FilterSheet> {
  late Map<String, List<String>> selectedSections = {};
  late Map<String, double> selectedSliders = {};

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    widget.sections.forEach((key, value) {
      if (key == LocaleKeys.type.tr()) {
        selectedSections[key] = widget.cubit.params.type!;
      }
      if (key == LocaleKeys.class_.tr()) {
        selectedSections[key] = widget.cubit.params.classNft!;
      }
      if (key == LocaleKeys.quality.tr()) {
        selectedSections[key] = widget.cubit.params.quality!;
      }
    });
    widget.sliders.forEach((key, value) {
      if (key == LocaleKeys.level.tr()) {
        selectedSliders[key] = widget.cubit.params.level!.toDouble();
      }
      if (key == LocaleKeys.mint.tr()) {
        selectedSliders[key] = widget.cubit.params.bedMint!.toDouble();
      }
    });
  }

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
                suffix:
                    ' (${selectedSections.values.reduce((value, element) => value + element).length})',
                style: TextStyles.white18W700,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    selectedSections.clear();
                    selectedSliders.clear();
                    init();
                    widget.cubit.filter(selectedSections, selectedSliders);
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
                ...List<Widget>.generate(
                  widget.sections.length,
                  (i) => TypeSelectionWidget(
                    name: widget.sections.keys.elementAt(i),
                    types: widget.sections.values.elementAt(i),
                    listSelected:
                        selectedSections[widget.sections.keys.elementAt(i)] ??
                            [],
                    onSelect: (List<String> value) {
                      selectedSections[widget.sections.keys.elementAt(i)] =
                          value;
                      setState(() {});
                    },
                  ),
                ),
                ...List<Widget>.generate(
                  widget.sliders.length,
                  (i) => _Slider(
                    label: widget.sliders.keys.elementAt(i),
                    sliders: widget.sliders.values.elementAt(i),
                    value:
                        selectedSliders[widget.sliders.keys.elementAt(i)] ?? 0,
                    onSelect: (double v) {
                      selectedSliders[widget.sliders.keys.elementAt(i)] = v;
                      setState(() {});
                    },
                  ),
                ),
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
              log('=-=--=-=${selectedSections.toString()}');
              log('=-=--=-=${selectedSliders.toString()}');
              Navigator.pop(context);
              widget.cubit.filter(selectedSections, selectedSliders);
            },
          ),
        ),
      ],
    );
  }
}

class _Slider extends StatefulWidget {
  const _Slider({
    Key? key,
    required this.value,
    required this.onSelect,
    required this.label,
    required this.sliders,
  }) : super(key: key);

  final String label;
  final FilterSliderValues sliders;
  final double value;
  final ValueChanged<double> onSelect;

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  late FilterSliderValues slider = widget.sliders;
  late double _value = widget.value;


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 28),
        Padding(
          padding: const EdgeInsets.only(left: 28),
          child: SFText(keyText: widget.label, style: TextStyles.lightGrey14),
        ),
        SfSliderTheme(
          data: SfSliderThemeData(
              activeLabelStyle: TextStyles.lightGrey12,
              inactiveLabelStyle: TextStyles.lightGrey12),
          child: SfSlider(
            min: slider.min,
            max: slider.max,
            value: _value,
            interval: slider.interval,
            showTicks: true,
            showLabels: true,
            enableTooltip: true,
            showDividers: false,
            stepSize: 1,
            thumbIcon: Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                  color: AppColors.white, shape: BoxShape.circle),
              padding: const EdgeInsets.all(4),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                    color: AppColors.blue, shape: BoxShape.circle),
              ),
            ),
            // minorTicksPerInterval: 1,
            onChanged: (dynamic v) {
              if (widget.sliders.onChanged != null) {
                widget.sliders.onChanged!(v);
              }
              _value = v;
              widget.onSelect(_value);
              setState(() {});
            },
          ),
        )
      ],
    );
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
                      isSelected:
                          listSelected.contains(types[firstIdx].split(' ')[0]),
                      onTap: () {
                        _onTap(types[firstIdx].split(' ')[0]);
                      },
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                      child: (secondIdx < types.length)
                          ? _Container(
                              text: types[secondIdx],
                              isSelected: listSelected
                                  .contains(types[secondIdx].split(' ')[0]),
                              onTap: () {
                                _onTap(types[secondIdx].split(' ')[0]);
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

class FilterSliderValues extends Equatable {
  final double min;
  final double max;
  final double? value;
  final double interval;
  final ValueChanged<dynamic>? onChanged;

  const FilterSliderValues({
    required this.min,
    required this.max,
    this.interval = 1,
    this.value,
    this.onChanged,
  });

  @override
  List<Object?> get props => [min, max, value, onChanged, interval];
}
