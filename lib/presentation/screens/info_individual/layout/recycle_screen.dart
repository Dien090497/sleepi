import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class RecycleScreen extends StatelessWidget {
  const RecycleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: BackgroundWidget(
        child: SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 20,
                    left: 16,
                    right: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      const Expanded(child: SizedBox()),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          image: const DecorationImage(
                            image: AssetImage(
                              "assets/images/borderBed.png",
                            ),
                            fit: BoxFit.cover,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.purple.withOpacity(0.02),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      width: 160,
                      height: 160,
                      child: SizedBox(
                        child: SvgPicture.asset(Ics.sleep),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: SFCard(
                        margin: EdgeInsets.zero,
                        padding: const EdgeInsets.symmetric(
                            vertical: 24, horizontal: 18),
                        child: Row(
                          children: [
                            SFText(
                              keyText: LocaleKeys.token,
                              style: TextStyles.lightGrey16,
                            ),
                            const SizedBox(width: 4),
                            Expanded(
                              child: SFText(
                                keyText: '0 SLFT + 0 SLGT',
                                style: TextStyles.white16,
                                textAlign: TextAlign.right,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
                Container(
                  height: size.height / 2,
                  decoration: const BoxDecoration(
                    color: AppColors.black,
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        SFText(
                          keyText: LocaleKeys.success_rate,
                          style: TextStyles.lightWhite14,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
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
                                      keyText: LocaleKeys.common_bed,
                                      style: TextStyles.white14,
                                    ),
                                    const Spacer(),
                                    SFText(
                                      keyText: '35%',
                                      style: TextStyles.lightWhite14,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                const Divider(
                                  thickness: 0.3,
                                  color: AppColors.lightWhite,
                                  height: 1,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  children: [
                                    SFText(
                                      keyText: LocaleKeys.failure,
                                      style: TextStyles.white14,
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
                        const SizedBox(
                          height: 40,
                        ),
                        SFText(
                          keyText: LocaleKeys.what_recycle,
                          style: TextStyles.lightWhite14,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SFText(
                          keyText: LocaleKeys.body_recycle,
                          style: TextStyles.white14,
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Center(
                            child: SFButton(
                              text: LocaleKeys.recycle,
                              textStyle: TextStyles.white16,
                              radius: 100,
                              gradient: AppColors.gradientBlueButton,
                              height: 45,
                              width: size.width,
                              toUpperCase: true,
                            ),
                          ),
                        ),
                      ],
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
