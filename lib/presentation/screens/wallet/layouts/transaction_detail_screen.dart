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
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/box_button_widget.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/modal_receive_wallet.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/transaction_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';

class TransactionDetailArguments {
  final String title;
  final String img;

  TransactionDetailArguments(this.title, this.img);
}

class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as TransactionDetailArguments?;
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
              keyText: args != null ? args.title : "",
              style: TextStyles.bold14Blue,
              stringCase: StringCase.upperCase,
            )),
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                args != null
                    ? SFIcon(
                        args.img,
                        width: args.img == Ics.icAvax ? 32 : 40,
                        height: args.img == Ics.icAvax ? 32 : 40,
                      )
                    : const SizedBox(),
                const SizedBox(height: 16.0),
                SFText(
                    keyText: "0.543 ${args != null ? args.title : 'AVAX'}",
                    style: TextStyles.bold30White,
                    stringCase: StringCase.upperCase),
                const SizedBox(height: 20.0),
                const SizedBox(height: 16.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    BoxButtonWidget(
                      onTap: () => SFModalBottomSheet.show(
                          context, 0.7, const ModalReceiveWallet()),
                      text: LocaleKeys.receive,
                      assetImage: Ics.icDownload,
                    ),
                    BoxButtonWidget(
                      onTap: () => Navigator.pushNamed(context, R.transfer),
                      text: LocaleKeys.to_spending,
                      assetImage: Ics.icRefresh,
                    ),
                    BoxButtonWidget(
                      onTap: () =>
                          Navigator.pushNamed(context, R.sendToExternal),
                      text: LocaleKeys.to_external,
                      assetImage: Ics.icArrowUpRight,
                    ),
                    BoxButtonWidget(
                      onTap: () => Navigator.pushNamed(context, R.trade),
                      text: LocaleKeys.trade.reCase(StringCase.titleCase),
                      assetImage: Ics.icTransfer,

                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                const SizedBox(height: 12.0),
                const TransactionDetailList()
              ],
            ),
          ),
        ));
  }
}
