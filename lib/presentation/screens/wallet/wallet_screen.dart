import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_spending_detail.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_wallet_detail.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late final TabController controller = TabController(
    vsync: this,
    length: 2,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 50),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: SFBackButton(),
        ),
        actions: [
          GestureDetector(
            onTap: () async {
              await _onSettingTap(context);
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 16.0, left: 12),
              child: SFIcon(Ics.icSetting),
            ),
          ),
        ],
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.transparent,
        leadingWidth: 48,
        elevation: 0,
        centerTitle: true,
        titleSpacing: 14,
        title: WalletTabBar(controller: controller),
      ),
      child: TabBarView(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        children: const [
          TabSpendingDetail(),
          TabWalletDetail(),
        ],
      ),
    );
  }

  Future<void> _onSettingTap(BuildContext context) async {
    final state = BlocProvider.of<WalletCubit>(context).state;
    if (state is WalletNotExisted) {
      _showCreateOrImportWallet()
          .then((value) => _showWarningDialog(value, context));
      return;
    } else if (state is WalletNotOpen) {
      Navigator.pushNamed(context, R.passcode,
          arguments: PasscodeArguments(route: R.settingWallet));
    } else if (state is WalletStateLoaded) {
      Navigator.pushNamed(context, R.settingWallet);
    }
  }

  _showCreateOrImportWallet() async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  void _showWarningDialog(dynamic value, BuildContext context) {
    if (value is PopWithResults) {
      controller.animateTo(1);
      final cubit = context.read<WalletCubit>();
      cubit.importWallet(value.results);
    }
  }
}
