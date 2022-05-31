import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
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
            leading: const SFBackButton(),
            actions: [
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, R.passcode,
                    arguments: PasscodeArguments(R.settingWallet)),
                child: const SFIcon(Ics.icSetting),
              )
            ],
            automaticallyImplyLeading: false,
            backgroundColor: AppColors.transparent,
            leadingWidth: 32,
            elevation: 0,
            centerTitle: true,
            titleSpacing: 3,
            title: Center(
              child: TabBarIcon(
                context: context,
                texts: const [LocaleKeys.spending, LocaleKeys.wallet],
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
