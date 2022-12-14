import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_month_cubit.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_month_state.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_tab_body.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';

import 'chart_title.dart';

class TabMonth extends StatelessWidget {
  const TabMonth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateUtils = getIt<DateTimeUtils>();

    return BlocBuilder<ChartMonthCubit, ChartMonthState>(
      builder: (context, state) {
        final cubit = context.read<ChartMonthCubit>();
        if (state is ChartMonthLoaded) {
          if (state.dataChart != null) {
            if (state.dataChart?.isNotEmpty ?? true) {
              final date = state.selectedDate;
              final nextMonth = DateTime(date.year, date.month + 1, date.day);
              final prevMonth = DateTime(date.year, date.month - 1, date.day);
              return ChartTabBody(
                nextEnable: nextMonth.isBefore(state.lastAllowedDate),
                prevEnable: prevMonth.isAfter(state.firstAllowedDate),
                picker: ChartMonthPicker(
                  selectedDate: state.selectedDate,
                  firstAllowedDate: state.firstAllowedDate,
                  lastAllowedDate: state.lastAllowedDate,
                  onMonthSelected: (period) {
                    cubit.selectMonth(period);
                  },
                ),
                onPreviousTap: () {
                  cubit.previousTap(type: 'month');
                },
                onNextTap: () {
                  cubit.nextTap(type: 'month');
                },
                text:
                '${dateUtils.MMMdo(dateUtils.startOfMonth(date))} ~ ${dateUtils.MMMdo(dateUtils.endOfMonth(date))}, ${date.year}',
                children: [
                  const ChartTitle(
                    title: "SLFT",
                    textStyleTitle: TextStyles.bold16LightWhite,
                    padding: EdgeInsets.zero,
                  ),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 100, data: state.dataChart?.first, typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                      title: LocaleKeys.average_sleep_score,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      result: "80/100",
                      textStyleResult: TextStyles.bold16Blue,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 100,data: state.dataChart?[1], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                    title: LocaleKeys.bed_time,
                    textStyleTitle: TextStyles.bold16LightWhite,
                  ),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[2], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                      title: LocaleKeys.sleep_onset_time,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[3], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                      title: LocaleKeys.woke_up,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[4], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                      title: LocaleKeys.sleep_duration,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 4),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[5], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 16),
                  const ChartTitle(
                      title: LocaleKeys.time_in_bed,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[6], typeTimeChart: TypeTimeChart.chartMonth,),
                  const SizedBox(height: 40),
                  const ChartTitle(
                      title: LocaleKeys.nocturnal_awakenings,
                      textStyleTitle: TextStyles.bold16LightWhite,
                      padding: EdgeInsets.zero),
                  const SizedBox(height: 12),
                  ChartStatisticShare(maxValue: 300, data: state.dataChart?[7], typeTimeChart: TypeTimeChart.chartMonth,),
                ],
              );
            }
            else {
              return const LoadingIcon();
            }
          } else {
            final date = state.selectedDate;
            final nextMonth = DateTime(date.year, date.month + 1, date.day);
            final prevMonth = DateTime(date.year, date.month - 1, date.day);
            cubit.fetchDataChartMonth(fromDate: nextMonth, toDate: prevMonth, type: 'month', fistLoad: true);
            return const LoadingIcon();
          }
        }
        return const LoadingIcon();
      },
    );
  }
}

class ChartMonthPicker extends StatelessWidget {
  const ChartMonthPicker(
      {Key? key,
      required this.selectedDate,
      required this.firstAllowedDate,
      required this.lastAllowedDate,
      required this.onMonthSelected})
      : super(key: key);

  final DateTime selectedDate;
  final DateTime firstAllowedDate;
  final DateTime lastAllowedDate;
  final ValueChanged<DateTime> onMonthSelected;

  @override
  Widget build(BuildContext context) {
    // final DatePickerRangeStyles styles = DatePickerRangeStyles(
    //   selectedPeriodLastDecoration: const BoxDecoration(
    //       color: AppColors.black,
    //       borderRadius: BorderRadiusDirectional.only(
    //           topEnd: Radius.circular(10.0), bottomEnd: Radius.circular(10.0))),
    //   selectedPeriodStartDecoration: const BoxDecoration(
    //     color: AppColors.black,
    //     borderRadius: BorderRadiusDirectional.only(
    //         topStart: Radius.circular(10.0),
    //         bottomStart: Radius.circular(10.0)),
    //   ),
    //   selectedPeriodMiddleDecoration: const BoxDecoration(
    //     color: AppColors.green,
    //     shape: BoxShape.rectangle,
    //   ),
    // );

    final DatePickerRangeStyles styles = DatePickerRangeStyles(
      selectedDateStyle: Theme.of(context)
          .textTheme
          .bodyText1
          ?.copyWith(color: AppColors.lightWhite),
      selectedSingleDateDecoration:
          const BoxDecoration(color: AppColors.blue, shape: BoxShape.circle),
      nextIcon: const Icon(Icons.chevron_right, color: AppColors.white),
      prevIcon: const Icon(Icons.chevron_left, color: AppColors.white),
      selectedPeriodEndTextStyle: TextStyles.white14,
      defaultDateTextStyle: TextStyles.lightGrey14,
      selectedPeriodMiddleTextStyle: TextStyles.white14,
      selectedPeriodStartTextStyle: TextStyles.white14,
      disabledDateStyle: TextStyles.lightGrey14,
      displayedPeriodTitle: TextStyles.white14,
      dayHeaderStyle: const DayHeaderStyle(textStyle: TextStyles.white14),
    );

    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Material(
        color: AppColors.transparent,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MonthPicker.single(
              selectedDate: selectedDate,
              onChanged: (month) {
                onMonthSelected(month);
                Navigator.pop(context);
              },
              firstDate: firstAllowedDate,
              lastDate: lastAllowedDate,
              datePickerStyles: styles,
            ),
          ],
        ),
      ),
    );
  }
}
