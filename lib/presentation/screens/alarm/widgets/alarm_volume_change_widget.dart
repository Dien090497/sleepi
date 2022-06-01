import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_slider.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class AlarmVolumnChangeWidget extends StatefulWidget {
  const AlarmVolumnChangeWidget({Key? key}) : super(key: key);

  @override
  State<AlarmVolumnChangeWidget> createState() =>
      _AlarmVolumnChangeWidgetState();
}

class _AlarmVolumnChangeWidgetState extends State<AlarmVolumnChangeWidget> {
  double volume = 1;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.volume,
      trailing: SFSlider(
        value: volume,
        onChanged: (value) {
          setState(() {
            volume = value;
          });
        },
      ),
    );
  }
}
