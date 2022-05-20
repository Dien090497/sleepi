import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_multi_chain_switch.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_pop_up_language.dart';

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
              onTap: () => Navigator.pushNamed(context, R.permission),
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
              title: SFText(keyText: Keys.activationCode,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
              onTap: () => Navigator.pushNamed(context, R.activationCode),
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
              title: SFText(keyText: Keys.language,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => const ModalPopUpLanguage()
                );
              },
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
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => const ModalMultiChainSwitch()
                );
              },
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
              trailing: SFText(keyText: "0.01", style: TextStyles.black15Italic),
            ),
          ),
        ],
      ),
    );
  }
}
