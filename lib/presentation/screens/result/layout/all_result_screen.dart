import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/result/layout/all_result_detail_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class AllResultScreen extends StatelessWidget {
  const AllResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> beds1 = [Ics.flexibleBed, Ics.middleBed, Ics.longBed];
    List<String> beds2 = [Ics.longBed, Ics.middleBed,Ics.flexibleBed, Ics.longBed];
    List<String> beds3 = [Ics.middleBed,Ics.shortBed,  Ics.longBed];
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
                          itemCount: beds1.length,
                          padding: const EdgeInsets.only(top: 50),
                          itemBuilder: (BuildContext context,int index){
                            return SFCard(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(6),
                              radius: 8,
                              border: Border.all(color: AppColors.white.withOpacity(0.1)),
                              child: SFIcon(beds1[index]),
                              onTap: () => Navigator.pushNamed(context, R.allResultDetail, arguments:  AllResultDetailArguments(beds1[index])),
                            );
                          }
                      ),
                    ),
                    Expanded(
                      child:ListView.builder(
                          itemCount: beds2.length,
                          itemBuilder: (BuildContext context,int index){
                            return SFCard(
                              width: 100,
                              height: 100,
                              margin: const EdgeInsets.all(6),
                              radius: 8,
                              border: Border.all(color: AppColors.white.withOpacity(0.1)),
                              child: SFIcon(beds2[index]),
                              onTap: () => Navigator.pushNamed(context, R.allResultDetail,arguments:  AllResultDetailArguments(beds2[index])),
                            );
                          }
                      ),
                    ),
                    Expanded(
                        child:ListView.builder(
                            itemCount: beds3.length,
                            padding: const EdgeInsets.only(top: 50),
                            itemBuilder: (BuildContext context,int index){
                              return SFCard(
                                width: 100,
                                height: 100,
                                margin: const EdgeInsets.all(6),
                                radius: 8,
                                border: Border.all(color: AppColors.white.withOpacity(0.1)),
                                child: SFIcon(beds3[index]),
                                onTap: () => Navigator.pushNamed(context, R.allResultDetail, arguments:  AllResultDetailArguments(beds3[index])),
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
