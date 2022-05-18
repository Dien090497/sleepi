import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

import '../../../../common/routes/app_routes.dart';
import '../../../../common/style/app_colors.dart';
import '../../../../common/style/text_styles.dart';
import '../../../../di/translations/keys.dart';

class GeneralWidget extends StatelessWidget {
  const GeneralWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(keyText: Keys.general,style: TextStyles.bold24black,),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              dense: true,
              title: SFText(keyText: Keys.permissions,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              dense: true,
              title: SFText(keyText: Keys.alarm,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
              onTap: () => Navigator.pushNamed(context, R.alarm),
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              dense: true,
              title: SFText(keyText: Keys.activationCodeLanguageLowercase,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              dense: true,
              title: SFText(keyText: Keys.multiChainSwitch,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              dense: true,
              title: SFText(keyText: Keys.version,
                style: TextStyles.bold15black,
              ),
              trailing: SFText(keyText: "0.01", style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic),),
            ),
          ),
        ],
      ),
    );
  }
}
