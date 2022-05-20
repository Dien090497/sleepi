import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';


class AverageInfoWidget extends StatelessWidget {
  const AverageInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      // height: 164,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.black, width: 1),
          color: AppColors.greyBottomNavBar
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SFText(keyText: Keys.averageOfBedTime, style: TextStyles.bold15black,),
                    const SizedBox(height: 9.0,),
                    SFText(keyText: "10:55",style: TextStyles.bold20black, textAlign: TextAlign.center,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SFText(keyText: Keys.averageOfWokeUp, style: TextStyles.bold15black,),
                    const SizedBox(height: 9.0,),
                    SFText(keyText: "9:30",style: TextStyles.bold20black, textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 9.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Column(
                  children: [
                    SFText(keyText: Keys.averageOfSleepDuration, style: TextStyles.bold15black,),
                    const SizedBox(height: 9.0,),
                    SFText(keyText: "07:32",style: TextStyles.bold20black, textAlign: TextAlign.center,)
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    SFText(keyText: Keys.averageOfSleepQuolity, style: TextStyles.bold15black,),
                    const SizedBox(height: 9.0,),
                    SFText(keyText: "87/100",style: TextStyles.bold20black, textAlign: TextAlign.center,)
                  ],
                ),
              )
            ],
          )
        ],
      ),
    )
    ;
  }
}
