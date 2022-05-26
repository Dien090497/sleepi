import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class MicPermissionScreen extends StatelessWidget {
  const MicPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  Padding(padding: const EdgeInsets.symmetric(horizontal: 65), child: Image.asset(Imgs.mic,fit: BoxFit.fill)),
                  const SizedBox(height: 24.0,),
                  SFText(keyText: Keys.micPermission, style: TextStyles.bold24LightWhite, textAlign: TextAlign.center,),
                  const SizedBox(height: 32.0,),
                  SFText(keyText: Keys.displaysMessageMicPermission, style: TextStyles.lightGrey16,),
                  const SizedBox(height: 16.0,),
                  SFText(keyText: Keys.displaysMessageMicPermission1, style: TextStyles.lightGrey16,),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                  // SFButton(height: 48,text: Keys.setupMicrophoneAccess,onPressed: () => Navigator.pushNamed(context, R.healthcarePermission),)
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child:  Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SFButton(height: 48, width: double.infinity, color: AppColors.blue, text: Keys.setupMicrophoneAccess, textStyle: TextStyles.w600WhiteSize16, onPressed: () => Navigator.pushNamed(context, R.healthcarePermission),),

          child: Stack(children: [
            ListView(
              padding: const EdgeInsets.all(24.0),
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 65),
                    child:
                        Image.asset("assets/images/mic.png", fit: BoxFit.fill)),
                const SizedBox(
                  height: 24.0,
                ),
                SFText(
                  keyText: Keys.micPermission,
                  style: TextStyles.bold24LightWhite,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 32.0,
                ),
                SFText(
                  keyText: Keys.displaysMessageMicPermission,
                  style: TextStyles.lightGrey16,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                SFText(
                  keyText: Keys.displaysMessageMicPermission1,
                  style: TextStyles.lightGrey16,
                ),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                // SFButton(height: 48,text: Keys.setupMicrophoneAccess,onPressed: () => Navigator.pushNamed(context, R.healthcarePermission),)
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SFButton(
                  height: 48,
                  width: double.infinity,
                  text: Keys.setupMicrophoneAccess,
                  onPressed: () =>
                      Navigator.pushNamed(context, R.healthcarePermission),
                ),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
