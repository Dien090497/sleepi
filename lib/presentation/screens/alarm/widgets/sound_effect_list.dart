import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';

class AlarmSoundEffectList extends StatefulWidget {
  const AlarmSoundEffectList({Key? key}) : super(key: key);

  @override
  State<AlarmSoundEffectList> createState() => _AlarmSoundEffectListState();
}

class _AlarmSoundEffectListState extends State<AlarmSoundEffectList> {
  final audioPlayer = AudioPlayer();
  late final SharedPreferences preferences;

  int temp = 0;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    audioPlayer
      ..stop()
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SFCard(
      margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.separated(
          itemCount: 5,
          shrinkWrap: true,
          separatorBuilder: (context, index) => Divider(
                color: AppColors.lightWhite.withOpacity(0.05),
                height: 1,
              ),
          itemBuilder: (BuildContext context, int index) {
            return SFListTile(
              text: "Sound ${index + 1}",
              trailing: index == temp
                  ? const Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 20,
                    )
                  : const SizedBox(height: 20),
              onPressed: () {
                preferences.setInt(Const.sound, index);
                setState(() {
                  temp = index;
                });
                _playSound();
              },
            );
          }),
    );
  }

  void init() async {
    preferences = await SharedPreferences.getInstance();
    temp = preferences.getInt(Const.sound) ?? 0;
  }

  void _playSound() async {
    await audioPlayer.stop();
    await audioPlayer.release();
    audioPlayer.play(AssetSource(Const.soundAlarm[temp]));
  }
}
