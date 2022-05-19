import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class AlarmVolumnChangeWidget extends StatefulWidget {
  const AlarmVolumnChangeWidget({Key? key}) : super(key: key);

  @override
  State<AlarmVolumnChangeWidget> createState() => _AlarmVolumnChangeWidgetState();
}

class _AlarmVolumnChangeWidgetState extends State<AlarmVolumnChangeWidget> {

  double volume = 1;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      title: SFText(keyText: Keys.volume,
        style: TextStyles.bold20black,
      ),
      trailing: SizedBox(
        width: 134,
        child: CupertinoSlider(
          value: volume,
          onChanged: (value) {
            setState(() {
              volume = value;
            });
          },
        ),
      ),
    );
  }
}
