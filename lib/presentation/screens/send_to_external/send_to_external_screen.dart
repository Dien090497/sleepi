import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class SendToExternalScreen extends StatelessWidget {
  const SendToExternalScreen({Key? key}) : super(key: key);

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
              const SFButton(
                text: Keys.confirm,
                width: double.infinity,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
