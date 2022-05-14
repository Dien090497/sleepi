import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:slee_fi/common/style/app_colors.dart';

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
