import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class ModalPopUpSex extends StatefulWidget {
  const ModalPopUpSex(
      {Key? key, required this.onSelect, required this.selectedGender})
      : super(key: key);

  final ValueChanged<String> onSelect;
  final String selectedGender;

  @override
  State<ModalPopUpSex> createState() => _ModalPopUpSexState();
}

class _ModalPopUpSexState extends State<ModalPopUpSex> {
  late FixedExtentScrollController _controller ;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<String> genders = [
      LocaleKeys.female_.tr(),
      LocaleKeys.male_.tr(),
      LocaleKeys.other_.tr(),
      LocaleKeys.secret.tr(),
    ];
    int selectedIndex = genders.indexOf(widget.selectedGender.tr());
    _controller = FixedExtentScrollController(initialItem: selectedIndex);
    return SafeArea(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: CupertinoPicker(
              onSelectedItemChanged: (index) {
                selectedIndex = index;
              },
              itemExtent: 30,
              scrollController: _controller,
              diameterRatio: 1,
              children: List.generate(genders.length, (i) {
                return Center(
                  child: SFText(
                      keyText: genders[i], style: TextStyles.bold16LightWhite),
                );
              }),
            ),
          ),
          SFButton(
              text: LocaleKeys.done,
              width: MediaQuery.of(context).size.width * 0.9,
              color: AppColors.blue,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              onPressed: () {
                widget.onSelect(genders[selectedIndex]);
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
