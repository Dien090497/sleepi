import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class SettingBirthYear extends StatefulWidget {
  const SettingBirthYear({Key? key}) : super(key: key);

  @override
  State<SettingBirthYear> createState() => _SettingBirthYearState();
}

class _SettingBirthYearState extends State<SettingBirthYear> {
  int? birthYear;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.birth_year.tr(),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SFText(
            keyText: "${birthYear ?? "----"}",
            style: TextStyles.lightWhite14,
          ),
          const Icon(
            Icons.chevron_right,
            color: AppColors.lightGrey,
          ),
        ],
      ),
      onPressed: () => SFModalBottomSheet.show(
        context,
        0.5,
        ModalPopUpBirthYear(
          selectedYear: birthYear,
          onBirthYearChanged: (value) {
            setState(() {
              birthYear = value;
            });
          },
        ),
      ),
    );
  }
}

class ModalPopUpBirthYear extends StatefulWidget {
  const ModalPopUpBirthYear(
      {required this.onBirthYearChanged, this.selectedYear, Key? key})
      : super(key: key);

  final int? selectedYear;
  final Function(int) onBirthYearChanged;

  @override
  State<ModalPopUpBirthYear> createState() => _ModalPopUpBirthYearState();
}

class _ModalPopUpBirthYearState extends State<ModalPopUpBirthYear> {
  late FixedExtentScrollController _controller ;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final currentYear = DateTime.now().year;
    List<int> years =
        List<int>.generate(currentYear - 1900 + 1, (i) => i + 1900);
    final initialIndex =
        widget.selectedYear != null ? years.indexOf(widget.selectedYear!) : years.length ~/ 2;
    int year = widget.selectedYear ?? years[initialIndex];
    _controller = FixedExtentScrollController(initialItem: initialIndex);

    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (value) {
                year = years[value];
              },
              itemExtent: 30,
              scrollController: _controller,
              diameterRatio: 1,
              // useMagnifier: true,
              // magnification: 1.3,
              children: List.generate(
                  years.length,
                  (i) => Center(
                        child: SFText(
                          keyText: years[i].toString(),
                          style: TextStyles.bold16LightWhite,
                        ),
                      )).toList(),
            ),
          ),
          SFButton(
              text: LocaleKeys.done,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () {
                widget.onBirthYearChanged(year);
                Navigator.pop(context);
              }),
          const SizedBox(
            height: 37,
          )
        ],
      ),
    );
  }
}