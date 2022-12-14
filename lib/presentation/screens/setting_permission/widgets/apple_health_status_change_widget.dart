import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class AppleHealthStatusChangeWidget extends StatefulWidget {
  const AppleHealthStatusChangeWidget({Key? key}) : super(key: key);

  @override
  State<AppleHealthStatusChangeWidget> createState() => _AppleHealthStatusChangeState();
}

class _AppleHealthStatusChangeState extends State<AppleHealthStatusChangeWidget> {
  bool isChecked = true;

  @override
  Widget build(BuildContext context) {
    return SFListTile(
      leading:const Padding(
        padding:  EdgeInsets.only(left: 8, right: 8),
        child: SFIcon(Imgs.health, width: 24, ),
      ),
      text: LocaleKeys.apple_health,
      trailing:  Padding(
        padding:const  EdgeInsets.only(right: 16),
        child:  SizedBox(
          width: 24,
          height: 24,
          child: CircleAvatar(
            radius: 100,
            backgroundColor:  isChecked ? AppColors.green : AppColors.white,
            child: Icon(Icons.check, color: isChecked ? AppColors.white : AppColors.black,),
          ),
        ),
      ),
      onPressed: (){
        setState((){
          isChecked = !isChecked;
        });
      },
    );
  }
}
