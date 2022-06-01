import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
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
            ItemBottomNav(icon: Ics.home, label: LocaleKeys.home),
            ItemBottomNav(icon: Ics.signOut, label: LocaleKeys.gacha),
            ItemBottomNav(icon: Ics.group, label: LocaleKeys.list),
            ItemBottomNav(icon: Ics.chart, label: LocaleKeys.chart),
            ItemBottomNav(icon: Ics.shopping, label: LocaleKeys.market),
          ],
          key: key,
        );
}
