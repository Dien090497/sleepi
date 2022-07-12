import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class FilterItem extends StatefulWidget {
  const FilterItem({Key? key, required this.homeBloc}) : super(key: key);

  final HomeBloc homeBloc;

  @override
  State<FilterItem> createState() => _FilterItemState();
}

class _FilterItemState extends State<FilterItem> {
  List<String> selectedList = [];
  int sliderValue = 0;

  @override
  void initState() {
    //init value
    selectedList.addAll(widget.homeBloc.filterItemParam.type);
    sliderValue = widget.homeBloc.filterItemParam.level;
    super.initState();
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
                suffix: ' (${selectedList.length})',
                style: TextStyles.white18W700,
              ),
              const Spacer(),
              TextButton(
                  onPressed: () {
                    setState(() {
                      selectedList.clear();
                      sliderValue = 0;
                    });
                    // widget.cubit.filter(selectedSections, selectedSliders);
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
                  name: LocaleKeys.type.tr(),
                  types: [
                    LocaleKeys.blue.tr(),
                    LocaleKeys.green.tr(),
                    LocaleKeys.pink.tr(),
                    LocaleKeys.purple.tr(),
                  ],
                  listSelected: selectedList,
                  onSelect: (List<String> value) {
                    selectedList = value;
                    setState(() {});
                  },
                ),
                const SizedBox(height: 28),
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: SFText(
                      keyText: LocaleKeys.type, style: TextStyles.lightGrey14),
                ),
                SfSliderTheme(
                  data: SfSliderThemeData(
                      activeLabelStyle: TextStyles.lightGrey12,
                      inactiveLabelStyle: TextStyles.lightGrey12),
                  child: SfSlider(
                    min: 0,
                    max: 30,
                    value: sliderValue,
                    interval: 5,
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
                      sliderValue = v.toInt();
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
              widget.homeBloc.add(FilterItemEvent(selectedList, sliderValue));
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
