import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaResultBedScreen extends StatelessWidget {
  const GachaResultBedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final Size size = MediaQuery.of(context).size;
    return BackgroundWidget(
      child: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0),
              child: Column(
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
                              keyText: LocaleKeys.result,
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
                                          borderRadius:
                                              BorderRadius.circular(20)),
                                      width: 180,
                                      height: 180,
                                      child: const SizedBox(
                                        child: SFIcon(Imgs.shortBed),
                                      )),
                                  const SizedBox(height: 12),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color:
                                              AppColors.blue.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 9, horizontal: 12),
                                        child: SFText(
                                          keyText: LocaleKeys.quality,
                                          style: TextStyles.blue14,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.1),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                        ),
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 9, horizontal: 12),
                                        child: SFText(
                                          keyText: 'D1283',
                                          style: TextStyles.white14WithOpacity,
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
                                horizontal: 24, vertical: 15),
                            child: Column(
                              children: const [
                                AttributesWidget(),
                                SizedBox(height: 76),
                              ],
                            ),
                          )
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
                color: Colors.transparent,
                child: SafeArea(
                  top: false,
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 24, right: 24, top: 12),
                    child: SFButtonOutLined(
                      title: LocaleKeys.ok,
                      fixedSize: const Size(double.infinity, 48),
                      textStyle: TextStyles.blue16,
                      borderColor: AppColors.blue,
                      bgColor: AppColors.lightDark,
                      onPressed: () => Navigator.pop(context),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
