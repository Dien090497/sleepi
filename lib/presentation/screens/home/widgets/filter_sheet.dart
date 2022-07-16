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
  late SfRangeValues sfRangeValues = SfRangeValues(
    widget.homeBloc.filterItemParam.minLevel.toDouble(),
    widget.homeBloc.filterItemParam.maxLevel.toDouble(),
  );

  @override
  void initState() {
    selectedList.addAll(widget.homeBloc.filterItemParam.type);

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
                      sfRangeValues = const SfRangeValues(1.0, 5.0);
                    });
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
                  types: const [
                    LocaleKeys.blue,
                    LocaleKeys.purple,
                    LocaleKeys.red,
                    LocaleKeys.white,
                  ],
                  lengthSelect: 1,
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
                      keyText: LocaleKeys.level, style: TextStyles.lightGrey14),
                ),
                SfRangeSliderTheme(
                  data: SfRangeSliderThemeData(
                      activeLabelStyle: TextStyles.lightGrey12W500,
                      inactiveLabelStyle: TextStyles.lightGrey12W500,
                      inactiveTickColor: AppColors.lightGrey),
                  child: SfRangeSlider(
                      min: 1.0,
                      max: 5.0,
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
                        // widget.onSelect(value);
                      }),
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
              widget.homeBloc.add(FilterItemEvent(
                selectedList,
                sfRangeValues.start.toInt(),
                sfRangeValues.end.toInt(),
              ));
              Navigator.pop(context);
            },
          ),
        ),
      ],
    );
  }
}
