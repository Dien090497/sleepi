import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class AlarmStatusChangeWidget extends StatefulWidget {
  const AlarmStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<AlarmStatusChangeWidget> createState() => _AlarmStatusChangeState();
}

class _AlarmStatusChangeState extends State<AlarmStatusChangeWidget> {
  bool swAlarm = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.alarm,
      trailing: SFSwitch(
        value: swAlarm,
        onChanged: (value) {
          setState(() {
            swAlarm = value;
          });
        },
      ),
    );
  }
}
