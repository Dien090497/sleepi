import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_pop_up_sex.dart';

import '../../../../common/style/app_colors.dart';
import '../../../../common/style/text_styles.dart';
import '../../../../common/widgets/sf_buttons.dart';
import '../../../../common/widgets/sf_text.dart';
import '../../../../di/translations/keys.dart';
import 'modal_pop_up_birth_year.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SFText(keyText: Keys.profile,style: TextStyles.bold24black,),
          Container(
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                border: Border.all(color: AppColors.black, width: 1),
                color: AppColors.greyBottomNavBar
            ),
            child: ListTile(
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => const ModalPopUpBirthYear()
                );
              },
              dense: true,
              title: SFText(keyText: Keys.birthYear,
                style: TextStyles.bold15black,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SFText(keyText: "1998", style: TextStyles.bold15black,),
                  const Icon(Icons.chevron_right, size: 32,),
                ],
              ),
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
              onTap: () {
                showCupertinoModalPopup(
                    context: context,
                    builder: (_) => const ModalPopUpSex()
                );
              },
              dense: true,
              title: SFText(keyText: Keys.sex,
                style: TextStyles.bold15black,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SFText(keyText: "Male", style: TextStyles.bold15black,),
                  const Icon(Icons.chevron_right, size: 32,),
                ],
              ),
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
              title: SFText(keyText: Keys.email,
                style: TextStyles.bold15black,
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SFText(keyText: "sample@aaa.com", style: TextStyles.bold15black,),
                  const Icon(Icons.chevron_right, size: 32,),
                ],
              ),
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
              title: SFText(keyText: Keys.password,
                style: TextStyles.bold15black,
              ),
              trailing: const Icon(Icons.chevron_right, size: 32,),
            ),
          ),
          const SizedBox(height: 20.0,),
          const Center(child: SFButton(text: Keys.logout, textStyle: TextStyles.bold20black, color: AppColors.greyBottomNavBar, width: 200, height: 45,)),
          const SizedBox(height: 20.0,),
        ],
      ),
    );
  }
}
