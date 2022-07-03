import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/setting/widgets/gender_tile.dart';
import 'package:slee_fi/usecase/logout_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

import 'modal_pop_up_birth_year.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const icon = Icon(Icons.chevron_right, color: AppColors.lightGrey);
    Divider divider = Divider(
      color: AppColors.lightWhite.withOpacity(0.05),
      height: 1,
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SFText(
          keyText: LocaleKeys.profile,
          style: TextStyles.lightGrey14,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const SettingBirthYear(),
              divider,
              const GenderTile(),
              divider,
              SFListTile(
                text: LocaleKeys.email.tr(),
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
                onPressed: () => Navigator.pushNamed(context, R.email),
              ),
              divider,
              SFListTile(
                text: LocaleKeys.password,
                trailing: icon,
                onPressed: () => Navigator.pushNamed(context, R.changePassword),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
        SizedBox(
          height: 48,
          child: SFButtonOutLined(
            title: LocaleKeys.logout,
            textStyle: TextStyles.bold16Blue,
            borderColor: AppColors.blue,
            onPressed: () {
              getIt<LogOutUseCase>().call(NoParams());
              Navigator.pushNamedAndRemoveUntil(
                  context, R.loginSignUp, (r) => false);
            },
          ),
        ),
        const SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
