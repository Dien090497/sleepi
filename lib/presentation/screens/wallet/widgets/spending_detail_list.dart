import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_history_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_pending_detail.dart';

class SpendingDetailList extends StatelessWidget {
  const SpendingDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding: const EdgeInsets.only(top: 20),
      child: DefaultTabController(
        length: 2,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SFSubTabBar(
              texts: const [Keys.pending, Keys.history],
            ),
            const Expanded(
              child: TabBarView(
                children: [TabPendingDetail(), TabHistoryDetail()],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
