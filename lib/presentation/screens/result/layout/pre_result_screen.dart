import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class PreResultScreen extends StatefulWidget {
  const PreResultScreen({Key? key}) : super(key: key);

  @override
  State<PreResultScreen> createState() => _PreResultScreenState();
}

class _PreResultScreenState extends State<PreResultScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        child: Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.transparent,
              appBar: SFAppBar(
                context: context,
                title: LocaleKeys.result,
                textStyle: TextStyles.bold18LightWhite,
              ),
              body: SafeArea(
                top: false,
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: const [
                        SizedBox(
                          height: 20,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.sleep, value: '100'),
                        SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.item, value: '30'),
                        SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(label: LocaleKeys.bonus, value: '10'),
                        SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.insurance, value: '5%'),
                        SizedBox(
                          height: 8,
                        ),
                        Divider(color: AppColors.white,),
                        SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.earning, value: '135 SLFT'),
                        SizedBox(height: 32,),

                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Material(
                color: AppColors.dark,
                child: SafeArea(
                  top: false,
                  child: Container(
                    padding: const EdgeInsets.only(
                        bottom: 20, left: 16, right: 16, top: 12),
                    child: SFButton(
                      text: LocaleKeys.next,
                      textStyle: TextStyles.white16,
                      gradient: AppColors.gradientBlueButton,
                      width: double.infinity,
                      height: 48,
                      onPressed: () {
                        Navigator.pushNamed(context, R.result);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
