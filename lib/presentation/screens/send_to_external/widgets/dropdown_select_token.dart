import 'package:cool_dropdown/cool_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class DropdownSelectToken extends StatefulWidget {
  const DropdownSelectToken({
    this.value,
    this.width,
    this.height,
    this.padding,
    this.margin,
    this.backgroundColor,
    Key? key, this.dropdownItems}) : super(key: key);

  final String? value;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final Color? backgroundColor;
  final List<DropdownMenuItem>? dropdownItems;

  @override
  State<DropdownSelectToken> createState() => _DropdownSelectTokenState();
}

class _DropdownSelectTokenState extends State<DropdownSelectToken> {
  var  selectedValue = '';

  List dropdownItemList = [];

  List<String> token = [
    Keys.avax.toUpperCase(),
    Keys.slft.toUpperCase(),
    Keys.slgt.toUpperCase(),
    Keys.usdc.toUpperCase(),
  ];

  List<String> iconsToken = [
    Ics.icSolanaCircle,
    Ics.icGold,
    Ics.icSilver,
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
            height: 20,
            width: 20,
            child: SvgPicture.asset(iconsToken[i],),
          ),
          'selectedIcon': SizedBox(
            key: UniqueKey(),
            width: 24,
            height: 24,
            child: SvgPicture.asset(
               iconsToken[i],
              // color: Color(0xFF6FCC76),
            ),
          ),
        },
      );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  CoolDropdown(
      resultWidth: 70,
      resultHeight: 32,
      defaultValue: dropdownItemList[0],
      dropdownList: dropdownItemList,
      isResultLabel: false,
      dropdownItemReverse: true,
      dropdownItemMainAxis: MainAxisAlignment.start,
      resultMainAxis: MainAxisAlignment.start,
      dropdownWidth: 110,
      dropdownHeight: 250,
      gap: 8,
      dropdownBD: BoxDecoration(
        color: AppColors.lightDark,
        borderRadius: BorderRadius.circular(4.0),
      ),
      resultBD: BoxDecoration(
        color: AppColors.white.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4.0),
      ),
      selectedItemBD : const BoxDecoration(
        color: AppColors.transparent,
      ),
      selectedItemTS: TextStyles.w400White16,
      unselectedItemTS: TextStyles.w400lightGrey16,
      onChange: (selectedItem) {
        // print(selectedItem);
      },
      onOpen: (isOpen) {
        // print('$isOpen');
      },
      resultIcon: const SizedBox(
        width: 16,
        // height: 10,
        child: Icon(Icons.keyboard_arrow_up, color: AppColors.lightGrey,),
      ),
    );
  }
}
