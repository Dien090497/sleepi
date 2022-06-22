import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class HomeSwitch extends StatefulWidget {
  const HomeSwitch({Key? key, required this.onChanged}) : super(key: key);

  final ValueChanged<bool> onChanged;

  @override
  State<HomeSwitch> createState() => _HomeSwitchState();
}

class _HomeSwitchState extends State<HomeSwitch> {
  bool isOn = true;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
      activeColor: AppColors.green,
      value: isOn,
      onChanged: (value) {
        setState(() {
          isOn = value;
        });
        widget.onChanged(value);
      },
    );
  }
}
