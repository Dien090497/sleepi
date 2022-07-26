import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class CustomRadio extends StatefulWidget {
  final int value;
  final int groupValue;
  // final void Function(int) onChanged;

  const CustomRadio(
      {Key? key,
      required this.value,
      required this.groupValue,
      // required this.onChanged
      })
      : super(key: key);

  @override
  _CustomRadioState createState() => _CustomRadioState();
}

class _CustomRadioState extends State<CustomRadio> {
  @override
  Widget build(BuildContext context) {
    bool selected = (widget.value == widget.groupValue);

    return InkWell(
      // onTap: () => widget.onChanged(widget.value),
      child: Container(
        width: 16,
        height: 16,
        padding: const EdgeInsets.all(1),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.transparent,
            border: Border.all(
                width: 1,
                color: selected
                    ? AppColors.blue
                    : AppColors.white.withOpacity(0.1))),
        child: Icon(
          Icons.circle,
          size: 12,
          color: selected ? AppColors.blue : Colors.transparent,
        ),
      ),
    );
  }
}
