import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/cool_dropdown/cool_dropdown.dart';
import 'package:slee_fi/resources/resources.dart';

class DropdownSelectToken extends StatefulWidget {
  const DropdownSelectToken({
    this.indexInit = 0,
    this.width,
    this.height,
    this.resultPadding,
    this.margin,
    this.backgroundColor,
    this.isResultLabel = false,
    Key? key,
    this.onChange,
    required this.tokens,
    this.globalKey,
  }) : super(key: key);

  final int indexInit;
  final double? width;
  final double? height;
  final EdgeInsets? margin;
  final EdgeInsets? resultPadding;
  final Color? backgroundColor;
  final bool isResultLabel;
  final Function(dynamic)? onChange;
  final List<dynamic> tokens;
  final GlobalKey<CoolDropdownState>? globalKey;

  @override
  State<DropdownSelectToken> createState() => _DropdownSelectTokenState();
}

class _DropdownSelectTokenState extends State<DropdownSelectToken> {
  var selectedValue = '';

  List dropdownItemList = [];

  @override
  void initState() {
    for (var i = 0; i < widget.tokens.length; i++) {
      selectedValue = widget.tokens[i]["symbol"].toString();
      dropdownItemList.add(
        {
          'label': widget.tokens[i]["symbol"],
          'value': widget.tokens[i]["address"],
          'icon': SizedBox(
            key: UniqueKey(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: widget.tokens[i]["icon"] == Ics.icSlft ||
                          widget.tokens[i]["icon"] == Ics.icSlgt
                      ? 0
                      : 4),
              child: SFIcon(
                widget.tokens[i]["icon"].toString(),
                height: widget.tokens[i]["icon"] == Ics.icSlft ||
                        widget.tokens[i]["icon"] == Ics.icSlgt
                    ? 28
                    : 20,
                width: widget.tokens[i]["icon"] == Ics.icSlft ||
                        widget.tokens[i]["icon"] == Ics.icSlgt
                    ? 28
                    : 20,
              ),
            ),
          ),
          'selectedIcon': SizedBox(
            key: UniqueKey(),
            child: Padding(
              padding: EdgeInsets.only(
                  left: widget.tokens[i]["icon"] == Ics.icSlft ||
                          widget.tokens[i]["icon"] == Ics.icSlgt
                      ? 0
                      : 4),
              child: SFIcon(
                widget.tokens[i]["icon"].toString(),
                width: widget.tokens[i]["icon"] == Ics.icSlft ||
                        widget.tokens[i]["icon"] == Ics.icSlgt
                    ? 32
                    : 24,
                height: widget.tokens[i]["icon"] == Ics.icSlft ||
                        widget.tokens[i]["icon"] == Ics.icSlgt
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
        key: widget.globalKey,
        resultWidth: widget.width ?? 70,
        resultHeight: widget.height ?? 32,
        defaultValue: dropdownItemList[widget.indexInit],
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
        onChange: widget.onChange!,
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
