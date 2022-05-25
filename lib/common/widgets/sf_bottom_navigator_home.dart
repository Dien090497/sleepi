import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class SFBottomNavigatorHome extends SFBottomNavigatorBar {
  SFBottomNavigatorHome(
    int index, {
    Key? key,
  }) : super(
          index,
          onTap: (index) {},
          items: [ItemBottomNav(icon: Ics.home, label: Keys.home)],
          key: key,
        );
}

