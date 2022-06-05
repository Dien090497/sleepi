import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
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
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.transfer,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: DismissKeyboardWidget(
        child: SafeArea(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child:  Column(
              mainAxisSize: MainAxisSize.max,
              children:   [
                const TransferWidget(),
                const  SizedBox(
                  height: 24,
                ),
                const TransferList(),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(12, 0, 12, 24),
                    child: SFButton(
                      text: LocaleKeys.confirm_transfer,
                      textStyle: TextStyles.w600WhiteSize16,
                      width: double.infinity,
                      gradient: AppColors.gradientBlueButton,
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
      ),
    );
  }
}
