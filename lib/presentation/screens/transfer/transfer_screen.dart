import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/pop_up_confirm_transfer.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_list.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_widget.dart';

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: LocaleKeys.transfer,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: const [
                  SizedBox(
                    height: 32.0,
                  ),
                  TransferWidget(),
                  SizedBox(
                    height: 40,
                  ),
                  Expanded(child: TransferList()),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: SFButton(
                    text: LocaleKeys.confirm_transfer,
                    textStyle: TextStyles.w600WhiteSize16,
                    width: double.infinity,
                    color: AppColors.blue,
                    onPressed: () {
                      showCustomAlertDialog(context,
                          showClosed: false,
                          children: const PopUpConfirmTransfer());
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
