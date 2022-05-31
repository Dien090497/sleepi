import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/wallet_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:url_launcher/url_launcher.dart';

class TabWalletDetail extends StatelessWidget {
  const TabWalletDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          SFText(keyText: Keys.avaxCChain, style: TextStyles.bold12Blue),
          const SizedBox(
            height: 4.0,
          ),
          SFText(keyText: "0 AVAX", style: TextStyles.bold30White),
          const SizedBox(
            height: 20.0,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: AppColors.lightWhite.withOpacity(0.05),
            ),
            child: SFText(
                keyText: "Eq7fbho...asdasd.9aj92as",
                style: TextStyles.lightWhite14),
          ),
          const SizedBox(
            height: 16.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BoxButtonWidget(
                onTap: () => SFModalBottomSheet.show(
                    context, 0.7, const ModalReceiveWallet()),
                text: Keys.receive,
                assetImage: Ics.icDownload,
              ),
              BoxButtonWidget(
                onTap: () => Navigator.pushNamed(context, R.transfer),
                text: Keys.toSpending,
                assetImage: Ics.icRefresh,
              ),
              BoxButtonWidget(
                onTap: () => Navigator.pushNamed(context, R.sendToExternal),
                text: Keys.toExternal,
                assetImage: Ics.icArrowUpRight,
              ),
              BoxButtonWidget(
                onTap: () => Navigator.pushNamed(context, R.trade),
                text: Keys.trade,
                assetImage: Ics.icTransfer,
              ),
            ],
          ),
          const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const PopupInfoWallet(),
                ElevatedButton(
                    onPressed: _launchUrl,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 8.0),
                      primary: AppColors.yellow.withOpacity(0.15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                    ),
                    child: Row(
                      children: [
                       const SFIcon(Imgs.binance),
                        const SizedBox(
                          width: 8.0,
                        ),
                        SFText(
                          keyText: Keys.buy,
                          style: TextStyles.bold14Yellow,
                        )
                      ],
                    )),
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          const Expanded(child: WalletDetailList())
        ],
      ),
    );
  }

  void createWalletDialog(BuildContext context) {
    showCustomDialog(context, children: [
      Row(
        children: [
          const SizedBox(width: 24),
          const Spacer(),
          SFText(
            keyText: Keys.wallet,
            prefix: 'SOLANA ',
            toUpperCase: true,
          ),
          const Spacer(),
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.green,
            ),
            padding: const EdgeInsets.all(6),
            child: const Icon(Icons.close, size: 16),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, R.walletCreationWarning);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.black),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SFText(keyText: Keys.createANewWallet),
              ),
            ),
            const SizedBox(height: 24),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, R.importWallet);
              },
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppColors.black),
                ),
                alignment: Alignment.center,
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: SFText(keyText: Keys.importAWalletUsingSeedPhrase),
              ),
            ),
          ],
        ),
      )
    ]);
  }
}

final Uri _url = Uri.parse('https://www.binance.com/');
void _launchUrl() async {
  if (!await launchUrl(_url)) throw 'Could not launch $_url';
}
