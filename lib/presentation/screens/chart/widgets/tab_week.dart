import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_title.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';

class TabWeek extends StatelessWidget {
  const TabWeek({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        GestureDetector(
          onTap: () {
            showCustomDialog(
              context,
              children: [
                ChartWeekPicker(
                  selectedDate: DateTime.now(),
                  firstAllowedDate:
                      DateTime.now().subtract(const Duration(days: 45)),
                  lastAllowedDate: DateTime.now().add(const Duration(days: 45)),
                  onNewSelected: (period) {},
                )
              ],
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: AppColors.lightGrey,
              ),
              SizedBox(width: 12),
              Text('April 20th ~ 26th, 2022'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.lightGrey),
            ],
          ),
        ),
        const SizedBox(height: 33),
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
            title: LocaleKeys.averageSleepScore,
            textStyleTitle: TextStyles.bold16LightWhite,
            result: "80/100",
            textStyleResult: TextStyles.bold16Blue,
            padding: EdgeInsets.zero),
        const SizedBox(height: 12),
        ChartStatisticShare(),
        const SizedBox(height: 40),
        const ChartTitle(
          title: LocaleKeys.bedTime,
          textStyleTitle: TextStyles.bold16LightWhite,
        ),
        const SizedBox(height: 12),
        ChartStatisticShare(),
        const SizedBox(height: 40),
        const ChartTitle(
            title: LocaleKeys.sleepOnsetTime,
            textStyleTitle: TextStyles.bold16LightWhite,
            padding: EdgeInsets.zero),
        const SizedBox(height: 12),
        ChartStatisticShare(),
        const SizedBox(height: 40),
        const ChartTitle(
            title: LocaleKeys.wokeUp,
            textStyleTitle: TextStyles.bold16LightWhite,
            padding: EdgeInsets.zero),
        const SizedBox(height: 12),
        ChartStatisticShare(),
        const SizedBox(height: 40),
        const ChartTitle(
            title: LocaleKeys.sleepDuration,
            textStyleTitle: TextStyles.bold16LightWhite,
            padding: EdgeInsets.zero),
        const SizedBox(height: 4),
        ChartStatisticShare(),
        const SizedBox(height: 16),
        const ChartTitle(
            title: LocaleKeys.timeInBed,
            textStyleTitle: TextStyles.bold16LightWhite,
            padding: EdgeInsets.zero),
        const SizedBox(height: 12),
        ChartStatisticShare(),
        const SizedBox(height: 40),
        const ChartTitle(
            title: LocaleKeys.nocturnalAwakening,
            textStyleTitle: TextStyles.bold16LightWhite,
            padding: EdgeInsets.zero),
        const SizedBox(height: 12),
        ChartStatisticShare(),
      ],
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
    );

    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.white,
          child: WeekPicker(
            selectedDate: selectedDate,
            onChanged: (period) {
              onNewSelected(period);
              Navigator.pop(context);
            },
            firstDate: firstAllowedDate,
            lastDate: lastAllowedDate,
            datePickerStyles: styles,
          ),
        ),
      ],
    );
  }
}
