import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';

class AlarmSoundEffectList extends StatefulWidget {
  const AlarmSoundEffectList({Key? key}) : super(key: key);

  @override
  State<AlarmSoundEffectList> createState() => _AlarmSoundEffectListState();
}

class _AlarmSoundEffectListState extends State<AlarmSoundEffectList> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.0),
        color: AppColors.white.withOpacity(0.05),
        boxShadow: [
          BoxShadow(
            color: AppColors.white.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(2, 4), // Shadow position
          ),
        ],
      ),
      child: ListView.builder(
          itemCount: 5,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                SFListTile(
                  text: "Sound $index",
                  trailing: index == 0
                      ? const Icon(
                          Icons.check,
                          color: AppColors.green,
                        )
                      : const SizedBox(),
                  // onPressed: () => Navigator.pushNamed(context, R.alarmSoundEffect),
                ),
                Divider(
                  color: AppColors.lightWhite.withOpacity(0.05),
                  height: 1,
                ),
              ],
            );
          }),
    );
  }
}
