import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_title.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/sleep_cycle_chart.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/sleep_score_widget.dart';

class TabDay extends StatelessWidget {
  const TabDay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) {
                return ChartDayPicker(
                  selectedDate: DateTime.now(),
                  firstAllowedDate:
                      DateTime.now().subtract(const Duration(days: 45)),
                  lastAllowedDate: DateTime.now().add(const Duration(days: 45)),
                  onNewSelected: (date) {},
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios, size: 16),
              SizedBox(width: 12),
              Text('April 26th, 2022'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ChartTitle(
          text: Keys.tokenEarned,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyBottomNavBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.black),
            ),
            width: 200,
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.all(8),
            child: SFText(keyText: 'SLFT'),
          ),
        ),
        const SizedBox(height: 16),
        ChartTitle(
          text: Keys.sleepScore,
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyBottomNavBar,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: AppColors.black),
            ),
            width: 200,
            padding: const EdgeInsets.all(8),
            alignment: Alignment.centerRight,
            child: SFText(keyText: '/100'),
          ),
        ),
        const SizedBox(height: 16),
        const SleepCycleChart(),
        const SizedBox(height: 16),
        const SleepScore(),
      ],
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
    final dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
      selectedPeriodLastDecoration: const BoxDecoration(
          color: AppColors.black,
          borderRadius: BorderRadiusDirectional.only(
              topEnd: Radius.circular(10.0), bottomEnd: Radius.circular(10.0))),
      selectedPeriodStartDecoration: const BoxDecoration(
        color: AppColors.black,
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
          child: dp.DayPicker.single(
            selectedDate: selectedDate,
            onChanged: (date) {
              onNewSelected(date);
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
