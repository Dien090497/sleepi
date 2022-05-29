import 'package:flutter/cupertino.dart';

class SFSlider extends CupertinoSlider {
  const SFSlider({
    required double value,
    double min = 0,
    double max = 1,
    required ValueChanged<double>? onChanged,
    Key? key,
  }) : super(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          key: key,
        );
}
