import 'dart:io';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:health/health.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/alarm_sound_button.dart';
import 'package:slee_fi/presentation/screens/home/widgets/button_start.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/lucky_box_component.dart';
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
                const Expanded(
                  child: SoundButton(),
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
                  if (!isLoading) {
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
                  }
                },
              ),
            const SizedBox(height: 32),
            Row(
              children: [
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      final EstimateSleepResponse? value =
                          state is HomeLoaded ? state.tokenEarn : null;
                      final double totalValue =
                          value?.maxEarnPerDay ?? Const.tokenEarnMaxPerDay;
                      final double currentToken = value?.todayEarn ?? 0;
                      return Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SFPercentBorderGradient(
                            valueActive: min(totalValue, currentToken),
                            totalValue: totalValue,
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
                                  '${currentToken.toStringAsFixed(2)}/${totalValue.toInt()}  SLFT',
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
            const SizedBox(height: 80, child: LuckyBox()),
            const SizedBox(height: 20),
          ],
        );
      }),
    );
  }

  Future<void> _startPress(BuildContext context, DateTime selectedTime) async {
    return showCustomAlertDialog(
      context,
      children: PopUpConfirmStartTracking(
        onPressed: () async {
          Navigator.pop(context);
          showWarningDialog(
              context,
              Platform.isAndroid
                  ? LocaleKeys.please_turn_on_tracking_android
                  : LocaleKeys.please_turn_on_tracking_ios, () async {
            final isAppInstalled = await LaunchApp.isAppInstalled(
              androidPackageName: 'com.google.android.apps.fitness',
              iosUrlScheme: 'x-apple-health://',
            );
            if (isAppInstalled) {
              final isGranted = await _requestHealthAuthorization();
              if (isGranted) {
                final homeBloc = BlocProvider.of<HomeBloc>(context);
                final state = homeBloc.state;
                if (state is HomeLoaded) {
                  final startRes = await getIt<StartSleepTrackingUseCase>()
                      .call(StartTrackingSchema(
                    isEnableInsurance: state.enableInsurance,
                    bedUsed: state.selectedBed!.nftId,
                    wakeUp:
                        '${selectedTime.toUtc().millisecondsSinceEpoch ~/ 1000}',
                    alrm: state.enableAlarm,
                    itemUsed: state.selectedItem?.nftId ?? 0,
                  ));
                  Navigator.pop(context);
                  startRes.fold(
                    (l) {
                      showMessageDialog(context, '$l');
                    },
                    (r) async {
                      Navigator.pushNamed(
                        context,
                        R.tracking,
                        arguments: TrackingParams(
                            timeStart: DateTime.now().millisecondsSinceEpoch,
                            timeWakeUp: selectedTime.millisecondsSinceEpoch,
                            tokenEarn: state.tokenEarn?.todayEarn ?? 0,
                            fromRoute: R.bottomNavigation,
                            imageBed: bedImage,
                            enableAlarm: state.enableAlarm),
                      ).then((value) {
                        context.read<HomeBloc>().add(const FetchBedDetail());
                      });
                    },
                  );
                }
              } else {
                showMessageDialog(context, LocaleKeys.not_granted);
              }
            } else {
              await LaunchApp.openApp(
                androidPackageName: 'com.google.android.apps.fitness',
                iosUrlScheme: 'x-apple-health://',
                appStoreLink:
                    'itms-apps://itunes.apple.com/us/app/apple-health/id1242545199',
                // openStore: false
              );
            }
          });
        },
      ),
    );
  }

  Future<bool> _requestHealthAuthorization() async {
    final HealthFactory health = HealthFactory();

    final types = Platform.isAndroid
        ? [
            HealthDataType.SLEEP_IN_BED,
            HealthDataType.SLEEP_ASLEEP,
            HealthDataType.SLEEP_AWAKE,
            HealthDataType.SLEEP_DEEP,
            HealthDataType.SLEEP_REM,
            HealthDataType.SLEEP_LIGHT,
          ]
        : [
            HealthDataType.SLEEP_IN_BED,
            HealthDataType.SLEEP_ASLEEP,
            HealthDataType.SLEEP_AWAKE,
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
