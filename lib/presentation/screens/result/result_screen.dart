import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:lottie/lottie.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

import 'layout/pre_result_screen.dart';
import 'widgets/category_header.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration.zero, () {
    //   final args =
    //       ModalRoute.of(context)?.settings.arguments as PreResultParams;
    //   if (double.parse(args.slftPrice!).toInt() == 0) {
    //     showMessageDialog(
    //       context,
    //       LocaleKeys.sleep_time_too_short,
    //     );
    //   }
    // });
    animationController = AnimationController(vsync: this);
    animationController.addStatusListener((status) async {
      if (animationController.isCompleted) {
        Navigator.pop(context, true);
        // animationController.reset();
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // put your logic from initState here
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  convertTime(String time) {
    int minuteDuration = double.parse(time).toInt();
    int hour = minuteDuration ~/ 60;
    int minute = minuteDuration - hour * 60;
    return '${hour}h${minute}min';
  }

  void showBedBroken(BuildContext context, bool isBroken) {
    if (isBroken && mounted) {
      showCustomDialog(
        context,
        padding: const EdgeInsets.all(24),
        backgroundColor: AppColors.transparent,
        children: [
          Lottie.asset(
            Const.bedBrokenAnimation,
            controller: animationController,
            fit: BoxFit.cover,
            repeat: true,
            onLoaded: (composition) {
              // Configure the AnimationController with the duration of the
              // Lottie file and start the animation.
              animationController
                ..duration = composition.duration
                ..forward();
            },
          ),
        ],
      );
    }
  }

  convertTimeSpan(String timeSpan) {
    if (timeSpan == '0') {
      return '0';
    } else {
      int time = int.parse(timeSpan);
      DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(time * 1000);
      int hour = dateTime.hour;
      int minute = dateTime.minute;
      return '${hour < 10 ? '0$hour' : hour}:${minute < 10 ? '0$minute' : minute}';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as PreResultParams;
    Future.delayed(Duration.zero,
        () => showBedBroken(context, args.resultModel.isBrokenBed));
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
                  disableLeading: true,
                  title: LocaleKeys.result,
                  centerTitle: true,
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
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        CategoryHeader(
                          slftPrice: args.slftPrice,
                          earning:
                              double.parse(args.resultModel.actualEarn ?? '0')
                                  .formatBalance2Digits,
                          score: args.resultModel.sleepQuality ?? 0,
                          sleepDuration: convertTime(
                              args.resultModel.sleepDurationTime ?? '0'),
                          imageBed: args.imageBed,
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: SFIcon(Ics.commingSoon),
                        ),
                        /*Platform.isAndroid
                            ? ((args.dataChart.isNotEmpty &&
                                    args.dataChart.first.maxX != -1)
                                ? ChartStatisticShare(
                                    maxValue: 360,
                                    data: args.dataChart.first,
                                    typeTimeChart: TypeTimeChart.chartDay,
                                  )
                                : const SizedBox())
                            : const Padding(
                                padding: EdgeInsets.only(bottom: 10),
                                child: SFIcon(Ics.commingSoon),
                              ),*/
                        const SizedBox(
                          height: 24,
                        ),
                        SFLabelValue(
                          label: LocaleKeys.bed_time,
                          value:
                              convertTimeSpan(args.resultModel.bedTime ?? '0'),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.sleep_onset_time,
                            value: convertTimeSpan(
                                args.resultModel.sleepOnsetTime ?? '0')),
                        const SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.woke_up,
                            value: convertTimeSpan(
                                args.resultModel.wokeUpTime ?? '0')),
                        const SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.nocturnal_awakenings,
                            value: '${args.resultModel.nAwk}'),
                        const SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.sleep_duration,
                            value: convertTime(
                                args.resultModel.sleepDurationTime ?? '0')),
                        const SizedBox(
                          height: 8,
                        ),
                        SFLabelValue(
                            label: LocaleKeys.sleep_quality,
                            value: '${args.resultModel.sleepQuality}/100'),
                        const SizedBox(
                          height: 32,
                        ),
                        SFButton(
                          text: LocaleKeys.return_to_home,
                          textStyle: TextStyles.w600WhiteSize16,
                          gradient: AppColors.gradientBlueButton,
                          width: double.infinity,
                          onPressed: () {
                            if (args.fromRoute == R.splash) {
                              Navigator.pushNamedAndRemoveUntil(
                                  context, R.bottomNavigation, (r) => false);
                            } else {
                              Navigator.popUntil(context,
                                  (r) => r.settings.name == R.bottomNavigation);
                            }
                          },
                        ),
                        const SizedBox(
                          height: 100,
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
                      text: LocaleKeys.share_your_sleep,
                      textStyle: TextStyles.white16,
                      gradient: AppColors.gradientBlueButton,
                      width: double.infinity,
                      height: 48,
                      onPressed: () async {
                        await [
                          Permission.storage,
                        ].request();
                        Navigator.pushNamed(context, R.share, arguments: args);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
