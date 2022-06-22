import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_spending_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_wallet_detail.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_wallet_warning.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  late int indexTap = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BackgroundWidget(
        appBar: AppBar(
          toolbarHeight: 80,
          leading: const Padding(
            padding: EdgeInsets.only(left: 16),
            child: SFBackButton(),
          ),
          actions: [
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, R.passcode,
                  arguments: PasscodeArguments(R.settingWallet)),
              child: const Padding(
                padding: EdgeInsets.only(right: 16.0, left: 12),
                child: SFIcon(Ics.icSetting),
              ),
            )
          ],
          automaticallyImplyLeading: false,
          backgroundColor: AppColors.transparent,
          leadingWidth: 48,
          elevation: 0,
          centerTitle: true,
          titleSpacing: 14,
          title: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: AppColors.purple.withOpacity(0.07)),
            child: TabBarIcon(
              context: context,
              texts: const [LocaleKeys.spending, LocaleKeys.wallet],
              images: const [Ics.icTwoEyes, Ics.icWallet],
              onTap: (i) {
                setState(() {
                  indexTap = i;
                });

                if (i == 1) {
                  showCustomAlertDialog(
                    context,
                    barrierDismissible: false,
                    children: const PopUpAvalancheWallet(),
                  ).then((value) {
                    _showWarningDialog(value, context);
                  });
                }
              },
              index: indexTap,
            ),
          ),
        ),
        child: const TabBarView(
          children: [
            TabSpendingDetail(),
            TabWalletDetail(),
          ],
        ),
      ),
    );
  }

  _showWarningDialog(dynamic value, BuildContext context) {
    if (value != null && value == true) {
      showCustomAlertDialog(context, children: const PopUpWalletWarning());
    }
  }
}
