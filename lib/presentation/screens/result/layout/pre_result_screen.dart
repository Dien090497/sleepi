import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/tracking_result_chart/tracking_result_model.dart';

class PreResultParams {
  String fromRoute;
  TrackingResultModel resultModel;

  PreResultParams({required this.fromRoute, required this.resultModel});
}

class PreResultScreen extends StatefulWidget {
  const PreResultScreen({Key? key}) : super(key: key);

  @override
  State<PreResultScreen> createState() => _PreResultScreenState();
}

class _PreResultScreenState extends State<PreResultScreen> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PreResultParams;
    final TrackingResultModel resultModel = args.resultModel;
    return WillPopScope(
      onWillPop: () async {
        if (args.fromRoute == R.splash) {
          Navigator.pushNamedAndRemoveUntil(
              context, R.bottomNavigation, (r) => false);
        }
        return true;
      },
      child: BackgroundWidget(
          child: Stack(
        children: [
          Scaffold(
            backgroundColor: AppColors.transparent,
            appBar: SFAppBar(
                context: context,
                title: LocaleKeys.result,
                textStyle: TextStyles.bold18LightWhite,
                onBack: () {
                  if (args.fromRoute == R.splash) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, R.bottomNavigation, (r) => false);
                  } else {
                    Navigator.pop(context);
                  }
                }),
            body: SafeArea(
              top: false,
              child: SingleChildScrollView(
                physics: const ScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 20,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.sleep_score,
                          value: '${resultModel.sleepQuality}'),
                      const SizedBox(
                        height: 8,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.base_point,
                          value: '${resultModel.basePointEff}'),
                      const SizedBox(
                        height: 8,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.holding_bonus,
                          value: '${resultModel.bedNFTHoldingBonus}'),
                      const SizedBox(
                        height: 8,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.stacking_bonus,
                          value: '${resultModel.stakingBonus}'),
                      const SizedBox(
                        height: 8,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.insurance,
                          value: '${resultModel.insurance}%'),
                      const SizedBox(
                        height: 8,
                      ),
                      const Divider(
                        color: AppColors.white,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      SFLabelValue(
                          label: LocaleKeys.earning,
                          value:
                              '${double.parse(resultModel.actualEarn!).formatBalance2Digits} SLFT'),
                      const SizedBox(
                        height: 32,
                      ),
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
                      Navigator.pushNamed(context, R.result,
                          arguments: PreResultParams(
                            fromRoute: args.fromRoute,
                            resultModel: args.resultModel,
                          ));
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
