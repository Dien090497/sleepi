import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class SFBottomNavigatorHome extends SFBottomNavigatorBar {
  SFBottomNavigatorHome(
    int index, {
    required Function(int)? onTap,
    Key? key,
  }) : super(
          index,
          onTap: onTap,
          items: [
            ItemBottomNav(icon: Ics.home, label: Keys.home),
            ItemBottomNav(icon: Ics.signOut, label: Keys.gacha),
            ItemBottomNav(icon: Ics.group, label: Keys.list),
            ItemBottomNav(icon: Ics.chart, label: Keys.chart),
            ItemBottomNav(icon: Ics.shopping, label: Keys.market),
          ],
          key: key,
        );
}
