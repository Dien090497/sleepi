import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';

class SpendingDetailList extends StatelessWidget {
  const SpendingDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding : const EdgeInsets.only(top: 20),
      child:   DefaultTabController(
        length: 2,
        child: Column(
          children: [
            SFSubTabBar(
              texts: const ["Pending", "History"],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: TabBarView(
                children: [
                Container(),
                  Container()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
