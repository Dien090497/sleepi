import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class MotionDataPermissionScreen extends StatelessWidget {
  const MotionDataPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BackgroundWidget(
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          body: Stack(children: [
            ListView(padding: const EdgeInsets.all(24.0), children: [
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
                    keyText: Keys.motionDataPermission,
                    style: TextStyles.bold24LightWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SFText(
                    keyText: Keys.displaysMessageMotionDataPermission,
                    style: TextStyles.lightGrey16,
                  ),
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SFButton(
                    height: 48,
                    width: double.infinity,
                    text: Keys.allow,
                    textStyle: TextStyles.w600WhiteSize16,
                    color: AppColors.blue,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.notificationPermission),
                  ),
                ),
              )
            ]),
          ]),
        ),
      ),
    );
  }
}