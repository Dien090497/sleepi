import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/presentation/screens/result/layout/pre_result_screen.dart';
import 'package:slee_fi/presentation/screens/tracking/widgets/analog_clock.dart';
import 'package:slee_fi/resources/resources.dart';

class TrackingParams {
  int timeStart;
  int timeWakeUp;
  double tokenEarn;
  String fromRoute;

  TrackingParams(
      {required this.timeStart,
      required this.timeWakeUp,
      required this.tokenEarn,
      required this.fromRoute});
}

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late Timer timer;
  late String timeAlarm = '';
  late double totalEarn = 0;
  late int time = 0;
  late double earn = 0.toDouble();
  late String fromRoute = R.bottomNavigation;

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      final args = ModalRoute.of(context)?.settings.arguments as TrackingParams;
      totalEarn = args.tokenEarn;
      DateTime wakeUp = DateTime.fromMillisecondsSinceEpoch(args.timeWakeUp);
      DateTime timStart = DateTime.fromMillisecondsSinceEpoch(args.timeStart);
      time = wakeUp.difference(timStart).inMinutes;

      earn =
          (DateTime.now().difference(timStart).inMinutes) * (totalEarn / time);
      timeAlarm =
          '${wakeUp.hour < 10 ? '0${wakeUp.hour}' : wakeUp.hour}:${wakeUp.minute < 10 ? '0${wakeUp.minute}' : wakeUp.minute}';
      fromRoute = args.fromRoute;
      double x = totalEarn / time;
      timer = Timer.periodic(
        const Duration(seconds: 60),
        (Timer timer) async {
          if (earn < totalEarn && x > 0) {
            earn += x;
            setState(() {});
          } else {
            timer.cancel();
          }
        },
      );
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (fromRoute == R.splash) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            R.bottomNavigation,
            (r) => false,
          );
        }
        return true;
      },
      child: BlocProvider(
        create: (context) => TrackingCubit(),
        child: BlocConsumer<TrackingCubit, TrackingState>(
          listener: (context, state) {
            if (state is TrackingStatePosted) {
              Navigator.pushReplacementNamed(context, R.preResult,
                  arguments: PreResultParams(
                      fromRoute: fromRoute, resultModel: state.resultModel));
            }
            if (state is TrackingStateFail) {
              showMessageDialog(context, state.msg);
            }
          },
          builder: (context, state) {
            final cubit = context.read<TrackingCubit>();

            return FocusDetector(
                onFocusGained: () {},
                onFocusLost: () {
                  timer.cancel();
                },
                child: Stack(
                  children: [
                    BackgroundWidget(
                      appBar: SFAppBar(
                        context: context,
                        title: LocaleKeys.tracking,
                        textStyle: TextStyles.bold18LightWhite,
                        onBack: () {
                          if (fromRoute == R.splash) {
                            Navigator.pushNamedAndRemoveUntil(
                                context, R.bottomNavigation, (r) => false);
                          } else {
                            Navigator.pop(context);
                          }
                        },
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  width: 318,
                                  height: 318,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage(Imgs.borderClock),
                                  )),
                                ),
                                Container(
                                  width: 190,
                                  height: 190,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: AppColors.white.withOpacity(0.07),
                                  ),
                                ),
                                const SizedBox(
                                  width: 230,
                                  height: 230,
                                  child: AnalogClock(
                                    isLive: true,
                                    hourHandColor: Colors.white,
                                    minuteHandColor: Colors.white,
                                    showSecondHand: true,
                                    secondHandColor: AppColors.blue,
                                    numberColor: AppColors.lightWhite,
                                    showNumbers: true,
                                    textScaleFactor: 1.2,
                                    showTicks: true,
                                    tickColor: AppColors.tick,
                                    showDigitalClock: false,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            Column(
                              children: [
                                SFText(
                                  keyText: LocaleKeys.amount_earned,
                                  style: TextStyles.w400lightGrey14,
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const SFIcon(
                                      Ics.icSlft,
                                      width: 40,
                                    ),
                                    const SizedBox(
                                      width: 8,
                                    ),
                                    SFText(
                                      keyText:
                                          "${earn.formatBalanceTokenHeader} SLFT",
                                      style: TextStyles.bold30White,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 24,
                            ),
                            SFLabelValue(
                              label: LocaleKeys.alarm,
                              value: timeAlarm,
                              styleLabel: TextStyles.lightWhite16,
                              styleValue: TextStyles.lightWhite16,
                            ),
                            const Spacer(),
                            SFButton(
                              text: LocaleKeys.wake_up,
                              width: double.infinity,
                              color: AppColors.blue,
                              textStyle: TextStyles.w600WhiteSize16,
                              onPressed: () {
                                cubit.fetchData();
                              },
                            ),
                            const SizedBox(height: 26),
                          ],
                        ),
                      ),
                    ),
                    if (state is TrackingStateLoading) const LoadingScreen(),
                  ],
                ));
          },
        ),
      ),
    );
  }
}
