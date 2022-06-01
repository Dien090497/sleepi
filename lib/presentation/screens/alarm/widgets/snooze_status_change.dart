import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class SnoozeStatusChangeWidget extends StatefulWidget {
  const SnoozeStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<SnoozeStatusChangeWidget> createState() =>
      _SnoozeStatusChangeWidgetState();
}

class _SnoozeStatusChangeWidgetState extends State<SnoozeStatusChangeWidget> {
  bool swSnooze = false;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.snooze,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 16),
        child: SFSwitch(
          value: swSnooze,
          onChanged: (value) {
            setState(() {
              swSnooze = value;
            });
          },
        ),
      ),
    );
  }
}
