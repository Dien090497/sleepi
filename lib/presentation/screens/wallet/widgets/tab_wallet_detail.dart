import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/detail_wallet/detail_wallet_state.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/wallet_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class TabWalletDetail extends StatelessWidget {
  const TabWalletDetail({
    Key? key,
    required this.balance,
    required this.networkName,
    required this.currencySymbol,
    required this.addressWallet,
  }) : super(key: key);
  final int balance;
  final String networkName;
  final String currencySymbol;
  final String addressWallet;

  @override
  Widget build(BuildContext context) {
    var isJapanese = Localizations.localeOf(context).toLanguageTag().isJapanese;
    return SingleChildScrollView(
      child: BlocProvider(
        create: (context) => DetailWalletCubit()..loadCurrentWallet(),
        child: BlocConsumer<DetailWalletCubit, DetailWalletState>(
          listener: (context, state) {},
          builder: (context, state) {
            final cubit = context.read<DetailWalletCubit>();
            return Column(
              children: [
                const SizedBox(height: 32),
                Column(
                  children: [
                    SFText(keyText: networkName, style: TextStyles.bold12Blue),
                    const SizedBox(height: 4.0),
                    SFText(
                        keyText:
                            '${balance == 0 ? 0 : balance / pow(10, 18)} $currencySymbol',
                        style: TextStyles.bold30White),
                    const SizedBox(height: 20.0),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16.0),
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20.0),
                        color: AppColors.lightWhite.withOpacity(0.05),
                      ),
                      child: SFText(
                          keyText: addressWallet.formatAddress,
                          style: TextStyles.lightWhite14),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxHeight: 130),
                  child: Padding(
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
                            onTap: () =>
                                Navigator.pushNamed(context, R.transfer),
                            text: LocaleKeys.to_spending,
                            assetImage: Ics.icRefresh,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () =>
                                Navigator.pushNamed(context, R.sendToExternal),
                            text: LocaleKeys.to_external,
                            assetImage: Ics.icArrowUpRight,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: BoxButtonWidget(
                            onTap: () => Navigator.pushNamed(context, R.trade),
                            text: LocaleKeys.trade
                                .tr()
                                .reCase(StringCase.titleCase),
                            assetImage: Ics.icTransfer,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const PopupInfoWallet(),
                      ElevatedButton(
                          onPressed: () async {
                            var url =
                                isJapanese ? Const.okCoinUrl : Const.binanceUrl;
                            final uri = Uri.parse(url);
                            if (await canLaunchUrl(uri)) {
                              launchUrl(uri);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.fromLTRB(12, 8, 16, 8),
                            primary: AppColors.yellow.withOpacity(0.1),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                          ),
                          child: Row(
                            children: [
                              SFIcon(
                                isJapanese ? Ics.okcoin : Imgs.binance,
                                width: 24,
                              ),
                              const SizedBox(width: 8.0),
                              SFText(
                                keyText: LocaleKeys.buy,
                                style: isJapanese
                                    ? TextStyles.bold14Blue
                                    : TextStyles.bold14Yellow,
                              )
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: 12.0),
                state is DetailWalletStateSuccess
                    ? WalletDetailList(tokenList: state.tokenList)
                    : WalletDetailList(tokenList: cubit.tokenList)
              ],
            );
          },
        ),
      ),
    );
  }
}
