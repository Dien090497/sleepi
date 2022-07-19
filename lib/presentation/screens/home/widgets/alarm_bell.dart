import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/button_start.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/lucky_box.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_start_tracking.dart';
import 'package:slee_fi/presentation/screens/home/widgets/time_picker.dart';
import 'package:slee_fi/presentation/screens/tracking/tracking_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class AlarmBell extends StatelessWidget {
  const AlarmBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTimeUtil = getIt<DateTimeUtils>();
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is HomeLoaded && state.startTracking) {
          DateTime wakeUp = DateTime.now().add(Duration(minutes: state.time));
          Navigator.pushReplacementNamed(
            context,
            R.tracking,
            arguments: TrackingParams(
                timeStart: DateTime.now().millisecondsSinceEpoch,
                timeWakeUp: wakeUp.millisecondsSinceEpoch,
                tokenEarn: state.tokenEarn,
                fromRoute: R.bottomNavigation),
          );
        }
        if (state is HomeStartError) {
          showMessageDialog(context, state.message);
        }
      },
      builder: (context, state) {
        final bed = state is HomeLoaded ? state.selectedBed : null;
        final userStatusTracking =
            state is HomeLoaded ? state.userStatusTracking : null;
        final minTime = DateTime.now().add(Duration(
            minutes: bed == null
                ? 0
                : bed.startTime == null
                    ? 0
                    : (bed.startTime! * 60).toInt()));
        final maxTime = DateTime.now().add(Duration(
            minutes: bed == null
                ? 0
                : bed.endTime == null
                    ? 0
                    : (bed.endTime! * 60).toInt()));

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: const BoxDecoration(
            color: AppColors.dark,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TimePicker(
                onHourChange: (hour) {
                  context.read<HomeBloc>().add(ChangeHour(hour));
                },
                onMinuteChange: (minute) {
                  context.read<HomeBloc>().add(ChangeMinute(minute));
                },
              ),
              const SizedBox(height: 16),
              Text(
                '${LocaleKeys.range.tr()}: ${state is HomeLoaded && bed != null ? '${dateTimeUtil.HHmm(minTime)}-${dateTimeUtil.HHmm(maxTime)}' : '03:00-06:00'}',
                style: TextStyles.white16500,
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SFButtonOutLined(
                      title: LocaleKeys.alarm_bell,
                      onPressed: () {
                        Navigator.pushNamed(context, R.alarmSoundEffect);
                      },
                      fixedSize: const Size(274, 40),
                      textStyle: TextStyles.blue16,
                      borderColor: AppColors.blue,
                      iconColor: AppColors.blue,
                      withBorder: 1,
                    ),
                  ),
                  const SizedBox(width: 22),
                  HomeSwitch(
                    onChanged: (bool value) {
                      context.read<HomeBloc>().add(ChangeStatusAlarm(value));
                    },
                  ),
                ],
              ),
              const SizedBox(height: 16),
              if (userStatusTracking != null)
                ButtonStart(
                  enableStart: _correctTime(minTime, maxTime, state),
                  userStatusTracking: userStatusTracking,
                  onStartTracking: () {
                    if (state is HomeLoaded) {
                      if (state.userStatusTracking!.tracking == null) {
                        showCustomAlertDialog(context,
                            children: PopUpConfirmStartTracking(
                          onPressed: () async {
                            context.read<HomeBloc>().add(StartTracking());
                          },
                        ));
                      } else {
                        Navigator.pushNamed(
                          context,
                          R.tracking,
                          arguments: TrackingParams(
                              timeStart: state.userStatusTracking!.tracking!
                                      .startSleep! *
                                  1000,
                              timeWakeUp:
                                  state.userStatusTracking!.tracking!.wakeUp! *
                                      1000,
                              tokenEarn: double.parse(
                                  state.userStatusTracking!.tracking!.estEarn!),
                              fromRoute: R.bottomNavigation),
                        );
                      }
                    }
                  },
                ),
              const SizedBox(height: 32),
              Row(
                children: [
                  Expanded(
                    child: Stack(
                      alignment: Alignment.centerLeft,
                      children: [
                        SFPercentBorderGradient(
                          valueActive:
                              state is HomeLoaded ? state.tokenEarn : 0,
                          totalValue: 150,
                          linearGradient: AppColors.gradientBluePurple,
                          lineHeight: 18,
                          barRadius: 20,
                          backgroundColor: Colors.white.withOpacity(0.05),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: SFText(
                            keyText:
                                '${state is HomeLoaded ? state.tokenEarn : 0}/150 SLFT',
                            style: TextStyles.white10,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, R.question),
                    child: SvgPicture.asset(
                      Ics.icCircleQuestion,
                      width: 20,
                      height: 20,
                      color: AppColors.lightGrey,
                    ),
                  ),
                  const SizedBox(width: 12),
                  GestureDetector(
                    onTap: () => Navigator.pushNamed(context, R.feedback),
                    child: SvgPicture.asset(
                      Ics.starOutlined,
                      width: 20,
                      height: 20,
                      color: AppColors.yellow,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 29),
              const LuckyBox(),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  bool _correctTime(DateTime minTime, DateTime maxTime, HomeState state) {
    if (state is! HomeLoaded) return false;
    var hour = state.hour;
    var minute = state.minute;
    var now = DateTime.now();
    var nextDay = DateTime.now().add(const Duration(days: 1));
    var wakeUpTimeInNextDay =
        DateTime(nextDay.year, nextDay.month, nextDay.day, hour, minute);
    var wakeUpTimeInDay = DateTime(now.year, now.month, now.day, hour, minute);
    var wakeUpTime = hour <= now.hour ? wakeUpTimeInNextDay : wakeUpTimeInDay;

    return wakeUpTime.isAfter(minTime) && wakeUpTime.isBefore(maxTime);
  }



  // bool _theSameList(
  //     List<LuckyBoxEntity> currentList, List<LuckyBoxEntity> prevList) {
  //   if (currentList.length == prevList.length) {
  //     for (int i = 0; i < prevList.length; i++) {
  //       var index =
  //           currentList.indexWhere((element) => element.id == prevList[i].id);
  //       if (index == -1) return false;
  //     }
  //     return true;
  //   }
  //   return false;
  // }
}
