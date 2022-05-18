import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_spending_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_wallet_detail.dart';
import '../../../di/translations/keys.dart';

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
            child: const Icon(CupertinoIcons.back, color: Colors.black),
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              primary: Colors.green, // <-- Button color
            ),
          ),
          actions: const [
            Icon(
              Icons.settings,
              color: Colors.black,
            ),
          ],
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 4, right: 4),
            child: TabBarIcon(
              texts: const [Keys.spending, Keys.wallet],
              icons: const [Icons.snowshoeing, Icons.wallet],
            ),
          ),
        ),
        body:  const TabBarView(
          children: [
            TabSpendingDetail(),
            TabWalletDetail(),
          ],
        ),
      ),
    );
  }
}
