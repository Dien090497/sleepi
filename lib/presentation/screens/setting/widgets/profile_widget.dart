import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/modal_pop_up_sex.dart';

import 'modal_pop_up_birth_year.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const icon = Icon(Icons.chevron_right, color: AppColors.lightGrey,);
    Divider divider = Divider(color: AppColors.lightWhite.withOpacity(0.05), height: 1,);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        SFText(keyText: Keys.profile,style: TextStyles.lightGrey14,),
      const SizedBox(height: 12.0,),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            color: AppColors.white.withOpacity(0.05)
        ),
          child: Column(
            children: [
              SFListTile(
                text: Keys.birthYear,
                trailing:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SFText(
                      keyText: "1998",
                      style: TextStyles.lightWhite14,
                    ),
                    icon,
                  ],
                ),
                onPressed: () => SFModalBottomSheet.show(context, 0.36, const ModalPopUpBirthYear()),
              ),
              divider,
              SFListTile(
                text: Keys.sex,
                trailing:  Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SFText(
                      keyText: "Male",
                      style: TextStyles.lightWhite14,
                    ),
                    icon,
                  ],
                ),
                onPressed: () => SFModalBottomSheet.show(context, 0.36, const ModalPopUpSex())
              ),
              divider,
              SFListTile(
                text: Keys.email,
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SFText(
                      keyText: "sample@aaa.com",
                      style: TextStyles.lightWhite14,
                    ),
                   icon,
                  ],
                ),
                onPressed:  () => Navigator.pushNamed(context, R.email),
              ),
              divider,
              SFListTile(
                text: Keys.changePassword,
                trailing: icon,
                onPressed: () => Navigator.pushNamed(context, R.changePassword),
              ),
            ],
          )
      ),

          const SizedBox(
            height: 20.0,
          ),
          const Center(
              child: SFButton(
            text: Keys.logout,
            textStyle: TextStyles.bold24Blue,
            color: AppColors.greyBottomNavBar,
            width: 200,
            height: 45,
          )),
          const SizedBox(
            height: 20.0,
          ),
        ],
      ),
    );
  }
}
