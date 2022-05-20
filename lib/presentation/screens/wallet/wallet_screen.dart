import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_spending_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_wallet_detail.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 50,
          leading: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: AppColors.green,
            ),
            child: const Icon(CupertinoIcons.back, color: AppColors.black),
          ),
          actions: const [
            Icon(
              Icons.settings,
              color: AppColors.black,
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: TabBarIcon(
              texts: const [Keys.spending, Keys.wallet],
              icons: const [Icons.snowshoeing, Icons.wallet],
            ),
          ),
        ),
        body: const TabBarView(
          children: [
            TabSpendingDetail(),
            TabWalletDetail(),
          ],
        ),
      ),
    );
  }
}
