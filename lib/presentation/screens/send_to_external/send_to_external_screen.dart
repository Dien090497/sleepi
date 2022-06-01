import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_translate/flutter_translate.dart';
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
import 'package:slee_fi/l10n/locale_keys.g.dart';
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
          title: LocaleKeys.send_to,
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
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SFTextField(
                                labelText: LocaleKeys.to_address,
                                suffixIcon: Padding(
                                    padding: EdgeInsets.all(10),
                                    child: SFIcon(
                                      Ics.icScanOutlined,
                                    ))),
                            const SizedBox(height: 24),
                            const SFTextField(
                              labelText: LocaleKeys.amount,
                              suffixIcon: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: DropdownSelectToken(),
                              ),
                            ),
                            const SizedBox(height: 8),
                            SFText(
                                keyText: LocaleKeys.balance,
                                style: TextStyles.w400lightGrey12,
                                suffix: ': 0 AVAX'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text.rich(
                        TextSpan(
                          text: LocaleKeys.the_network_you_have_selected_is.tr(),
                          style: TextStyles.w400lightGrey12,
                          children: [
                            const TextSpan(text: ' '),
                            const TextSpan(
                                text: LocaleKeys.avalanche,
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(text: LocaleKeys.network.tr()),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: LocaleKeys.please_ensure_that_the_withdrawal_address.tr()),
                            const TextSpan(text: ' '),
                            const TextSpan(
                                text: LocaleKeys.avalanche,
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(text: LocaleKeys.network.tr()),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: LocaleKeys.you_will_lose_your_assets.tr(),
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys
                                    .if_the_chosen_platform_does_not_support.tr()),
                            const TextSpan(text: '.'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SFButton(
                  text: LocaleKeys.confirm,
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
