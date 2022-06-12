import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
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
    return DismissKeyboardWidget(
      child: BackgroundWidget(
        appBar: SFAppBar(
          title: LocaleKeys.send_to.tr().reCase(StringCase.titleCase),
          textStyle: TextStyles.bold18White,
          context: context,
        ),
        resizeToAvoidBottomInset: false,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
                              textInputType: TextInputType.number,
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
                          text: LocaleKeys.the_network_you_have_selected_1.tr(),
                          style: TextStyles.w400lightGrey12,
                          children: [
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys.avalanche.tr(),
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_2
                                    .tr()),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_3
                                    .tr()),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys.avalanche.tr(),
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_4
                                    .tr()),
                            const TextSpan(text: '. '),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_5
                                    .tr(),
                                style: TextStyles.w400Red12),
                            const TextSpan(text: ' '),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_6
                                    .tr()),
                            TextSpan(
                                text: LocaleKeys.the_network_you_have_selected_7
                                    .tr(),
                                style: TextStyles.w400Red12),
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
                const SizedBox(
                  height: 37.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
