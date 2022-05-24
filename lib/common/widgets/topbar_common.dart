import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon_border.dart';
import 'package:slee_fi/common/widgets/sf_statistic_resource.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TopBarCommon extends StatelessWidget {
  const TopBarCommon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SFIconBorder(
            icon: Icons.settings_outlined,
            radius: 100,
            sizeIcon: 22,
            size: Size(40, 40),
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
