import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class MotionDataPermissionScreen extends StatelessWidget {
  const MotionDataPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWidget(
        child: Stack(children: [
          ListView(
            padding: const EdgeInsets.all(24.0),
            children: [
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 65),
                  child: Image.asset(Imgs.motionData, fit: BoxFit.fill)),
              const SizedBox(
                height: 24.0,
              ),
              SFText(
                keyText: LocaleKeys.allow_to_access_motion_data,
                style: TextStyles.bold24LightWhite,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              SFText(
                keyText: "1.${LocaleKeys.to_allow_access_to_motion_data_is_inportant.tr()}",
                style: TextStyles.lightGrey16,
              ),
              SFText(
                keyText: "2.${LocaleKeys.the_data_would_acquire_will_only.tr()}",
                style: TextStyles.lightGrey16,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
              child: SFButton(
                height: 48,
                width: double.infinity,
                text: LocaleKeys.allow,
                textStyle: TextStyles.w600WhiteSize16,
                color: AppColors.blue,
                onPressed: () =>
                    Navigator.pushNamed(context, R.notificationPermission),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
