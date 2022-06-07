import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/style/app_colors.dart';
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

class TabDay extends StatelessWidget {
  const TabDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChartDayCubit, ChartDayState>(
      builder: (context, state) {
        if (state is ChartDayLoaded) {
          final cubit = context.read<ChartDayCubit>();
          return ChartTabBody(
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
    final DatePickerRangeStyles styles = DatePickerRangeStyles(
      firstDayOfWeekIndex: 1,
      selectedPeriodLastDecoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.0), bottomEnd: Radius.circular(10.0))),
      selectedPeriodStartDecoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadiusDirectional.only(
            topStart: Radius.circular(10.0),
            bottomStart: Radius.circular(10.0)),
      ),
      selectedPeriodMiddleDecoration: const BoxDecoration(
          color: AppColors.green, shape: BoxShape.rectangle),
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
        DayPicker.single(
          selectedDate: selectedDate,
          onChanged: (date) {
            onNewSelected(date);
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
