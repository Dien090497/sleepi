import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:just_audio/just_audio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/presentation/screens/result/layout/pre_result_screen.dart';
import 'package:slee_fi/presentation/screens/tracking/widgets/analog_clock.dart';
import 'package:slee_fi/resources/resources.dart';

import '../../../common/const/const.dart';

class TrackingParams {
  final String fromRoute;
  final int timeStart;
  final int timeWakeUp;
  final double tokenEarn;
  final String? imageBed;
  final bool enableAlarm;

  TrackingParams({
    required this.fromRoute,
    required this.timeStart,
    required this.timeWakeUp,
    required this.tokenEarn,
    this.imageBed,
    required this.enableAlarm,
  });
}

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late Timer _timer;
  AudioPlayer audioPlayer = AudioPlayer();
  late String timeAlarm = '';
  late double totalEarn = 0;
  // late int time = 0;
  late double earn = 0.toDouble();
  late DateTime timeStart = DateTime.now();
  GlobalKey<AnalogClockState> globalKey = GlobalKey();

  @override
  void initState() {
    init();
    super.initState();
  }

  void init() {
    Future.delayed(Duration.zero, () async {
      final args = ModalRoute.of(context)?.settings.arguments as TrackingParams;
      totalEarn = args.tokenEarn;
      DateTime wakeUp = DateTime.fromMillisecondsSinceEpoch(args.timeWakeUp);
      timeStart = DateTime.fromMillisecondsSinceEpoch(args.timeStart);
      // time = wakeUp.difference(timeStart).inMinutes;
      // earn =
      //     (DateTime.now().difference(timeStart).inMinutes) * (totalEarn / time);
      timeAlarm =
          '${wakeUp.hour < 10 ? '0${wakeUp.hour}' : wakeUp.hour}:${wakeUp.minute < 10 ? '0${wakeUp.minute}' : wakeUp.minute}';
      // double x = totalEarn / time;
      _timer = Timer.periodic(
        const Duration(seconds: 5),
        (Timer timer) async {
          // print('DateTime : ${DateTime.now().toString()}');
          SharedPreferences preferences = await SharedPreferences.getInstance();
          final int sound = preferences.getInt(Const.sound) ?? 0;
          if(Platform.isAndroid) {
            if (DateTime.now().isAfter(wakeUp)) {
              if (!audioPlayer.playing) {
                await audioPlayer.setAsset(Const.soundAlarm[sound]).then((
                    value) async {
                  await audioPlayer.setVolume(1);
                  await audioPlayer.setLoopMode(LoopMode.all);
                  await audioPlayer.play();
                });
                _timer.cancel();
              }
            }
          }else{
            if (!audioPlayer.playing) {
              await audioPlayer.setAsset(Const.soundAlarm[sound]).then((
                  value) async {
                await audioPlayer.setVolume(0);
                await audioPlayer.setLoopMode(LoopMode.all);
                await audioPlayer.play();
              });
            }
            if (DateTime.now().isAfter(wakeUp)) {
              await audioPlayer.setVolume(1);
              _timer.cancel();
            }
          }
        },
      );
      setState(() {});
    });
  }

  @override
  void dispose() {
    audioPlayer.dispose();
    // _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments as TrackingParams;
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: BlocProvider(
        create: (context) => TrackingCubit(),
        child: BlocConsumer<TrackingCubit, TrackingState>(
          listener: (context, state) {
            if (state is TrackingStatePosted) {
              Navigator.pushReplacementNamed(context, R.result,
                  arguments: PreResultParams(
                    resultModel: state.resultModel,
                    dataChart: state.dataChart,
                    slftPrice: state.sfltPrice,
                    imageBed: args.imageBed,
                    fromRoute: args.fromRoute,
                  ));
            }
            if (state is TrackingStateFail) {
              showMessageDialog(context, state.msg);
            }
          },
          builder: (context, state) {
            final cubit = context.read<TrackingCubit>();

            return FocusDetector(
              onFocusGained: () async {
                globalKey.currentState?.updateDateTime();
                if (!_timer.isActive) {
                  init();
                }
              },
              onFocusLost: () {
                // _timer.cancel();
              },
              child: Stack(
                children: [
                  BackgroundWidget(
                    appBar: SFAppBar(
                      context: context,
                      title: LocaleKeys.tracking,
                      textStyle: TextStyles.bold18LightWhite,
                      disableLeading: true,
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
                              SizedBox(
                                width: 230,
                                height: 230,
                                child: AnalogClock(
                                  key: globalKey,
                                  isLive: true,
                                  hourHandColor: Colors.white,
                                  minuteHandColor: Colors.white,
                                  showSecondHand: true,
                                  useMilitaryTime: true,
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
                          // Column(
                          //   children: [
                          // SFText(
                          //   keyText: LocaleKeys.est_amount_earned,
                          //   style: TextStyles.w400lightGrey14,
                          // ),
                          // const SizedBox(height: 12),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     const SFIcon(Ics.icSlft, width: 40),
                          //     const SizedBox(width: 8),
                          //     SFText(
                          //       keyText:
                          //           "${earn.formatBalance2Digits} SLFT",
                          //       style: TextStyles.bold30White,
                          //     ),
                          //   ],
                          // )
                          //   ],
                          // ),
                          const SizedBox(height: 24),
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
                            onPressed: () async {
                              if (state is! TrackingStateLoading) {
                                if (audioPlayer.playing) {
                                  await audioPlayer.stop();
                                }
                                await cubit.fetchData(timeStart);
                              }
                            },
                          ),
                          const SizedBox(height: 26),
                        ],
                      ),
                    ),
                  ),
                  if (state is TrackingStateLoading) const LoadingScreen(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
