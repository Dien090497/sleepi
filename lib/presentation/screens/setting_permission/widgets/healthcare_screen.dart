import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class HealthcarePermissionScreen extends StatelessWidget {
  const HealthcarePermissionScreen({Key? key}) : super(key: key);

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
                  child: Image.asset(Imgs.healthcare, fit: BoxFit.fill)),
              const SizedBox(
                height: 24.0,
              ),
              SFText(
                keyText: LocaleKeys.allow_to_access_healthcare_data,
                style: TextStyles.bold24LightWhite,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 32.0,
              ),
              SFText(
                keyText: LocaleKeys.to_allow_access_to_healthcare_data,
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
                color: AppColors.blue,
                text: LocaleKeys.allow,
                textStyle: TextStyles.w600WhiteSize16,
                onPressed: () =>
                    Navigator.pushNamed(context, R.motionDataPermission),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
