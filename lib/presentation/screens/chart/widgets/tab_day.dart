import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_day_cubit.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_day_state.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_tab_body.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/sleep_score_widget.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TabDay extends StatelessWidget {
  const TabDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartDayCubit, ChartDayState>(
      builder: (context, state) {
        if (state is ChartDayLoaded) {
          final cubit = context.read<ChartDayCubit>();
          final nextDay = state.selectedDate.add(const Duration(days: 1));
          final prevDay = state.selectedDate.add(const Duration(days: 1));
          return ChartTabBody(
            nextEnable: nextDay.isBefore(state.lastAllowedDate),
            prevEnable: prevDay.isAfter(state.firstAllowedDate),
            picker: ChartDayPicker(
              selectedDate: state.selectedDate,
              firstAllowedDate: state.firstAllowedDate,
              lastAllowedDate: state.lastAllowedDate,
              onNewSelected: (day) {
                cubit.selectDay(day);
              },
            ),
            onPreviousTap: () {
              cubit.previousTap();
            },
            onNextTap: () {
              cubit.nextTap();
            },
            text: getIt<DateTimeUtils>().MMMdyyyy(state.selectedDate),
            children: [
              SFCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.token_earned,
                      style: TextStyles.lightWhite16,
                    ),
                    Expanded(
                        child: SFText(
                            keyText: "100 SLGT",
                            style: TextStyles.lightWhite16,
                            textAlign: TextAlign.end)),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              SFCard(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.sleep_score,
                      style: TextStyles.lightWhite16,
                    ),
                    Expanded(
                        child: SFText(
                            keyText: "85/100",
                            style: TextStyles.lightWhite16,
                            textAlign: TextAlign.end)),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              ChartStatisticShare(),
              const SizedBox(height: 24),
              const SleepScore(),
            ],
          );
        }
        return const LoadingIcon();
      },
    );
  }
}

class ChartDayPicker extends StatelessWidget {
  const ChartDayPicker(
      {Key? key,
      required this.selectedDate,
      required this.firstAllowedDate,
      required this.lastAllowedDate,
      required this.onNewSelected})
      : super(key: key);

  final DateTime selectedDate;
  final DateTime firstAllowedDate;
  final DateTime lastAllowedDate;
  final ValueChanged<DateTime> onNewSelected;

  @override
  Widget build(BuildContext context) {
    return SfDateRangePicker(
      maxDate: lastAllowedDate,
      minDate: firstAllowedDate,
      showNavigationArrow: true,
      selectionTextStyle: TextStyles.white14,
      initialDisplayDate: selectedDate,
      initialSelectedDate: selectedDate,
      showTodayButton: false,
      monthCellStyle: const DateRangePickerMonthCellStyle(
        disabledDatesTextStyle: TextStyles.lightGrey14,
        textStyle: TextStyles.lightGrey14,
        todayTextStyle: TextStyles.white14,
        leadingDatesTextStyle: TextStyles.white14,
      ),
      yearCellStyle: const DateRangePickerYearCellStyle(
        textStyle: TextStyles.white14,
        disabledDatesTextStyle: TextStyles.lightGrey14,
      ),
      monthViewSettings: const DateRangePickerMonthViewSettings(
          firstDayOfWeek: 1,
          viewHeaderStyle:
              DateRangePickerViewHeaderStyle(textStyle: TextStyles.white14)),
      rangeTextStyle: TextStyles.white14,
      headerStyle: const DateRangePickerHeaderStyle(
        textAlign: TextAlign.center,
        textStyle: TextStyles.white14,
      ),
      selectionMode: DateRangePickerSelectionMode.single,
      onSelectionChanged: (DateRangePickerSelectionChangedArgs value) {
        final selectedDate = value.value;
        if (selectedDate is DateTime) {
          onNewSelected(selectedDate);
        }
        Navigator.pop(context);
      },
    );
  }
}
