import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_avalanche_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletTabBar extends StatefulWidget {
  const WalletTabBar({Key? key, required this.controller}) : super(key: key);

  final TabController controller;

  @override
  State<WalletTabBar> createState() => _WalletTabBarState();
}

class _WalletTabBarState extends State<WalletTabBar>
    with SingleTickerProviderStateMixin {
  int indexTap = 0;
  late final TabController controller = widget.controller;

  @override
  void initState() {
    super.initState();
    controller.addListener(_tabListener);
  }

  @override
  void dispose() {
    controller.removeListener(_tabListener);
    super.dispose();
  }

  void _tabListener() {
    indexTap = controller.index;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.purple.withOpacity(0.07)),
      child: TabBarIcon(
        tabController: controller,
        context: context,
        texts: const [LocaleKeys.spending, LocaleKeys.wallet],
        images: const [Ics.icTwoEyes, Ics.icWallet],
        onTap: (i) async {
          if (i == 1) {
            final state = context.read<WalletCubit>().state;
            if (state is WalletNotExisted) {
              controller.index = 0;
              setState(() {});
              _showCreateOrImportWallet().then((value) {
                if (value == true) {
                  controller.animateTo(1);
                }
              });
            } else if (state is WalletNotOpen) {
              controller.index = 0;
              setState(() {});
              Navigator.of(context).pushNamed(R.passcode).then((value) {
                if (value == true) {
                  controller.animateTo(1);
                }
              });
            }
          }
        },
        index: indexTap,
      ),
    );
  }

  Future<bool?> _showCreateOrImportWallet() async {
    return showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }
}
