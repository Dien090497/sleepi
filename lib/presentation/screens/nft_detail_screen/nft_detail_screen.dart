import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/send_to_external/send_to_external_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/resources/resources.dart';

class NFTDetailArguments {
  final TokenEntity tokenEntity;

  NFTDetailArguments(this.tokenEntity);
}

class NFTDetailScreen extends StatelessWidget {
  const NFTDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as NFTDetailArguments;
    final token = args.tokenEntity;

    return BackgroundWidget(
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
          title: SFText(
            keyText: token.displayName,
            style: TextStyles.bold14Blue,
            stringCase: StringCase.titleCase,
          )),
      child: ListView(
        children: [
          SFIcon(token.icon),
          const SizedBox(height: 16.0),
          SFText(
            keyText: "${token.balance.toStringAsFixed(6)} ${token.displayName}",
            style: TextStyles.bold30White,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 36.0),
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
                      const ModalReceiveWallet(
                        address: 'input the address',
                        networkName: LocaleKeys.avalanche_wallet,
                      ),
                    ),
                    text: LocaleKeys.receive,
                    assetImage: Ics.icDownload,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BoxButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, R.transfer,
                          arguments: token);
                    },
                    text: LocaleKeys.to_spending,
                    assetImage: Ics.icRefresh,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BoxButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        R.sendToExternal,
                        arguments: SendToExternalArguments(
                          tokenEntity: token,
                          symbol: token.symbol,
                          icon: token.icon,
                        ),
                      );
                    },
                    text: LocaleKeys.to_external,
                    assetImage: Ics.icArrowUpRight,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: BoxButtonWidget(
                    onTap: () {
                      Navigator.pushNamed(context, R.trade);
                    },
                    text: LocaleKeys.trade.tr().reCase(StringCase.titleCase),
                    assetImage: Ics.icTransfer,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32.0),
        ],
      ),
    );
  }
}