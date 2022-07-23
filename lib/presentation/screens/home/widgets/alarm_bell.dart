import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health/health.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:slee_fi/common/const/const.dart';
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
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/button_start.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/lucky_box.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_start_tracking.dart';
import 'package:slee_fi/presentation/screens/home/widgets/time_picker.dart';
import 'package:slee_fi/presentation/screens/tracking/tracking_screen.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/usecase/start_sleep_tracking_usecase.dart';

class AlarmBell extends StatelessWidget {
  const AlarmBell({
    Key? key,
    required this.userStatusTracking,
    required this.bedImage,
    this.startTime,
    this.endTime,
  }) : super(key: key);

  final UserStatusTrackingModel? userStatusTracking;
  final String? bedImage;
  final double? startTime;
  final double? endTime;

  @override
  Widget build(BuildContext context) {
    final dateTimeUtil = getIt<DateTimeUtils>();
    final availableAt = userStatusTracking?.availableAt;
    final now = DateTime.now();
    DateTime selectedTime =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    bool isScrolling = false;
    bool isLoading = false;
    DateTime? startRange = _getRange(startTime);
    DateTime? endRange = _getRange(endTime);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: StatefulBuilder(builder: (context, setState) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TimePicker(
              onTimeSelected: (time) {
                selectedTime = time;
                isScrolling = false;
                startRange = _getRange(startTime);
                endRange = _getRange(endTime);
                setState(() {});
              },
              onScrolling: (scrolling) {
                if (scrolling) {
                  isScrolling = scrolling;
                  setState(() {});
                }
              },
            ),
            const SizedBox(height: 16),
            Text(
              '${LocaleKeys.range.tr()}: ${startRange != null && endRange != null ? '${dateTimeUtil.HHmm(startRange!)}-${dateTimeUtil.HHmm(endRange!)}' : '03:00-06:00'}',
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
                BlocBuilder<HomeBloc, HomeState>(
                  builder: (context, state) {
                    return HomeSwitch(
                      onChanged: (bool value) {
                        context.read<HomeBloc>().add(ChangeStatusAlarm(value));
                      },
                      isOn: state is HomeLoaded && state.enableAlarm,
                    );
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            if (userStatusTracking != null)
              ButtonStart(
                key: Key('$availableAt'),
                enableStart: !isLoading &&
                    !isScrolling &&
                    startRange != null &&
                    endRange != null &&
                    _correctTime(startRange!, endRange!, selectedTime),
                availableAt: availableAt,
                onStartTracking: () async {
                  isLoading = true;
                  startRange = _getRange(startTime);
                  endRange = _getRange(endTime);
                  setState(() {});
                  final isValidTime =
                      _correctTime(startRange!, endRange!, selectedTime);
                  if (isValidTime) {
                    _startPress(context, selectedTime).then((_) {
                      isLoading = false;
                      setState(() {});
                    });
                  } else {
                    showMessageDialog(context, 'Invalid Time');
                  }
                },
              ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      return Stack(
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
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SFText(
                              keyText:
                                  '${state is HomeLoaded ? state.tokenEarn.toStringAsFixed(2) : 0}/150 SLFT',
                              style: TextStyles.white10,
                            ),
                          )
                        ],
                      );
                    },
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
        );
      }),
    );
  }

  Future<void> _startPress(BuildContext context, DateTime selectedTime) async {
    final isGranted = await _requestHealthAuthorization();

    if (isGranted) {
      return showCustomAlertDialog(
        context,
        children: PopUpConfirmStartTracking(
          onPressed: () async {
            final homeBloc = BlocProvider.of<HomeBloc>(context);
            final state = homeBloc.state;
            if (state is HomeLoaded) {
              final startRes = await getIt<StartSleepTrackingUseCase>()
                  .call(StartTrackingSchema(
                isEnableInsurance: state.enableInsurance,
                bedUsed: state.selectedBed!.id,
                wakeUp:
                    '${selectedTime.toUtc().millisecondsSinceEpoch ~/ 1000}',
                alrm: state.enableAlarm,
                itemUsed: state.selectedItem?.id ?? 0,
              ));
              Navigator.pop(context);
              startRes.fold(
                (l) {
                  showMessageDialog(context, '$l');
                },
                (r) async {
                  final service = FlutterBackgroundService();
                  SharedPreferences preferences = await SharedPreferences.getInstance();
                  await preferences.setInt(Const.time, selectedTime.millisecondsSinceEpoch);
                  FlutterBackgroundService().invoke(Const.setAsForeground);
                  service.startService();
                  Navigator.pushNamed(
                    context,
                    R.tracking,
                    arguments: TrackingParams(
                      timeStart: DateTime.now().millisecondsSinceEpoch,
                      timeWakeUp: selectedTime.millisecondsSinceEpoch,
                      tokenEarn: state.tokenEarn,
                      fromRoute: R.bottomNavigation,
                      imageBed: bedImage,
                    ),
                  );
                },
              );
            }
          },
        ),
      );
    } else {
      showMessageDialog(context, LocaleKeys.not_granted);
    }
  }

  Future<bool> _requestHealthAuthorization() async {
    final HealthFactory health = HealthFactory();

    final types = [
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
      HealthDataType.SLEEP_DEEP,
      HealthDataType.SLEEP_REM,
      HealthDataType.SLEEP_LIGHT,
    ];

    return await health.requestAuthorization(types);
  }

  DateTime? _getRange(double? time) {
    if (time == null) return null;
    final now = DateTime.now();
    final nowWithoutSecond =
        DateTime(now.year, now.month, now.day, now.hour, now.minute);
    final nowWithoutSec =
        nowWithoutSecond.add(Duration(minutes: (time * 60).toInt()));
    return nowWithoutSec;
  }

  bool _correctTime(
      DateTime startRange, DateTime endRange, DateTime selectedTime) {
    return startRange.compareTo(selectedTime) <= 0 &&
        endRange.compareTo(selectedTime) >= 0;
  }
}
