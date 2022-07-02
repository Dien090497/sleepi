import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/tab_bar_icon.dart';
import 'package:slee_fi/resources/resources.dart';

class WalletTabBar extends StatefulWidget {
  const WalletTabBar(
      {Key? key, required this.controller, required this.checkMoveNewTab})
      : super(key: key);
  final TabController controller;
  final bool Function(int currentIndex, int newIndex) checkMoveNewTab;

  @override
  State<WalletTabBar> createState() => _WalletTabBarState();
}

class _WalletTabBarState extends State<WalletTabBar> {
  int indexTap = 0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_onTabChange);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_onTabChange);
    super.dispose();
  }

  _onTabChange() {
    setState(() {
      indexTap = widget.controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    'build tabbar'.log;
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: AppColors.purple.withOpacity(0.07)),
      child: TabBarIcon(
        tabController: widget.controller,
        context: context,
        texts: const [LocaleKeys.spending, LocaleKeys.wallet],
        images: const [Ics.icTwoEyes, Ics.icWallet],
        onTap: (i) async {
          if (widget.checkMoveNewTab(indexTap, i)) {}
          // if (i == 1 ||
          //     (state is WalletStateLoaded &&
          //         (state.walletInfoEntity == null ||
          //             state.firstOpenWallet))) {
          //   widget.controller.animateTo(0);
          // }
          //
          // if (state is WalletStateLoaded &&
          //     state.walletInfoEntity == null &&
          //     i == 1) {
          //   _showCreateOrImportWallet()
          //       .then((value) => _showWarningDialog(value, context));
          //   return;
          // }
          //
          // if (state is WalletStateLoaded &&
          //     state.firstOpenWallet &&
          //     i == 1) {
          //   Navigator.of(context).pushNamed(R.passcode).then((value) {
          //     if (value == true) {
          //       widget.controller.animateTo(1);
          //     }
          //   });
          //   return;
          // }
        },
        index: indexTap,
      ),
    );
  }
}