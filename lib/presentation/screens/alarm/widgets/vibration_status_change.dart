import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_switch.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class VibrationStatusChangeWidget extends StatefulWidget {
  const VibrationStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<VibrationStatusChangeWidget> createState() =>
      _VibrationStatusChangeWidgetState();
}

class _VibrationStatusChangeWidgetState
    extends State<VibrationStatusChangeWidget> {
  bool swVibration = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.vibration,
      trailing: SFSwitch(
        value: swVibration,
        onChanged: (value) {
          setState(() {
            swVibration = value;
          });
        },
      ),
    );
  }
}
