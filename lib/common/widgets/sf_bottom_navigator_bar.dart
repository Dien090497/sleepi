import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class SFBottomNavigatorBar extends StatelessWidget {
  const SFBottomNavigatorBar(
    this.index, {
    Key? key,
    required this.onTap,
    required this.items,
  }) : super(key: key);

  final int index;
  final Function(int)? onTap;
  final List<ItemBottomNav> items;

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> itemBottoms = <BottomNavigationBarItem>[];
    for (var element in items) {
      itemBottoms.add(BottomNavigationBarItem(
          icon: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: AppColors.lightDark,
                  width: 1.0,
                ),
              ),
            ),
            padding: const EdgeInsets.only(top: 22, bottom: 12),
            width: MediaQuery.of(context).size.width / 5,
            child: Column(
              children: [
                SFIcon(
                  element.icon,
                  width: 24,
                  height: 24,
                  color: index == items.indexOf(element)
                      ? Colors.blueAccent
                      : AppColors.lightGrey,
                ),
                const SizedBox(height: 4),
                SFText(
                  keyText: element.label,
                  style: TextStyle(
                    color: index == items.indexOf(element)
                        ? Colors.blueAccent
                        : AppColors.lightGrey,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    height: 18 / 12,
                  ),
                )
              ],
            ),
          ),
          label: ''));
    }
    return BottomNavigationBar(
      elevation: 5,
      currentIndex: index,
      selectedItemColor: Colors.blue,
      selectedFontSize: 0,
      backgroundColor: AppColors.dark,
      unselectedItemColor: AppColors.lightGrey,
      unselectedFontSize: 0,
      onTap: onTap,
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
