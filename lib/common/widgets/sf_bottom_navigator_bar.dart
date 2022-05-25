import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';

class SFBottomNavigatorBar extends StatelessWidget {
  const SFBottomNavigatorBar(
    this.index, {
    Key? key,
    required this.onTap,
    required this.items,
  }) : super(key: key);
  final int index;
  final Function onTap;
  final List<ItemBottomNav> items;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> itemBottoms = <BottomNavigationBarItem>[];
    for (var element in items) {
      itemBottoms.add(BottomNavigationBarItem(
        icon: Container(
          margin: const EdgeInsets.only(top: 18, bottom: 0),
          width: 26,
          height: 26,
          child: SvgPicture.asset(
            element.icon,
            width: 24,
            height: 24,
            color: index == items.indexOf(element)
                ? Colors.blueAccent
                : AppColors.labelColor,
          ),
        ),
        label: element.label,
      ));
    }
    return BottomNavigationBar(
      elevation: 5,
      currentIndex: index,
      selectedItemColor: Colors.black87,
      selectedFontSize: 8,
      unselectedItemColor: Colors.grey,
      unselectedFontSize: 8,
      onTap: onTap(index),
      type: BottomNavigationBarType.fixed,
      items: itemBottoms,
    );
  }
}

class ItemBottomNav {
  String icon;
  String label;

  ItemBottomNav({required this.icon, required this.label});
}
