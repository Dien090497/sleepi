import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_title.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/chart_widget.dart';

class TabWeek extends StatelessWidget {
  const TabWeek({Key? key}) : super(key: key);

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
                return ChartWeekPicker(
                  selectedDate: DateTime.now(),
                  firstAllowedDate:
                      DateTime.now().subtract(const Duration(days: 45)),
                  lastAllowedDate: DateTime.now().add(const Duration(days: 45)),
                  onNewSelected: (period) {},
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios, size: 16),
              SizedBox(width: 12),
              Text('April 20th ~ 26th, 2022'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
        const SizedBox(height: 16),
        ChartTitle(
          text: Keys.totalTokenEarned,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greyBottomNavBar,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            alignment: Alignment.centerRight,
            child: SFText(
              keyText: 'SFLT',
            ),
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        ChartTitle(
          text: Keys.averageSleepScore,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.black),
              borderRadius: BorderRadius.circular(8),
              color: AppColors.greyBottomNavBar,
            ),
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            alignment: Alignment.centerRight,
            child: SFText(
              keyText: '/100',
            ),
          ),
        ),
        const SizedBox(height: 16),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.bedTime),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.sleepOnsetTime),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.wokeUp),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.sleepDuration),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.timeInBed),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
        const SizedBox(height: 16),
        const ChartTitle(text: Keys.nocturnalAwakening),
        const SizedBox(height: 4),
        const SizedBox(
          height: 200,
          child: ChartWidget(),
        ),
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
