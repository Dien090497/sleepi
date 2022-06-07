import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class MicrophoneStatusChangeWidget extends StatefulWidget {
  const MicrophoneStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<MicrophoneStatusChangeWidget> createState() => _MicrophoneStatusChangeState();
}

class _MicrophoneStatusChangeState extends State<MicrophoneStatusChangeWidget> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      leading:const Padding(
        padding:  EdgeInsets.only(right: 8),
        child: SFIcon(Ics.icMicrophone, width: 24,),
      ),
      text: LocaleKeys.microphone,
      trailing:  Padding(
        padding:const  EdgeInsets.only(right: 16),
        child: isChecked ? const Icon(Icons.check_circle_rounded, color: AppColors.green,) : const SizedBox(),
      ),
      onPressed: (){
        setState((){
          isChecked = !isChecked;
        });
      },
    );
  }
}
