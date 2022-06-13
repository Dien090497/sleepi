import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar_market_place.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/box_info_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/mint_from_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class InfoIndividualScreen extends StatelessWidget {
  const InfoIndividualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as bool?;

    return Stack(
      children: [
        BackgroundWidget(
          child: SafeArea(
            top: false,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).padding.top,
                ),
                const TopBarCommon(iconBack: true),
                const SizedBox(height: 10),
                Expanded(
                  child: SingleChildScrollView(
                    physics: const ScrollPhysics(),
                    child: Column(
                      children: [
                        Container(
                          height: 180,
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Imgs.borderBed),
                                fit: BoxFit.cover),
                          ),
                          child: const SFIcon(Imgs.shortBed),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SFImageBorder(
                                icon: Imgs.jewelPurple,
                                onTap: () {},
                                radius: 16,
                                size: const Size(75, 75),
                                padding: 8),
                            const SizedBox(width: 10),
                            SFImageBorder(
                              icon: Imgs.jewelGreen,
                              onTap: () {},
                              radius: 16,
                              size: const Size(75, 75),
                              padding: 8,
                            ),
                            const SizedBox(width: 10),
                            SFImageBorder(
                                icon: Imgs.jewelSliver,
                                onTap: () {},
                                radius: 16,
                                size: const Size(75, 75),
                                padding: 8),
                            const SizedBox(width: 10),
                            SFImageBorder(
                              icon: Imgs.jewelRed,
                              onTap: () {},
                              radius: 16,
                              size: const Size(75, 75),
                              padding: 8,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const BoxInfoWidget(),
                        const SizedBox(height: 24),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: SFText(
                                  keyText: LocaleKeys.attributes,
                                  style: TextStyles.bold18LightWhite,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SFButtonOutLined(
                                    title: LocaleKeys.base,
                                    textStyle: TextStyles.bold14Blue,
                                    borderColor: AppColors.blue,
                                    onPressed: () {},
                                  ),
                                  const SizedBox(width: 8),
                                  SFButton(
                                    height: 38,
                                    text: "+ ${LocaleKeys.point.tr()}",
                                    textStyle: TextStyles.boldWhite14,
                                    gradient: AppColors.gradientBlueButton,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        const AttributesWidget(),
                        const SizedBox(height: 33),
                        Container(
                          decoration: const BoxDecoration(
                            color: AppColors.dark,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(40),
                              topRight: Radius.circular(40),
                            ),
                          ),
                          child: Column(
                            children: const [
                              MintFromWidget(
                                  title: LocaleKeys.minted_from, numbers: 2),
                              MintFromWidget(title: LocaleKeys.mint, numbers: 7),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: args ?? false
              ? const BottomBarMarketPlaceWidget()
              : const BottomBarWidget(),
        )
      ],
    );
  }
}
