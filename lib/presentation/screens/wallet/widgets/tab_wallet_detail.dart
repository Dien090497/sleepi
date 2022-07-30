import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/toast_utils.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/trade/trade_screen.dart';
import 'package:slee_fi/presentation/screens/transfer/transfer_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/wallet_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class TabWalletDetail extends StatefulWidget {
  const TabWalletDetail({Key? key}) : super(key: key);

  @override
  State<TabWalletDetail> createState() => _TabWalletDetailState();
}

class _TabWalletDetailState extends State<TabWalletDetail> {
  final RefreshController refreshController = RefreshController();
  final FToast fToast = FToast();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    fToast.init(context);
    super.didChangeDependencies();
  }

  void _onRefresh(WalletCubit walletCubit) async {
    await walletCubit.refresh();
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final walletCubit = context.read<WalletCubit>();

    return BlocBuilder<WalletCubit, WalletState>(
      builder: (context, state) {
        if (state is WalletStateLoaded) {
          final balance = state.walletInfoEntity.nativeCurrency.balance;
          final addressWallet = state.walletInfoEntity.address;
          final currencySymbol = state.walletInfoEntity.nativeCurrency.symbol;
          final networkName = state.walletInfoEntity.networkName;
          final tokenList = state.tokenList;
          return SmartRefresher(
            controller: refreshController,
            onRefresh: () {
              _onRefresh(walletCubit);
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32),
                  SFText(keyText: networkName, style: TextStyles.bold12Blue),
                  const SizedBox(height: 4.0),
                  Text('${balance.formatBalanceWallet} $currencySymbol',
                      style: TextStyles.bold30White),
                  const SizedBox(height: 20.0),
                  GestureDetector(
                    onTap: () {
                      fToast.removeCustomToast();
                      _copyAddress(fToast, context, addressWallet);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.lightWhite.withOpacity(0.05),
                      ),
                      child: Text(addressWallet.formatAddress,
                          style: TextStyles.lightWhite14),
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    constraints: const BoxConstraints(maxHeight: 130),
                    padding: const EdgeInsets.symmetric(horizontal: 23),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () => SFModalBottomSheet.show(
                                context,
                                0.7,
                                ModalReceiveWallet(
                                  networkName: networkName,
                                  address: addressWallet,
                                )),
                            text: LocaleKeys.receive,
                            assetImage: Ics.icDownload,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () {
                              if (tokenList.length < 2) {
                                return;
                              }
                              Navigator.pushNamed(
                                context,
                                R.transfer,
                                arguments: TransferScreenArg(
                                    address: tokenList[2].address,
                                    isToSpending: true),
                              );
                            },
                            text: LocaleKeys.to_spending,
                            assetImage: Ics.icRefresh,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () =>
                                Navigator.pushNamed(context, R.sendToExternal),
                            text: LocaleKeys.to_external,
                            assetImage: Ics.icArrowUpRight,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                R.trade,
                                arguments: TradeArguments(
                                  contractAddressFrom: getIt<List<dynamic>>(
                                          instanceName: 'tokens')[0]['address']
                                      .toString(),
                                ),
                              );
                            },
                            text: LocaleKeys.trade
                                .tr()
                                .reCase(StringCase.titleCase),
                            assetImage: Ics.icTransfer,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const PopupInfoWallet(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ElevatedButton(
                              onPressed: () async {
                                final langCodes = Const.locales
                                    .map<String>((e) => e.languageCode)
                                    .toList();
                                final currentLocale = context.locale;
                                int selectedIndex = langCodes
                                    .indexOf(currentLocale.languageCode);
                                var uri = Uri.parse(Const.binanceUrlEn);
                                if (selectedIndex == 4) {
                                  uri = Uri.parse(Const.binanceUrlJa);
                                }
                                if (await canLaunchUrl(uri)) {
                                  launchUrl(uri);
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.fromLTRB(12, 8, 16, 8),
                                primary: AppColors.yellow.withOpacity(0.1),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100.0),
                                ),
                              ),
                              child: Row(
                                children: [
                                  const SFIcon(Imgs.binance, width: 24),
                                  const SizedBox(width: 8.0),
                                  SFText(
                                    keyText: LocaleKeys.buy,
                                    style: TextStyles.bold14Yellow,
                                  )
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12.0),
                  WalletDetailList(tokenList: tokenList)
                ],
              ),
            ),
          );
        }
        return const LoadingScreen();
      },
    );
  }

  void _copyAddress(FToast fToast, BuildContext context, String address) async {
    ClipboardData? data = await Clipboard.getData(Clipboard.kTextPlain);
    if (data?.text == address) {
      debugPrint(address);
    } else {
      Clipboard.setData(ClipboardData(text: address));
    }

    ToastUtils.showToast(
      fToast,
      AppColors.white.withOpacity(0.55),
      LocaleKeys.successfully_copied,
    );
  }
}
