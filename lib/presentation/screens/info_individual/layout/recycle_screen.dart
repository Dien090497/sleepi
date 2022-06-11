import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return BackgroundWidget(
      child: Stack(
        children: [
          SafeArea(
            bottom: false,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const SFIcon(
                          Ics.arrowLeft,
                          width: 32,
                          height: 32,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SFText(
                          keyText: LocaleKeys.bed_recycle,
                          style: TextStyles.boldWhite18,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          width: 180,
                          height: 180,
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(Imgs.borderBed),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const SFIcon(Imgs.shortBed),
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 24.0),
                          child: SFLabelValue(
                            label: LocaleKeys.token_consumptions,
                            value: '0 SLFT + 0 SLGT',
                            styleValue: TextStyles.lightWhite14,
                            styleLabel: TextStyles.lightWhite14,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: size.height / 2,
                          decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(40),
                              topLeft: Radius.circular(40),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 24, vertical: 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 20),
                                SFText(
                                  keyText: LocaleKeys.success_rate,
                                  style: TextStyles.lightGrey14,
                                ),
                                const SizedBox(height: 20),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16  ),
                                    color: AppColors.white.withOpacity(0.05),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20, vertical: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            SFText(
                                              keyText: LocaleKeys.common_bed_box,
                                              style: TextStyles.lightWhite14,
                                            ),
                                            const Spacer(),
                                            SFText(
                                              keyText: '35%',
                                              style: TextStyles.lightWhite14,
                                            ),
                                          ],
                                        ),
                                        const SizedBox(height: 15),
                                        const Divider(
                                          thickness: 0.1,
                                          color: AppColors.lightWhite,
                                          height: 1,
                                        ),
                                        const SizedBox(height: 15),
                                        Row(
                                          children: [
                                            SFText(
                                              keyText: LocaleKeys.failure,
                                              style: TextStyles.lightWhite14,
                                            ),
                                            const Spacer(),
                                            SFText(
                                              keyText: '65%',
                                              style: TextStyles.lightWhite14,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 40),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SFText(
                                    keyText: LocaleKeys.what_recycling,
                                    style: TextStyles.lightGrey14,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                SFText(
                                  keyText: 'amet_minim_mollit_non',
                                  style: TextStyles.white14,
                                ),
                                const SizedBox(height: 24),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 74),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Material(
              color: AppColors.dark,
              child: SafeArea(
                top: false,
                child: Container(
                  padding: const EdgeInsets.only(
                      bottom: 20, left: 16, right: 16, top: 12),
                  child: SFButton(
                    text: LocaleKeys.recycle,
                    textStyle: TextStyles.white16,
                    radius: 100,
                    gradient: AppColors.gradientBlueButton,
                    width: size.width,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
