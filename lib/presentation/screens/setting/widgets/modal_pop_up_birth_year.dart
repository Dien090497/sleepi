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
      text: LocaleKeys.birth_year,
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
          context, 0.5,  ModalPopUpBirthYear(
        onBirthYearChanged: (value) {
          setState(() {
            birthYear = value;
          });
          },
      )),
    );
  }
}


class ModalPopUpBirthYear extends StatelessWidget {
  const ModalPopUpBirthYear({required this.onBirthYearChanged, Key? key}) : super(key: key);

  final Function(int) onBirthYearChanged;

  @override
  Widget build(BuildContext context) {
    List _range(int from, int to) =>
        List.generate(to - from + 1, (i) => i + from);
    List years = _range(1900, DateTime.now().year);
    int? middle ;
    int year =0;
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (value) {
                year = years[value];
                middle = value;
              },
              itemExtent: 30,
              scrollController: FixedExtentScrollController(initialItem: middle ?? years.length ~/ 2),
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
                Navigator.pop(context);
                onBirthYearChanged(year);
              }
          ),
          const SizedBox(height: 37,)
        ],
      ),
    );
  }
}
