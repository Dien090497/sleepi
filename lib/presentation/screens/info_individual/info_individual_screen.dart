import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/bottom_bar_market_place.dart';
import 'package:slee_fi/presentation/screens/info_individual/widget/box_info_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class InfoIndividualParams {
  final bool? buy;
  final BedEntity bed;
  final MarketPlaceModel? marketPlaceModel;

  InfoIndividualParams({this.buy, required this.bed, this.marketPlaceModel});
}

class InfoIndividualScreen extends StatelessWidget {
  const InfoIndividualScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as InfoIndividualParams;

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
                          height: 180, width: 180,
                          margin: const EdgeInsets.symmetric(vertical: 24),
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(Imgs.borderBed),
                                fit: BoxFit.cover),
                          ),
                          child: args.bed.image.contains('http')
                              ? CachedImage(
                                  image: args.bed.image,
                                )
                              : SFIcon(args.bed.image),
                        ),
                        Wrap(
                            spacing: 8.0,
                            runSpacing: 8.0,
                            alignment: WrapAlignment.center,
                            children: [
                              SFImageBorder(
                                  icon: Imgs.jewelPurple,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(65, 65),
                                  padding: 8),
                              SFImageBorder(
                                icon: Imgs.jewelGreen,
                                onTap: () {},
                                radius: 16,
                                size: const Size(65, 65),
                                padding: 8,
                              ),
                              SFImageBorder(
                                  icon: Imgs.jewelSliver,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(65, 65),
                                  padding: 8),
                              SFImageBorder(
                                icon: Imgs.jewelRed,
                                onTap: () {},
                                radius: 16,
                                size: const Size(65, 65),
                                padding: 8,
                              ),
                              SFImageBorder(
                                icon: Imgs.jewelRed,
                                onTap: () {},
                                radius: 16,
                                size: const Size(65, 65),
                                padding: 8,
                              ),
                            ]),
                        const SizedBox(height: 16),
                        BoxInfoWidget(bed: args.bed),
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
                                  // SFButton(
                                  //   height: 38,
                                  //   text: "+ ${LocaleKeys.point.tr()}",
                                  //   textStyle: TextStyles.boldWhite14,
                                  //   gradient:
                                  //       AppColors.gradientBlueButton,
                                  //   onPressed: () {},
                                  // ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        AttributesWidget(
                          bonus: args.bed.bonus,
                          efficiency: args.bed.efficiency,
                          luck: args.bed.luck,
                          resilience: args.bed.resilience,
                          special: args.bed.special,
                        ),
                        const SizedBox(height: 33),
                        // Container(
                        //   decoration: const BoxDecoration(
                        //     color: AppColors.dark,
                        //     borderRadius: BorderRadius.only(
                        //       topLeft: Radius.circular(40),
                        //       topRight: Radius.circular(40),
                        //     ),
                        //   ),
                        //   child: Column(
                        //     children: const [
                        //       MintFromWidget(
                        //           title: LocaleKeys.minted_from,
                        //           numbers: 2),
                        //       MintFromWidget(
                        //           title: LocaleKeys.mint, numbers: 7),
                        //     ],
                        //   ),
                        // ),
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
          child: args.marketPlaceModel != null && (args.buy ?? false)
              ? BottomBarMarketPlaceWidget(bed: args.marketPlaceModel!)
              : const BottomBarWidget(),
        )
      ],
    );
  }
}
