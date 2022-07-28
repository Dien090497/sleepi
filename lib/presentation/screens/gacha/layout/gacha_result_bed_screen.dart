import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_attributes_item.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaResultBedArguments {
  final GachaAttributesItem? attributesItem;
  final String image;
  final num? percentEffect;
  final dynamic quantitySlft;

  GachaResultBedArguments({this.quantitySlft, this.percentEffect, this.attributesItem, required this.image});
}

class GachaResultBedScreen extends StatelessWidget {
  const GachaResultBedScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as GachaResultBedArguments?;

    String? type;
    String? nftName;
    if(args?.attributesItem?.nftType == 'item'){
      type = args?.attributesItem?.itemType;
      nftName = LocaleKeys.item.tr();
    }else if (args?.attributesItem?.nftType == 'jewel'){
      type = args?.attributesItem?.jewelType;
      nftName = LocaleKeys.jewels.tr();
    }else {
      type = args?.attributesItem?.quality;
    }
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
                      physics: const ClampingScrollPhysics(),
                      child: Column(
                        children: [
                        Container(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: SFText(
                              keyText: LocaleKeys.result,
                              style: TextStyles.boldWhite18,
                            ),
                          ),
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
                                child: SFIcon(args != null && args.attributesItem != null ? args.image : Ics.icSlft),
                              )),
                          const SizedBox(height: 12),
                          args?.quantitySlft != null
                              ?
                              SFText(
                                keyText: '${args?.quantitySlft}',
                                style: TextStyles.bold30White,
                              )
                              :
                          SingleChildScrollView(
                            child: Column(
                              children: [
                                nftName != null ?  Padding(
                                  padding: const EdgeInsets.only(bottom: 12),
                                  child: SFText(
                                    keyText:
                                    '${type?.tr()} ${args?.attributesItem?.nftType == 'item' ? '' : nftName} (Lv.${args?.attributesItem?.level.toInt()})',
                                    style: TextStyles.white1w700size16,
                                  ),
                                ) : const SizedBox(),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    args?.attributesItem?.nftType == 'item' || args?.attributesItem?.nftType == 'jewel'? const SizedBox() : SFCard(
                                      radius: 50,
                                      height: 36,
                                      margin: const EdgeInsets.only(top: 15, right: 15),
                                      color: AppColors.blue.withOpacity(0.15),
                                      child: Center(
                                        child: SFText(
                                          keyText: type ?? '',
                                          style: TextStyles.blue14,
                                        ),
                                      ),
                                    ),
                                    SFCard(
                                      radius: 50,
                                      height: 36,
                                      child: Center(
                                        child: SFText(
                                          keyText: args?.attributesItem?.name ?? '',
                                          style: TextStyles.lightWhite14,
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 28),
                                args?.attributesItem?.nftType == 'bed' ? Column(
                                  children: [
                                    SFText(
                                      keyText: LocaleKeys.attributes,
                                      style: TextStyles.boldWhite18,
                                    ),
                                  ],
                                ) : const SizedBox(),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 24, vertical: 15),
                                  child: Column(
                                    children: [
                                      args?.attributesItem?.nftType == 'item' || args?.attributesItem?.nftType == 'jewel' ? Column(
                                        children: [
                                          args?.attributesItem?.nftType == 'jewel' ? SFCard(
                                            radius: 8,
                                            margin: EdgeInsets.zero,
                                            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                                            child: Row(
                                              children: [
                                                SFText(
                                                  keyText: LocaleKeys.attributes,
                                                  style: TextStyles.lightGrey16,
                                                ),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: SFText(
                                                    keyText:
                                                    '+ ${args?.attributesItem?.type.reCase(StringCase.titleCase)}',
                                                    style: TextStyles.blue16,
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ) : const SizedBox(),
                                          const SizedBox(height: 12),
                                          SFCard(
                                            radius: 8,
                                            margin: EdgeInsets.zero,
                                            padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 24),
                                            child: Row(
                                              children: [
                                                SFText(
                                                  keyText: LocaleKeys.effect,
                                                  style: TextStyles.lightGrey16,
                                                ),
                                                const SizedBox(width: 4),
                                                Expanded(
                                                  child: SFText(
                                                    keyText:
                                                    args?.attributesItem?.nftType == 'item'
                                                        ?
                                                    '${args?.percentEffect ?? 0}%'
                                                        :
                                                    '+ ${args?.percentEffect ?? 0}% ${LocaleKeys.base.tr()} ${args?.attributesItem?.type.reCase(StringCase.titleCase)}',
                                                    style: TextStyles.blue16,
                                                    textAlign: TextAlign.right,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )
                                      : AttributesWidget(
                                        bonus: args?.attributesItem?.bonus,
                                        efficiency: args?.attributesItem?.efficiency,
                                        luck: args?.attributesItem?.luck,
                                        resilience: args?.attributesItem?.resilience,
                                        special: args?.attributesItem?.special,
                                      ),
                                     const SizedBox(height: 76),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),

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
                      title: LocaleKeys.ok.tr(),
                      fixedSize: const Size(double.infinity, 48),
                      textStyle: TextStyles.blue16,
                      borderColor: AppColors.blue,
                      bgColor: AppColors.lightDark,
                      onPressed: () => Navigator.pop(context, true),
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
