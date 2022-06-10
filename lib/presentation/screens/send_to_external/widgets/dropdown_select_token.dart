import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class DropdownSelectToken extends StatefulWidget {
  const DropdownSelectToken(
      {this.value,
      this.width,
      this.height,
      this.resultPadding,
      this.margin,
      this.backgroundColor,
      this.isResultLabel = false,
      Key? key,
      this.dropdownItems})
      : super(key: key);

  final String? value;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? resultPadding;
  final Color? backgroundColor;
  final List<DropdownMenuItem>? dropdownItems;
  final bool isResultLabel;

  @override
  State<DropdownSelectToken> createState() => _DropdownSelectTokenState();
}

class _DropdownSelectTokenState extends State<DropdownSelectToken> {
  var selectedValue = '';

  List dropdownItemList = [];

  List<String> token = [
    "AVAX",
    "SLFT",
    "SLGT",
    "USDC"
  ];

  List<String> iconsToken = [
    Ics.icAvax,
    Ics.icSlft,
    Ics.icSlgt,
    Ics.icUsdc,
  ];

  @override
  void initState() {
    for (var i = 0; i < token.length; i++) {
      selectedValue = token[i];
      dropdownItemList.add(
        {
          'label': token[i],
          'value': token[i],
          'icon': SizedBox(
            key: UniqueKey(),
            child: Padding(
              padding: EdgeInsets.only(
                  left:
                      iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                          ? 0
                          : 4),
              child: SFIcon(
                iconsToken[i],
                height:
                    iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                        ? 28
                        : 20,
                width:
                    iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                        ? 28
                        : 20,
              ),
            ),
          ),
          'selectedIcon': SizedBox(
            key: UniqueKey(),
            child: Padding(
              padding: EdgeInsets.only(
                  left:
                  iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                      ? 0
                      : 4),
              child: SFIcon(
                iconsToken[i],
                width: iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                    ? 32
                    : 24,
                height: iconsToken[i] == Ics.icSlft || iconsToken[i] == Ics.icSlgt
                    ? 32
                    : 24,
                // color: Color(0xFF6FCC76),
              ),
            ),
          ),
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.fitWidth,
      child: CoolDropdown(
        resultWidth: widget.width ?? 70,
        resultHeight: widget.height ?? 32,
        defaultValue: dropdownItemList[0],
        dropdownList: dropdownItemList,
        isResultLabel: widget.isResultLabel,
        dropdownItemReverse: true,
        dropdownItemMainAxis: MainAxisAlignment.start,
        resultMainAxis: MainAxisAlignment.start,
        dropdownWidth: 110,
        dropdownHeight: 220,
        gap: 8,
        dropdownBD: BoxDecoration(
          color: AppColors.lightDark,
          borderRadius: BorderRadius.circular(4.0),
        ),
        resultBD: BoxDecoration(
          color: widget.backgroundColor ?? AppColors.white.withOpacity(0.1),
          borderRadius: BorderRadius.circular(4.0),
        ),
        selectedItemBD: const BoxDecoration(
          color: AppColors.transparent,
        ),
        resultTS: TextStyles.lightWhite16,
        resultPadding:
            widget.resultPadding ?? const EdgeInsets.only(left: 5, right: 10),
        selectedItemTS: TextStyles.w400White16,
        unselectedItemTS: TextStyles.w400lightGrey16,
        onChange: (selectedItem) {
          // print(selectedItem);
        },
        onOpen: (isOpen) {
          // print('$isOpen');
        },

        // resultIcon: const SizedBox(
        //   width: 16,
        //   // height: 10,
        //   child: Icon(
        //     Icons.keyboard_arrow_up,
        //     color: AppColors.lightGrey,
        //   ),
        // ),
      ),
    );
  }
}
