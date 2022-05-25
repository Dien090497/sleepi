import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_statistic_resource.dart';

class TopBarCommon extends StatelessWidget {
  const TopBarCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SFIconBorder(
            icon: Icons.settings_outlined,
            onTap: (){
              Navigator.pushNamed(context, R.setting);
            },
            radius: 100,
            sizeIcon: 22,
            size: const Size(40, 40),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, R.passcode);
            },
            child: const SFStatisticResource(
              valueSliver: 46.87,
              valueSolana: 0,
              valueGold: 54.47,
            ),
          )
        ],
      ),
    );
  }
}
