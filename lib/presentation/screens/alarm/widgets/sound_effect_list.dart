import 'package:flutter/material.dart';

import '../../../../common/style/app_colors.dart';
import '../../../../common/style/text_styles.dart';
import '../../../../common/widgets/sf_text.dart';

class AlarmSoundEffectList extends StatefulWidget {
  const AlarmSoundEffectList({Key? key}) : super(key: key);

  @override
  State<AlarmSoundEffectList> createState() => _AlarmSoundEffectListState();
}

class _AlarmSoundEffectListState extends State<AlarmSoundEffectList> {

  // value set to false
  bool _value = false;

  @override
  Widget build(BuildContext context) {
    return  ListView.builder(
        itemCount: 5,
        shrinkWrap: true,
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context,int index){
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: CheckboxListTile(
              title: SFText(keyText: "soundsound", style: TextStyles.bold20black,),
              onChanged: (bool? value) {
                setState(() {
                  _value = value!;
                });
              },
              value: _value,
              selected: _value,
            ),
          );
        }
    );
  }
}
