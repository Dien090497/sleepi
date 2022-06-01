import 'package:flutter/material.dart';
import 'package:flutter_date_pickers/flutter_date_pickers.dart' as dp;
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/chart/widgets/sleep_score_widget.dart';
import 'package:slee_fi/presentation/screens/result/widgets/chart_statistic_share.dart';

class TabDay extends StatelessWidget {
  const TabDay({Key? key}) : super(key: key);

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
                ChartDayPicker(
                  selectedDate: DateTime.now(),
                  firstAllowedDate:
                      DateTime.now().subtract(const Duration(days: 45)),
                  lastAllowedDate: DateTime.now().add(const Duration(days: 45)),
                  onNewSelected: (date) {},
                )
              ],
            );
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.arrow_back_ios, size: 16, color: AppColors.lightGrey),
              SizedBox(width: 12),
              Text('April 26th, 2022'),
              SizedBox(width: 12),
              Icon(Icons.arrow_forward_ios,
                  size: 16, color: AppColors.lightGrey),
            ],
          ),
        ),
        const SizedBox(height: 16),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
        const SizedBox(
          height: 12,
        ),
        SFCard(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
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
