import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/dropdown_select_token.dart';
import 'package:slee_fi/presentation/screens/send_to_external/widgets/pop_up_confirm_send.dart';
import 'package:slee_fi/resources/resources.dart';

class SendToExternalScreen extends StatelessWidget {
  const SendToExternalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          title: Keys.sendTo,
          textStyle: TextStyles.bold18White,
          context: context,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      Image.asset(Imgs.sendToExternal),
                      // const SizedBox(height: 32,),
                      SFCard(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                           const  SFTextField(
                                labelText: Keys.toAddress,
                                suffixIcon : Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SFIcon(Ics.icScanOutlined,)
                                )
                            ),
                            const SizedBox(height: 24),
                             const SFTextField(
                                labelText: Keys.amount,
                                suffixIcon : Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: DropdownSelectToken(),
                                ),
                            ),
                            const SizedBox(height: 8),
                            SFText(keyText: Keys.balance, style: TextStyles.w400lightGrey12, suffix: ': 0 AVAX' ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30,),
                      Text.rich(
                        TextSpan(
                          text: translate(Keys.theNetworkYouHaveSelectedIs),
                          style: TextStyles.lightGrey12,
                          children: [
                            const TextSpan(
                                text: ' Solana ',
                                style: TextStyles.red16Italic),
                            TextSpan(text: translate(Keys.network)),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: translate(
                                    Keys.pleaseEnsureThatTheWithdrawalAddress)),
                            const TextSpan(
                                text: ' Solana ',
                                style: TextStyles.red16Italic),
                            TextSpan(text: translate(Keys.network)),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: translate(Keys.youWillLoseYourAssets),
                                style: TextStyles.red16Italic),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: translate(
                                    Keys.ifTheChosenPlatformDoesNotSupport)),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  text: Keys.confirm,
                  textStyle: TextStyles.w600WhiteSize16,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  onPressed: () {
                    showCustomAlertDialog(context,
                        children: const PopUpConfirmSend());
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
