import 'package:flutter/material.dart';
import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class TradeScreen extends StatelessWidget {
  const TradeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  SFText(keyText: Keys.trade),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                    ),
                    child: const Icon(Icons.refresh),
                  ),
                ],
              ),
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.black),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SFText(keyText: Keys.from),
                              const Spacer(),
                              SFText(
                                keyText: Keys.balance,
                              ),
                              SFText(
                                keyText: ': 0',
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                SFText(keyText: '0.00'),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      SFText(
                                        keyText: Keys.max,
                                        style: TextStyles.yellow16Italic,
                                      ),
                                      const SizedBox(width: 4),
                                      const Icon(
                                          Icons.monetization_on_outlined),
                                      const SizedBox(width: 4),
                                      SFText(keyText: 'USDC'),
                                      const Icon(
                                          Icons.keyboard_arrow_down_rounded)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Container(
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.greyBottomNavBar,
                        ),
                        padding: const EdgeInsets.all(4),
                        child: const Icon(Icons.swap_vert_outlined),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppColors.black),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SFText(keyText: Keys.to),
                              SFText(keyText: ' (${translate(Keys.balance)})'),
                              const Spacer(),
                              SFText(keyText: Keys.balance),
                              SFText(
                                keyText: ': 0',
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Row(
                              children: [
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {},
                                  child: Row(
                                    children: [
                                      const Icon(Icons.ac_unit_outlined),
                                      const SizedBox(width: 4),
                                      SFText(keyText: 'GST'),
                                      const Icon(
                                          Icons.keyboard_arrow_down_rounded)
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 12),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SFButton(
                width: double.infinity,
                text: Keys.trade,
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
