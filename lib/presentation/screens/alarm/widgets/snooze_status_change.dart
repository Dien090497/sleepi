import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/di/translations/keys.dart';

class SnoozeStatusChangeWidget extends StatefulWidget {
  const SnoozeStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<SnoozeStatusChangeWidget> createState() => _SnoozeStatusChangeWidgetState();
}

class _SnoozeStatusChangeWidgetState extends State<SnoozeStatusChangeWidget> {
  bool swSnooze = false;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: Keys.snooze,
      trailing: SFSwitch(
        value: swSnooze,
        onChanged: (value) {
          setState(() {
            swSnooze = value;
          });
        },
      ),
    );
  }
}
