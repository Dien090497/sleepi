import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_bottom_navigator_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class SFBottomNavigatorHome extends StatefulWidget {
  const SFBottomNavigatorHome(
      {Key? key, required this.onTap, required this.pageController})
      : super(key: key);

  final Function(int) onTap;
  final PageController pageController;

  @override
  State<SFBottomNavigatorHome> createState() => _SFBottomNavigatorHomeState();
}

class _SFBottomNavigatorHomeState extends State<SFBottomNavigatorHome> {
  late int selectedIndex = 0;

  @override
  void dispose() {
    widget.pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SFBottomNavigatorBar(
      selectedIndex,
      onTap: (int index) {
        widget.onTap(index);
        selectedIndex = index;
        setState(() {});
      },
      items: [
        ItemBottomNav(icon: Ics.icHomeNew, label: LocaleKeys.home),
        ItemBottomNav(icon: Ics.icGacha, label: LocaleKeys.gacha),
        ItemBottomNav(icon: Ics.icBedsNew, label: LocaleKeys.list),
        ItemBottomNav(icon: Ics.icChartNew, label: LocaleKeys.chart),
        ItemBottomNav(icon: Ics.icMarketNew, label: LocaleKeys.market),
      ],
    );
  }
}
