import 'package:flutter/cupertino.dart';

class SFSlider extends CupertinoSlider {
  const SFSlider({
    required double value,
    required ValueChanged<double>? onChanged,
    Key? key,
  }) : super(
          value: value,
          onChanged: onChanged,
          key: key,
        );
}
