import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_attributes_item.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/option_beds.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaChance500Arguments {
  final GachaAttributesItem? attributesItem;
  final String image;

  GachaChance500Arguments({this.attributesItem, required this.image});
}

class GachaChance500Screen extends StatelessWidget {
  const GachaChance500Screen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as GachaChance500Arguments?;

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
                                        borderRadius:
                                        BorderRadius.circular(20)),
                                    width: 180,
                                    height: 180,
                                    child:  SizedBox(
                                      child: SFIcon(args != null && args.attributesItem != null ? args.image : ''),
                                    )),
                                const SizedBox(height: 12),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SFCard(
                                      radius: 50,
                                      height: 36,
                                      color: AppColors.blue.withOpacity(0.15),
                                      child: Center(
                                        child: SFText(
                                          keyText: args?.attributesItem?.quality ?? '',
                                          style: TextStyles.blue14,
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 15,
                                    ),
                                    SFCard(
                                      radius: 50,
                                      height: 36,
                                      child: Center(
                                        child: SFText(
                                          keyText: '${args?.attributesItem?.nftId ?? ''}',
                                          style: TextStyles.lightWhite14,
                                          textAlign: TextAlign.center,
                                        ),
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
                            children:  [
                              AttributesWidget(
                                bonus: args?.attributesItem?.bonus,
                                efficiency: args?.attributesItem?.efficiency,
                                luck: args?.attributesItem?.luck,
                                resilience: args?.attributesItem?.resilience,
                                special: args?.attributesItem?.special,
                              ),
                              const SizedBox(height: 25),
                               OptionBeds(type: args?.attributesItem?.classNft,),
                              const SizedBox(height: 77),
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
                  Navigator.pop(context, true);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
