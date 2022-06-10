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

class MicPermissionScreen extends StatelessWidget {
  const MicPermissionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: SafeArea(
            child: Stack(children: [
              ListView(
                padding: const EdgeInsets.all(24.0),
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 65),
                      child: Image.asset(Imgs.mic, fit: BoxFit.fill)),
                  const SizedBox(
                    height: 24.0,
                  ),
                  SFText(
                    keyText: LocaleKeys.allow_to_record_sleep_sounds,
                    style: TextStyles.bold24LightWhite,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 32.0,
                  ),
                  SFText(
                    keyText: LocaleKeys.to_track_ambient_noise_levels_and_sounds,
                    style: TextStyles.lightGrey16,
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  SFText(
                    keyText: "1.${LocaleKeys.microphone_records_only_when_tracking.tr()}",
                    style: TextStyles.lightGrey16,
                  ),
                  SFText(
                    keyText: "2.${LocaleKeys.recorded_audio.tr()}",
                    style: TextStyles.lightGrey16,
                  ),
                  // SizedBox(height: MediaQuery.of(context).size.height * 0.2,),
                  // SFButton(height: 48,text: Keys.setupMicrophoneAccess,onPressed: () => Navigator.pushNamed(context, R.healthcarePermission),)
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 50),
                  child: SFButton(
                    height: 48,
                    width: double.infinity,
                    color: AppColors.blue,
                    text: LocaleKeys.setup_microphone_access,
                    textStyle: TextStyles.w600WhiteSize16,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.healthcarePermission),
                  ),
                ),
              ),
            ])));
  }
}
