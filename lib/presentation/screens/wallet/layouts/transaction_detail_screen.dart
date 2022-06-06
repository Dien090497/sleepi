import 'package:flutter/material.dart';
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
import 'package:slee_fi/resources/resources.dart';


class TransactionDetail extends StatelessWidget {
  const TransactionDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  BackgroundWidget(
      appBar:  AppBar(
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
        title: SFText(keyText: "Avax",  style: TextStyles.bold14Blue,)
      ),
      child:  SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              const SFIcon(Ics.icSolana),
              const SizedBox(
                height: 16.0,
              ),
              SFText(keyText: "00.500583 AVAX", style: TextStyles.bold30White),
              const SizedBox(
                height: 20.0,
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
                    text: LocaleKeys.receive,
                    assetImage: Ics.icDownload,
                  ),
                  BoxButtonWidget(
                    onTap: () => Navigator.pushNamed(context, R.transfer),
                    text: LocaleKeys.to_spending,
                    assetImage: Ics.icRefresh,
                  ),
                  BoxButtonWidget(
                    onTap: () => Navigator.pushNamed(context, R.sendToExternal),
                    text: LocaleKeys.to_external,
                    assetImage: Ics.icArrowUpRight,
                  ),
                  BoxButtonWidget(
                    onTap: () => Navigator.pushNamed(context, R.trade),
                    text: LocaleKeys.trade,
                    assetImage: Ics.icTransfer,
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                height: 12.0,
              ),
              const TransactionDetail()
            ],
          ),
        ),
      )

    );
  }
}
