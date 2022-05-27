import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_chip.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class ExportSeedPhraseScreen extends StatelessWidget {
  const ExportSeedPhraseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: Keys.depositSlft,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    children: [
                      SFText(keyText: "Please choose Seed Phrase in order and make sure your Seed Phrase was correct written, once forgotten, it cannot be recovered",style: TextStyles.w400Red12, textAlign: TextAlign.center,),
                      const SizedBox(height: 24,),
                      SFCard(
                        height: 250,
                        padding: const EdgeInsets.all(24),
                        child: SFText(keyText: "eager unfair false dress view filter virus fringe winner nothing document basic", style: TextStyles.lightGrey14,),
                      ),
                      const SizedBox(height: 24,),
                      Wrap(
                        spacing: 6.0,
                        runSpacing: 6.0,
                        children: [
                          SFChip(
                            text: "View",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "eager",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "False",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "dress",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "Virus",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "Basic",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "View",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "unfair",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "filter",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "winner",
                            textStyle: TextStyles.w700LightGreySize14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "nothing",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                          SFChip(
                            text: "document",
                            textStyle: TextStyles.w700Light4Size14,
                            color: AppColors.light4.withOpacity(0.3),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                  child:   SFButton(
                    text: Keys.confirm,
                    textStyle: TextStyles.w600WhiteSize16,
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    onPressed: () {},
                  ),
                )
              ],
            )),
      ),
    );
  }
}
