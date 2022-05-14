import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:slee_fi/common/style/app_colors.dart';

class TabMonth extends StatelessWidget {
  const TabMonth({Key? key}) : super(key: key);

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
                return ChartMonthPicker(
                  selectedDate: DateTime.now(),
                  firstAllowedDate:
                      DateTime.now().subtract(const Duration(days: 45)),
                  lastAllowedDate: DateTime.now().add(const Duration(days: 45)),
                  onNewSelected: (month) {},
                );
              },
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios, size: 16),
              SizedBox(width: 12),
              Text('April 20th ~ May 19th, 2022'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios, size: 16),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartMonthPicker extends StatelessWidget {
  const ChartMonthPicker(
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

    final dp.DatePickerRangeStyles styles = dp.DatePickerRangeStyles(
        selectedDateStyle: Theme.of(context)
            .textTheme
            .bodyText1
            ?.copyWith(color: AppColors.textColor),
        selectedSingleDateDecoration: const BoxDecoration(
            color: AppColors.green, shape: BoxShape.circle));

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
            Container(
              color: Colors.white,
              child: dp.MonthPicker.single(
                selectedDate: selectedDate,
                onChanged: (month) {
                  onNewSelected(month);
                  Navigator.pop(context);
                },
                firstDate: firstAllowedDate,
                lastDate: lastAllowedDate,
                datePickerStyles: styles,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
