import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/date_time_utils.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_week_cubit.dart';
import 'package:slee_fi/presentation/blocs/chart/chart_week_state.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_tab_body.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_title.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';

class TabWeek extends StatelessWidget {
  const TabWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final dateTimeUtils = getIt<DateTimeUtils>();

    return BlocBuilder<ChartWeekCubit, ChartWeekState>(
      builder: (context, state) {
        if (state is ChartWeekLoaded) {
          final cubit = context.read<ChartWeekCubit>();

          final start = state.week.start;
          final end = state.week.end;
          final startMonth = start.month;
          final endMonth = end.month;
          final startYear = start.year;
          final endYear = end.year;

          return ChartTabBody(
            picker: ChartWeekPicker(
              selectedDate: state.week.start,
              firstAllowedDate: state.firstAllowedDate,
              lastAllowedDate: state.lastAllowedDate,
              onNewSelected: (period) {
                cubit.selectWeek(period);
              },
            ),
            onPreviousTap: () {
              cubit.previousTap();
            },
            onNextTap: () {
              cubit.nextTap();
            },
            text:
                '${dateTimeUtils.MMMdo(start)} ${startYear == endYear ? '' : '$startYear '}~ ${startMonth != endMonth ? dateTimeUtils.MMMdo(end) : dateTimeUtils.doFormat(end)}, $endYear',
            children: [
              const ChartTitle(
                title: LocaleKeys.slft,
                textStyleTitle: TextStyles.bold16LightWhite,
                toUpperCase: true,
                padding: EdgeInsets.zero,
              ),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                  title: LocaleKeys.average_sleep_score,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  result: "80/100",
                  textStyleResult: TextStyles.bold16Blue,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                title: LocaleKeys.bed_time,
                textStyleTitle: TextStyles.bold16LightWhite,
              ),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                  title: LocaleKeys.sleep_onset_time,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                  title: LocaleKeys.woke_up,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                  title: LocaleKeys.sleep_duration,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 4),
              ChartStatisticShare(),
              const SizedBox(height: 16),
              const ChartTitle(
                  title: LocaleKeys.time_in_bed,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 12),
              ChartStatisticShare(),
              const SizedBox(height: 40),
              const ChartTitle(
                  title: LocaleKeys.nocturnal_awakenings,
                  textStyleTitle: TextStyles.bold16LightWhite,
                  padding: EdgeInsets.zero),
              const SizedBox(height: 12),
              ChartStatisticShare(),
            ],
          );
        }
        return const LoadingIcon();
      },
    );
  }
}

class ChartWeekPicker extends StatelessWidget {
  const ChartWeekPicker(
      {Key? key,
      required this.selectedDate,
      required this.firstAllowedDate,
      required this.lastAllowedDate,
      required this.onNewSelected})
      : super(key: key);

  final DateTime selectedDate;
  final DateTime firstAllowedDate;
  final DateTime lastAllowedDate;
  final ValueChanged<DatePeriod> onNewSelected;

  @override
  Widget build(BuildContext context) {
    final DatePickerRangeStyles styles = DatePickerRangeStyles(
      selectedPeriodLastDecoration: const BoxDecoration(
          color: AppColors.green,
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.0), bottomEnd: Radius.circular(10.0))),
      selectedPeriodStartDecoration: const BoxDecoration(
        color: AppColors.green,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10.0),
            bottomStart: Radius.circular(10.0)),
      ),
      selectedPeriodMiddleDecoration: const BoxDecoration(
        color: AppColors.green,
        shape: BoxShape.rectangle,
      ),
      nextIcon: const Icon(Icons.chevron_right, color: AppColors.white),
      prevIcon: const Icon(Icons.chevron_left, color: AppColors.white),
      selectedPeriodEndTextStyle: TextStyles.white14,
      selectedDateStyle: TextStyles.white14,
      defaultDateTextStyle: TextStyles.lightGrey14,
      selectedPeriodMiddleTextStyle: TextStyles.white14,
      selectedPeriodStartTextStyle: TextStyles.white14,
      disabledDateStyle: TextStyles.lightGrey14,
      displayedPeriodTitle: TextStyles.white14,
      dayHeaderStyle: const DayHeaderStyle(textStyle: TextStyles.white14),
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        WeekPicker(
          selectedDate: selectedDate,
          onChanged: (period) {
            onNewSelected(period);
            Navigator.pop(context);
          },
          firstDate: firstAllowedDate,
          lastDate: lastAllowedDate,
          datePickerStyles: styles,
        ),
      ],
    );
  }
}
