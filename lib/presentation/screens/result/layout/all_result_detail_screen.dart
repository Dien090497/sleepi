import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/gacha_spin_response/gacha_attributes_item.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/attributes_widget.dart';
import 'package:slee_fi/resources/resources.dart';

class AllResultDetailArguments {
  final String image;
  final GachaAttributesItem? attributesItem;

  AllResultDetailArguments({required this.image, required this.attributesItem});
}

class AllResultDetailScreen extends StatelessWidget {
  const AllResultDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as AllResultDetailArguments?;
    String? type;
    String? nftName;
    if(args?.attributesItem?.nftType == 'item'){
      type = args?.attributesItem?.itemType;
      nftName = LocaleKeys.item.tr();
    }else if (args?.attributesItem?.nftType == 'jewel'){
      type = args?.attributesItem?.jewelType;
      nftName = LocaleKeys.jewel.tr();
    }else {
      type = args?.attributesItem?.quality;
    }
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.all_result,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
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
                                    color: AppColors.purple.withOpacity(0.02),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: const Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(20)),
                            width: 180,
                            height: 180,
                            child: SizedBox(
                              child: args != null
                                  ? SFIcon(args.image)
                                  : const SizedBox(),
                            ),
                          ),
                         nftName != null ?  Padding(
                            padding: const EdgeInsets.only(top: 12),
                            child: SFText(
                              keyText:
                              '${type?.tr()} $nftName (Lv.${args?.attributesItem?.level})',
                              style: TextStyles.white1w700size16,
                            ),
                          ) : const SizedBox(),
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
                                    keyText: type ?? '',
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
                                    keyText: args?.attributesItem?.name ?? '',
                                    style: TextStyles.lightWhite14,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 28),
                          SFText(
                            keyText: LocaleKeys.attributes,
                            style: TextStyles.boldWhite18,
                          ),
                          const SizedBox(height: 13),
                          Column(
                            children:  [
                              args?.attributesItem?.nftType == 'item' || args?.attributesItem?.nftType == 'jewel' ? SFCard(
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
                                        '+ ${LocaleKeys.base.tr()} ${type!.reCase(StringCase.titleCase)}',
                                        style: TextStyles.blue16,
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ],
                                ),
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
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
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
                      title: LocaleKeys.return_,
                      fixedSize: const Size(double.infinity, 48),
                      textStyle: TextStyles.blue16,
                      borderColor: AppColors.blue,
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
