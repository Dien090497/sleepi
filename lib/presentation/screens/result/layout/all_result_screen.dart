import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
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
import 'package:slee_fi/models/gacha_spin_response/gacha_spin_response.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class GachaAllResultBedArguments {
  final GachaSpinResponse? gachaSpinInfo;
  final List<String> images;

  GachaAllResultBedArguments({this.gachaSpinInfo, required this.images});
}

class AllResultScreen extends StatelessWidget {
  const AllResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as GachaAllResultBedArguments?;
    GachaAttributesItem? attributesItem;
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.all_result,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Padding(
                padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.06),
                child: Row(
                  children: [
                    Expanded(
                      child:ListView.builder(
                          itemCount: 3,
                          padding: const EdgeInsets.only(top: 50),
                          itemBuilder: (BuildContext context,int index){
                            bool isSlft = (args?.gachaSpinInfo!.gift.elementAt(index)['type'] == "SLFT");
                            return SFCard(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(6),
                              radius: 8,
                              border: Border.all(color: AppColors.white.withOpacity(0.1)),
                              child: isSlft
                                  ?
                              Column(
                                children:  [
                                  const SFIcon(Ics.icSlft, width: 60, height: 60,),
                                  const SizedBox(height: 12,),
                                  SFText(keyText: "${args?.gachaSpinInfo!.gift.elementAt(index)['amount'] ?? ''}", style: TextStyles.bold18White,)
                                ],
                              )
                                  :
                              SFIcon(args?.gachaSpinInfo!.gift.elementAt(index)['image']),
                              onTap: () {
                                if(isSlft){
                                  null;
                                }else {
                                  attributesItem = GachaAttributesItem.fromJson(args?.gachaSpinInfo!.gift.elementAt(index) as Map<String, dynamic>);
                                  Navigator.pushNamed(context, R.allResultDetail,
                                      arguments:  AllResultDetailArguments(
                                          image: attributesItem != null ? attributesItem!.image : "",
                                          attributesItem: attributesItem
                                      )
                                  );
                                }

                              }
                            );
                          }
                      ),
                    ),
                    Expanded(
                      child:ListView.builder(
                          itemCount: 4,
                          itemBuilder: (BuildContext context,int index){
                            int at = 3;
                            bool isSlft = (args?.gachaSpinInfo!.gift.elementAt(index + at)['type'] == "SLFT");
                            return SFCard(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(6),
                                radius: 8,
                                border: Border.all(color: AppColors.white.withOpacity(0.1)),
                                child: isSlft
                                    ?
                                Column(
                                  children:  [
                                    const SFIcon(Ics.icSlft, width: 60, height: 60,),
                                    const SizedBox(height: 12,),
                                    SFText(keyText: "${args?.gachaSpinInfo!.gift.elementAt(index + at)['amount'] ?? ''}", style: TextStyles.bold18White,)
                                  ],
                                )
                                    :
                                SFIcon(args?.gachaSpinInfo!.gift.elementAt(index + at)['image']),
                                onTap: () {
                                  if(isSlft){
                                  null;
                                  }else{
                                    attributesItem = GachaAttributesItem.fromJson(args?.gachaSpinInfo!.gift.elementAt(index + at) as Map<String, dynamic>);
                                    Navigator.pushNamed(context, R.allResultDetail,
                                        arguments:  AllResultDetailArguments(
                                            image: attributesItem != null ? attributesItem!.image : "",
                                            attributesItem: attributesItem
                                        )
                                    );
                                  }

                                }
                            );
                          }
                      ),
                    ),
                    Expanded(
                        child:ListView.builder(
                            itemCount: 3,
                            padding: const EdgeInsets.only(top: 50),
                            itemBuilder: (BuildContext context,int index){
                              int at = 7;
                              bool isSlft = (args?.gachaSpinInfo!.gift.elementAt(index + at)['type'] == "SLFT");

                              return SFCard(
                                  width: 100,
                                  height: 100,
                                  margin: const EdgeInsets.all(6),
                                  radius: 8,
                                  border: Border.all(color: AppColors.white.withOpacity(0.1)),
                                  child: isSlft
                                      ?
                                    Column(
                                      children:  [
                                        const SFIcon(Ics.icSlft, width: 60, height: 60,),
                                        const SizedBox(height: 12,),
                                        SFText(keyText: "${args?.gachaSpinInfo!.gift.elementAt(index + at)['amount'] ?? ''}", style: TextStyles.bold18White,)
                                      ],
                                    )
                                  :
                                  SFIcon(args?.gachaSpinInfo!.gift.elementAt(index + at)['image']),
                                  onTap: () {
                                    if(isSlft){
                                      null;
                                    }else {
                                      attributesItem = GachaAttributesItem.fromJson(args?.gachaSpinInfo!.gift.elementAt(index + at) as Map<String, dynamic>);
                                      Navigator.pushNamed(context, R.allResultDetail,
                                          arguments:  AllResultDetailArguments(
                                              image: attributesItem != null ? attributesItem!.image : "",
                                              attributesItem: attributesItem
                                          )
                                      );
                                    }

                                  }
                              );
                            }
                        ),
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: SFButtonOutLined(
                  title: LocaleKeys.return_,
                  fixedSize: const Size(double.infinity, 48),
                  textStyle: TextStyles.blue16,
                  borderColor: AppColors.blue,
                  onPressed: () => Navigator.pop(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
