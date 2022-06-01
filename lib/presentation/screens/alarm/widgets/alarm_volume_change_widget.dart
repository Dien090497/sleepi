import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AlarmVolumeChangeWidget extends StatefulWidget {
  const AlarmVolumeChangeWidget({Key? key}) : super(key: key);

  @override
  State<AlarmVolumeChangeWidget> createState() =>
      _AlarmVolumeChangeWidgetState();
}

class _AlarmVolumeChangeWidgetState extends State<AlarmVolumeChangeWidget> {
  double volume = 70;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      text: LocaleKeys.volume,
      trailing: SizedBox(
        width: 200,
        child: SfSlider(
          min: 0,
          max: 100,
          value: volume,
          stepSize: 1,
          enableTooltip: true,
          showDividers: false,
          thumbIcon: Container(
            width: 16,
            height: 16,
            decoration: const BoxDecoration(
              color: AppColors.white,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(4),
            child: Container(
              decoration: const BoxDecoration(
                color: AppColors.blue,
                shape: BoxShape.circle,
              ),
            ),
          ),
          minorTicksPerInterval: 1,
          onChanged: (dynamic value) {
            setState(() {
              volume = value;
            });
          },
        ),
      ),
    );
  }
}
