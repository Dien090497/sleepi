import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_bloc.dart';
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
  bool firstOpenWallet = true;
  final _pendingBloc = PendingBloc();
  final _historyBloc = PendingBloc();
  late final TabController controller = TabController(
    vsync: this,
    length: 2,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 800),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PendingBloc>(create: (context) => _pendingBloc),
        BlocProvider<PendingBloc>(create: (context) => _historyBloc),
      ],
      child: Stack(
        children: [
          BackgroundWidget(
            appBar: AppBar(
              toolbarHeight: 80,
              leading: const Padding(
                padding: EdgeInsets.only(left: 16),
                child: SFBackButton(),
              ),
              actions: [
                BlocBuilder<WalletCubit, WalletState>(
                  buildWhen: (previous, current) =>
                      current is WalletStateLoaded,
                  builder: (context, state) => GestureDetector(
                    onTap: () async {
                      if (state is WalletStateLoaded) {
                        if (state.walletInfoEntity == null) {
                          _showCreateOrImportWallet().then(
                              (value) => _showWarningDialog(value, context));
                          return;
                        }
                        Navigator.pushNamed(context, R.passcode,
                            arguments:
                                PasscodeArguments(route: R.settingWallet));
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 12),
                      child: SFIcon(Ics.icSetting),
                    ),
                  ),
                ),
              ],
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.transparent,
              leadingWidth: 48,
              elevation: 0,
              centerTitle: true,
              titleSpacing: 14,
              title: BlocBuilder<WalletCubit, WalletState>(
                buildWhen: (previous, current) => current is WalletStateLoaded,
                builder: (context, state) {
                  return WalletTabBar(
                    controller: controller,
                    checkMoveNewTab: (currentIndex, i) {
                      if (i == 1) {
                        if (state is WalletStateLoaded &&
                            state.walletInfoEntity == null) {
                          controller.index = 0;
                          _showCreateOrImportWallet().then((value) {
                            _showWarningDialog(value, context);
                            if (value == true) {
                              controller.animateTo(1);
                            }
                          });
                        } else if (firstOpenWallet) {
                          controller.animateTo(0);
                          Navigator.of(context)
                              .pushNamed(R.passcode)
                              .then((value) {
                            if (value == true) {
                              firstOpenWallet = false;
                              controller.animateTo(1);
                            } else {
                              controller.animateTo(0);
                            }
                          });
                        }
                        return false;
                      } else {
                        return true;
                      }
                    },
                  );
                },
              ),
            ),
            child: TabBarView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                TabSpendingDetail(
                  historyBloc: _historyBloc,
                  pendingBloc: _pendingBloc,
                ),
                const TabWalletDetail(),
              ],
            ),
          ),
        ],
      ),
    );
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
      context.read<WalletCubit>().init();
      controller.animateTo(1);
      final cubit = context.read<WalletCubit>();
      cubit.importWallet(value.results);
    }
  }
}
