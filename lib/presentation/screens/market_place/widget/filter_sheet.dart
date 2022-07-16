import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
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
  late Map<String, SfRangeValues> selectedSliders = {};
  final Map<String, GlobalKey<_SliderState>> _key = {};

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
        selectedSliders[key] = SfRangeValues(
            widget.cubit.params.minLevel, widget.cubit.params.maxLevel);
      }
      if (key == LocaleKeys.mint.tr()) {
        selectedSliders[key] = SfRangeValues(
            widget.cubit.params.minBedMint, widget.cubit.params.maxBedMint);
      }
      _key[key] = GlobalKey();
    });
  }

  clear() {
    widget.sections.forEach((key, value) {
      selectedSections[key] = [];
    });
    widget.sliders.forEach((key, value) {
      selectedSliders[key] = SfRangeValues(value.min, value.max);
    });
    _key.forEach((key, value) {
      _key[key]?.currentState?.sfRangeValues = selectedSliders[key]!;
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
                    setState(() {
                      selectedSections.clear();
                      selectedSliders.clear();
                      clear();
                    });
                    widget.cubit.filter(selectedSections, selectedSliders);
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
                    key: _key[widget.sliders.keys.elementAt(i)],
                    label: widget.sliders.keys.elementAt(i),
                    sliders: widget.sliders.values.elementAt(i),
                    // value:
                    //     selectedSliders[widget.sliders.keys.elementAt(i)] ?? 0,
                    onSelect: (SfRangeValues v) {
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
    // required this.value,
    required this.onSelect,
    required this.label,
    required this.sliders,
  }) : super(key: key);

  final String label;
  final FilterSliderValues sliders;

  // final double value;
  final ValueChanged<SfRangeValues> onSelect;

  @override
  State<_Slider> createState() => _SliderState();
}

class _SliderState extends State<_Slider> {
  late FilterSliderValues slider = widget.sliders;

  // late double _value = widget.value;
  late SfRangeValues sfRangeValues = widget.sliders.value;

  @override
  void initState() {
    if (widget.sliders.onChanged != null) {
      // widget.sliders.onChanged!(_value);
    }
    super.initState();
  }

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
          data: SfRangeSliderThemeData(),
          child: SfRangeSlider(
              min: widget.sliders.min,
              max: widget.sliders.max,
              showTicks: true,
              showLabels: true,
              stepSize: 1,
              minorTicksPerInterval: 1,
              endThumbIcon: const ThumbIcon(),
              startThumbIcon: const ThumbIcon(),
              enableTooltip: true,
              values: sfRangeValues,
              onChanged: (SfRangeValues value) {
                setState(() => sfRangeValues = value);
                widget.onSelect(value);
              }),
        )
      ],
    );
  }
}

class ThumbIcon extends StatelessWidget {
  const ThumbIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 16,
      height: 16,
      decoration:
          const BoxDecoration(color: AppColors.white, shape: BoxShape.circle),
      padding: const EdgeInsets.all(4),
      child: const DecoratedBox(
        decoration:
            BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
      ),
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
                      qualitySelect: name == LocaleKeys.quality.tr(),
                      text: types[firstIdx],
                      isSelected:
                          listSelected.contains(types[firstIdx].toLowerCase()),
                      onTap: () {
                        _onTap(types[firstIdx].toLowerCase());
                      },
                    )),
                    const SizedBox(width: 16),
                    Expanded(
                      child: (secondIdx < types.length)
                          ? _Container(
                              qualitySelect: name == LocaleKeys.quality.tr(),
                              text: types[secondIdx],
                              isSelected: listSelected
                                  .contains(types[secondIdx].toLowerCase()),
                              onTap: () {
                                _onTap(types[secondIdx].toLowerCase());
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
      required this.onTap,
      required this.qualitySelect})
      : super(key: key);

  final String text;
  final bool isSelected;
  final VoidCallback onTap;
  final bool qualitySelect;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40),
          border: Border.all(
              color: qualitySelect && !isSelected
                  ? text.toLowerCase().qualityBedColor
                  : AppColors.transparent),
          gradient: isSelected ? AppColors.gradientBlue : null,
          color: isSelected
              ? null
              : qualitySelect
                  ? AppColors.transparent
                  : AppColors.whiteOpacity5,
        ),
        alignment: Alignment.center,
        child: SFText(
          keyText: text,
          style: isSelected
              ? TextStyles.w700WhiteSize16
              : TextStyles.lightGrey16.copyWith(
                  color: qualitySelect
                      ? text.toLowerCase().qualityBedColor
                      : null),
        ),
      ),
    );
  }
}

class FilterSliderValues extends Equatable {
  final double min;
  final double max;
  final SfRangeValues value;
  final ValueChanged<dynamic>? onChanged;

  const FilterSliderValues({
    required this.min,
    required this.max,
    required this.value,
    this.onChanged,
  });

  @override
  List<Object?> get props => [min, max, value, onChanged];
}
