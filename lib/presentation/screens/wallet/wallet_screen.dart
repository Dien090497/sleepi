import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_spending_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_wallet_detail.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletScreen extends StatelessWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: AppBar(
            actions: [
              GestureDetector(
                onTap: () {},
                child: SFIcon(Ics.icSetting),
              )
            ],
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.transparent,
            elevation: 0,
            centerTitle: true,
            title: Center(
              child: TabBarIcon(
                texts: const [Keys.spending, Keys.wallet],
                images: const [Ics.icTwoEyes, Ics.icWallet],
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
      ),
    );
  }
}
