import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class SendToExternalScreen extends StatelessWidget {
  const SendToExternalScreen({Key? key}) : super(key: key);

  void sendDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) {
        return SFDialog(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 44),
                SFText(
                  keyText: Keys.send,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const CircleBorder(),
                  ),
                  child: const Icon(Icons.close),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SFText(keyText: Keys.fee),
                const SizedBox(height: 8),
                Expanded(
                    child: SFText(
                        textAlign: TextAlign.right, keyText: '0.0000005 SOL')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SFText(keyText: Keys.youllSend),
                const SizedBox(height: 8),
                Expanded(
                    child: SFText(
                        textAlign: TextAlign.right, keyText: '0.60231512 SOL')),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                SFText(textAlign: TextAlign.right, keyText: Keys.sendAddress),
                const SizedBox(width: 8),
                Expanded(
                    child: SFText(
                        textAlign: TextAlign.right,
                        keyText:
                            'AmYiQBz5OwerJpA9wIsuvMZnaQI19Lawu8uqQweudjAKsqblxjo821JsqiucSJDNsSqitOs')),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: const [
                Expanded(
                  child: SFButton(text: Keys.cancel),
                ),
                SizedBox(width: 12),
                Expanded(
                  child: SFButton(text: Keys.confirm),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SFAppBar(
        title: Keys.sendTo,
        toUpperCase: true,
        backgroundColor: AppColors.transparent,
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
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 80),
                      decoration: const BoxDecoration(
                        color: AppColors.greyBottomNavBar,
                      ),
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: SFText(
                          keyText: 'AVAX', style: TextStyles.bold20black),
                    ),
                    const SizedBox(height: 24),
                    SFText(keyText: Keys.toAddress),
                    const SizedBox(height: 12),
                    const SFTextField(),
                    const SizedBox(height: 36),
                    SFText(keyText: Keys.amount),
                    const SizedBox(height: 12),
                    const SFTextField(),
                    const SizedBox(height: 8),
                    SFText(keyText: Keys.balance, extraText: ': 0 SOL'),
                    const SizedBox(height: 24),
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: const EdgeInsets.all(12),
                      alignment: Alignment.center,
                      child: Text.rich(
                        TextSpan(
                          text: translate(Keys.theNetworkYouHaveSelectedIs),
                          style: TextStyles.black16Italic,
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
                    ),
                  ],
                ),
              ),
              SFButton(
                text: Keys.confirm,
                width: double.infinity,
                onPressed: () {
                  sendDialog(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
