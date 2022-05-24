import 'package:flutter/cupertino.dart';

class SFSwitch extends CupertinoSwitch {
  const SFSwitch({
    required bool value,
    required ValueChanged<bool>?  onChanged,
    Key? key,
  }) : super(
    value: value,
    onChanged: onChanged,
    key: key,
  );
}
