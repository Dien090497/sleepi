import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class HomeSwitch extends StatelessWidget {
  const HomeSwitch({Key? key, required this.onChanged, required this.isOn})
      : super(key: key);
  final bool isOn;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: AppColors.green,
      value: isOn,
      onChanged: (value) {
        onChanged(value);
      },
    );
  }
}
