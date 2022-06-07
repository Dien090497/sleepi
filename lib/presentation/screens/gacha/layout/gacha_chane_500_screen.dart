import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/custom_radio_button.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaChance500Screen extends StatefulWidget {
  const GachaChance500Screen({Key? key}) : super(key: key);

  @override
  State<GachaChance500Screen> createState() => _GachaChance500ScreenState();
}

class _GachaChance500ScreenState extends State<GachaChance500Screen> {
  int val = -1;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const TopBarCommon(
                  iconBack: true,
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: SFText(
                            keyText: LocaleKeys.congratulations,
                            style: TextStyles.boldWhite18,
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                        image: const DecorationImage(
                                          image: AssetImage(
                                            Imgs.borderBed,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: AppColors.purple
                                                .withOpacity(0.02),
                                            spreadRadius: 3,
                                            blurRadius: 7,
                                            offset: const Offset(0,
                                                3), // changes position of shadow
                                          ),
                                        ],
                                        borderRadius: BorderRadius.circular(20)),
                                    width: 150,
                                    height: 150,
                                    child: SizedBox(
                                      child: SvgPicture.asset(Ics.sleep),
                                    )),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: AppColors.blue.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 15),
                                      child: SFText(
                                        keyText: LocaleKeys.quality,
                                        style: TextStyles.blue14,
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 16,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white.withOpacity(0.1),
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 8, horizontal: 15),
                                      child: SFText(
                                        keyText: 'IDIDIDIDID',
                                        style: TextStyles.lightWhite14,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 28),
                              ],
                            ),
                          ),
                        ),
                        SFText(
                          keyText: LocaleKeys.attributes,
                          style: TextStyles.boldWhite18,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 15),
                          child: Column(
                            children: [
                              const AttributesWidget(),
                              const SizedBox(height: 25),
                              Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color:
                                            AppColors.white.withOpacity(0.1)),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 3, right: 8),
                                                child: CustomRadio(
                                                  value: 1,
                                                  groupValue: 1,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Center(
                                                  child: SFText(
                                                    keyText: 'Short\n Bed',
                                                    style: TextStyles.blue12W700,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color:
                                            AppColors.white.withOpacity(0.1)),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 3, right: 8),
                                                child: CustomRadio(
                                                  value: 1,
                                                  groupValue: 2,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Center(
                                                  child: SFText(
                                                    keyText: 'Middle\n Bed',
                                                    style: TextStyles.lightGrey12W700,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                            color:
                                            AppColors.white.withOpacity(0.1)),
                                        child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Container(
                                                margin: const EdgeInsets.only(
                                                    top: 3, right: 8),
                                                child: CustomRadio(
                                                  value: 1,
                                                  groupValue: 3,
                                                  onChanged: (value) {},
                                                ),
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 10),
                                              child: Center(
                                                  child: SFText(
                                                    keyText: 'Long\n Bed',
                                                    style: TextStyles.lightGrey12W700,
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 40),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 16,
              left: 24,
              right: 24,
              child: SFButton(
                text: LocaleKeys.confirm,
                textStyle: TextStyles.white16,
                radius: 100,
                gradient: AppColors.gradientBlueButton,
                height: 45,
                width: size.width,
                onPressed: () {
                  Navigator.pushNamed(
                      context, R.gachaResultBed);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
