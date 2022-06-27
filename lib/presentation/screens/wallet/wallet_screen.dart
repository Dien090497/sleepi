import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/entities/wallet_info/wallet_info_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/setting_wallet/setting_wallet_screen.dart';
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

class _WalletScreenState extends State<WalletScreen>
    with SingleTickerProviderStateMixin {
  late int indexTap = 0;

  late final TabController controller = TabController(
    vsync: this,
    length: 2,
    initialIndex: 0,
    animationDuration: const Duration(milliseconds: 200),
  );

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WalletCubit>(
      create: (context) => WalletCubit()..init(),
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
                BlocConsumer<WalletCubit, WalletState>(
                  listenWhen: (previous, current) {
                    return previous is WalletStateLoading &&
                        current is WalletStateLoaded;
                  },
                  listener: (context, state) {
                    if (state is WalletStateLoaded &&
                        state.mnemonic.isNotEmpty) {
                      Navigator.pushNamed(context, R.passcode).then((value) {
                        if (value == true) {
                          Future.delayed(
                            const Duration(milliseconds: 200),
                            () => Navigator.pushNamed(context, R.settingWallet,
                                arguments:
                                    SettingWalletArgument(state.mnemonic)),
                          );
                        }
                      });
                    }
                  },
                  builder: (context, state) => GestureDetector(
                    onTap: () async {
                      if (state is WalletStateLoaded) {
                        if (state.walletInfoEntity == null) {
                          _showCreateOrImportWallet();
                          return;
                        }
                        var cubit = context.read<WalletCubit>();
                        cubit.getMnemonic();
                      }
                    },
                    child: const Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 12),
                      child: SFIcon(Ics.icSetting),
                    ),
                  ),
                )
              ],
              automaticallyImplyLeading: false,
              backgroundColor: AppColors.transparent,
              leadingWidth: 48,
              elevation: 0,
              centerTitle: true,
              titleSpacing: 14,
              title: BlocBuilder<WalletCubit, WalletState>(
                builder: (context, state) {
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
                        if (indexTap == i) {
                          return;
                        }
                        if (i == 1 ||
                            (state is WalletStateLoaded &&
                                (state.walletInfoEntity == null ||
                                    state.firstOpenWallet))) {
                          controller.animateTo(0);
                        }

                        if (state is WalletStateLoaded &&
                            state.walletInfoEntity == null &&
                            i == 1) {
                          _showCreateOrImportWallet().then(
                              (value) => _showWarningDialog(value, context));
                          return;
                        }

                        if (state is WalletStateLoaded &&
                            state.firstOpenWallet &&
                            i == 1) {
                          Navigator.of(context)
                              .pushNamed(R.passcode)
                              .then((value) {
                            if (value == true) {
                              setState(() => indexTap = 1);
                              controller.animateTo(1);
                            }
                          });
                          return;
                        }

                        setState(() => indexTap = i);
                      },
                      index: indexTap,
                    ),
                  );
                },
              ),
            ),
            child: TabBarView(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                const TabSpendingDetail(),
                BlocBuilder<WalletCubit, WalletState>(
                  builder: (context, state) => TabWalletDetail(
                    balance: state is WalletStateLoaded &&
                            state.walletInfoEntity != null
                        ? state.walletInfoEntity!.nativeCurrency.balance
                        : 0,
                    addressWallet: state is WalletStateLoaded &&
                            state.walletInfoEntity != null
                        ? state.walletInfoEntity!.address
                        : '',
                    currencySymbol: state is WalletStateLoaded &&
                            state.walletInfoEntity != null
                        ? state.walletInfoEntity!.nativeCurrency.symbol
                        : '',
                    networkName: state is WalletStateLoaded &&
                            state.walletInfoEntity != null
                        ? state.walletInfoEntity!.networkName
                        : '',
                  ),
                ),
              ],
            ),
          ),
          BlocBuilder<WalletCubit, WalletState>(
            builder: (context, state) => (state is WalletStateLoading)
                ? const LoadingScreen()
                : const SizedBox(),
          )
        ],
      ),
    );
  }

  _showCreateOrImportWallet() async {
    return await showCustomAlertDialog(
      context,
      barrierDismissible: false,
      children: const PopUpAvalancheWallet(),
    );
  }

  _showWarningDialog(dynamic value, BuildContext context) {
    if (value is PopWithResults) {
      context.read<WalletCubit>().init();
      setState(() => indexTap = 1);
      controller.animateTo(1);
      var cubit = context.read<WalletCubit>();
      cubit.importWallet(value.results['data'] as WalletInfoEntity);
      if (value.fromPage == R.createWallet) {
        showCustomAlertDialog(context, children: const PopUpWalletWarning());
      }
    }
  }
}
