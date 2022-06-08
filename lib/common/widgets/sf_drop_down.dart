import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class SFDropDown<T> extends StatefulWidget {
  const SFDropDown(
      {Key? key,
        required this.value,
        required this.dropdownItems,
        this.icon,
        this.onChanged,
        this.dropdownHeight,
        this.dropdownWidth,
        this.selectedItemHighlightColor,
      })
      : super(key: key);

  final T value;
  final List<DropdownMenuItem<T>> dropdownItems;
  final ValueChanged<T?>? onChanged;
  final Widget? icon;
  final double? dropdownWidth;
  final double? dropdownHeight;
  final Color? selectedItemHighlightColor;

  @override
  State<SFDropDown<T>> createState() => _SFDropDownState<T>();
}

class _SFDropDownState<T> extends State<SFDropDown<T>> {
  late T selectedValue = widget.value;

  @override
  Widget build(BuildContext context) {
    return CustomDropdownButton2<T>(
      dropdownItems: widget.dropdownItems,
      value: selectedValue,
      icon: widget.icon,
      dropdownHeight: widget.dropdownHeight,
      dropdownWidth: widget.dropdownWidth,
      selectedItemHighlightColor: widget.selectedItemHighlightColor,
      onChanged: (value) {
        if (widget.onChanged != null) widget.onChanged!(value);
        if (value != null) {
          setState(() {
            selectedValue = value;
          });
        }
      },
    );
  }
}

class CustomDropdownButton2<T> extends StatelessWidget {
  final String? hint;
  final T value;
  final List<DropdownMenuItem<T>> dropdownItems;
  final ValueChanged<T?>? onChanged;
  final DropdownButtonBuilder? selectedItemBuilder;
  final Alignment? hintAlignment;
  final Alignment? valueAlignment;
  final double? buttonHeight, buttonWidth;
  final EdgeInsetsGeometry? buttonPadding;
  final BoxDecoration? buttonDecoration;
  final int? buttonElevation;
  final Widget? icon;
  final double? iconSize;
  final Color? iconEnabledColor;
  final Color? iconDisabledColor;
  final Color? borderColor;
  final Color? selectedItemHighlightColor;
  final double? itemHeight;
  final EdgeInsetsGeometry? itemPadding;
  final double? dropdownHeight, dropdownWidth;
  final EdgeInsetsGeometry? dropdownPadding;
  final BoxDecoration? dropdownDecoration;
  final int? dropdownElevation;
  final Radius? scrollbarRadius;
  final double? scrollbarThickness;
  final bool? scrollbarAlwaysShow;
  final Offset? offset;

  const CustomDropdownButton2({
    required this.value,
    required this.dropdownItems,
    required this.onChanged,
    this.hint,
    this.selectedItemBuilder,
    this.hintAlignment,
    this.valueAlignment,
    this.buttonHeight,
    this.buttonWidth,
    this.buttonPadding,
    this.buttonDecoration,
    this.buttonElevation,
    this.icon,
    this.iconSize,
    this.iconEnabledColor,
    this.iconDisabledColor,
    this.selectedItemHighlightColor,
    this.itemHeight,
    this.itemPadding,
    this.dropdownHeight,
    this.dropdownWidth,
    this.dropdownPadding,
    this.dropdownDecoration,
    this.dropdownElevation,
    this.scrollbarRadius,
    this.scrollbarThickness,
    this.scrollbarAlwaysShow,
    this.offset,
    Key? key,
    this.borderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<T>(
        //To avoid long text overflowing.
        isExpanded: true,
        hint: hint != null
            ? Container(
          alignment: hintAlignment,
          child: Text(
            hint!,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: 14,
              color: Theme.of(context).hintColor,
            ),
          ),
        )
            : null,
        value: value,
        items: dropdownItems,
        selectedItemHighlightColor: selectedItemHighlightColor ?? AppColors.darkColor1,
        // items: dropdownItems
        //     .map((item) => DropdownMenuItem<T>(
        //           value: item,
        //           child: Container(
        //             alignment: valueAlignment,
        //             child: Text(
        //               item,
        //               overflow: TextOverflow.ellipsis,
        //               maxLines: 1,
        //               style: const TextStyle(
        //                 fontSize: 14,
        //               ),
        //             ),
        //           ),
        //         ))
        //     .toList(),
        onChanged: onChanged,
        selectedItemBuilder: selectedItemBuilder,
        icon: icon ?? const Icon(Icons.keyboard_arrow_down_outlined),
        iconSize: iconSize ?? 24,
        iconEnabledColor: iconEnabledColor ?? AppColors.lightGrey,
        iconDisabledColor: iconDisabledColor,
        buttonHeight: buttonHeight ?? 40,
        buttonWidth: buttonWidth ?? 140,
        buttonPadding:
        buttonPadding ?? const EdgeInsets.only(left: 14, right: 14),
        buttonDecoration: buttonDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: borderColor ?? AppColors.darkColor1),
            ),
        buttonElevation: buttonElevation,
        itemHeight: itemHeight ?? 40,
        itemPadding: itemPadding ?? const EdgeInsets.only(left: 14, right: 14),
        //Max height for the dropdown menu & becoming scrollable if there are more items. If you pass Null it will take max height possible for the items.
        dropdownMaxHeight: dropdownHeight ?? 200,
        dropdownWidth: dropdownWidth ?? 140,
        dropdownPadding: dropdownPadding,
        style: TextStyles.lightWhite16,
        dropdownDecoration: dropdownDecoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.darkColor2,
            ),
        dropdownElevation: dropdownElevation ?? 8,
        scrollbarRadius: scrollbarRadius ?? const Radius.circular(40),
        scrollbarThickness: scrollbarThickness,
        scrollbarAlwaysShow: scrollbarAlwaysShow,
        //Null or Offset(0, 0) will open just under the button. You can edit as you want.
        offset: offset,
        dropdownOverButton: false, //Default is false to show menu below button
      ),
    );
  }
}
