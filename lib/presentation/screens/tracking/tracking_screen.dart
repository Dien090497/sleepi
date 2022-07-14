import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:health/health.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking.dart';
import 'package:slee_fi/presentation/blocs/tracking/tracking_state.dart';
import 'package:slee_fi/presentation/screens/tracking/widgets/analog_clock.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health.dart';
import 'package:slee_fi/schema/sleep_tracking/data_health_schema.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  late List<DataHealth> _healthDataList = [];

  Future<void> fetchData() async {
    DateTime now = DateTime.now();
    HealthFactory health = HealthFactory();

    var types = [
      HealthDataType.SLEEP_IN_BED,
      HealthDataType.SLEEP_ASLEEP,
      HealthDataType.SLEEP_AWAKE,
    ];

    bool accessWasGranted = await health.requestAuthorization(types);

    if (accessWasGranted) {
      try {
        List<HealthDataPoint> healthData = await health.getHealthDataFromTypes(
            now.subtract(const Duration(days: 14)), now, types);
        healthData = HealthFactory.removeDuplicates(healthData);
        for (var element in healthData) {
          print('=--==-${convertDataToSchema(1, element).toJson()}');
          _healthDataList.add(convertDataToSchema(1, element));
        }
      } catch (e) {
        log("Caught exception in getHealthDataFromTypes: $e");
      }
    } else {
      log("Authorization not granted");
    }
  }

  DataHealth convertDataToSchema(int idTracking, HealthDataPoint data) {
    return DataHealth(
        trackingId: idTracking,
        dataType: data.type.name,
        value: data.value.toJson()['numericValue'].toString(),
        platformType: data.platform.name,
        unit: data.unit.name,
        dateFrom:
            '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateFrom)}Z',
        dateTo:
            '${DateFormat("yyyy-MM-dd'T'HH:mm:ss.sss").format(data.dateTo)}Z',
        sourceId: data.sourceId,
        sourceName: data.sourceName);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TrackingCubit(),
      child: BlocConsumer<TrackingCubit, TrackingState>(
        listener: (context, state) {
          if (state is TrackingStatePosted) {
            Navigator.pushNamed(context, R.preResult);
          }
        },
        builder: (context, state) {
          final cubit = context.read<TrackingCubit>();

          return state is TrackingStateLoading
              ? const LoadingScreen()
              : BackgroundWidget(
                  appBar: SFAppBar(
                      context: context,
                      title: LocaleKeys.tracking,
                      textStyle: TextStyles.bold18LightWhite),
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
                                  keyText: "0 SLFT",
                                  style: TextStyles.bold30White,
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        const SFLabelValue(
                          label: LocaleKeys.alarm,
                          value: '10:00',
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
                            fetchData();
                            if (_healthDataList.isNotEmpty) {
                              cubit.postHealthData(
                                  DataHealthSchema(listData: _healthDataList));
                            }
                            // Navigator.pushNamed(context, R.preResult);
                            // showCustomAlertDialog(
                            //   context,
                            //   padding: const EdgeInsets.all(24),
                            //   children: const PopUpConfirmWakeUp(),
                            // );
                          },
                        ),
                        const SizedBox(height: 26),
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
