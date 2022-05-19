import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class AlarmStatusChangeWidget extends StatefulWidget {
  const AlarmStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<AlarmStatusChangeWidget> createState() => _AlarmStatusChangeState();
}

class _AlarmStatusChangeState extends State<AlarmStatusChangeWidget> {

  bool swAlarm = true;

  @override
  Widget build(BuildContext context) {
    return  ListTile(
      dense: true,
      title: SFText(keyText: Keys.alarm,
        style: TextStyles.bold20black,
      ),
      trailing:  CupertinoSwitch(
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
