import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key? key,
    required this.onHourChange,
    required this.onMinuteChange,
    required this.selectedTime,
  }) : super(key: key);

  final Function(int hour) onHourChange;
  final Function(int hour) onMinuteChange;
  final DateTime selectedTime;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topRight: Radius.circular(40),
        topLeft: Radius.circular(40),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: 320.0,
            margin: const EdgeInsets.symmetric(horizontal: 50),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: SFDatePicker(
                  datas: List<int>.generate(24, (i) => i),
                  selectedTime: selectedTime.hour,
                  alignment: Alignment.centerRight,
                  offAxisFraction: -.5,
                  timeChanged: onHourChange,
                )),
                Expanded(
                    child: SFDatePicker(
                  datas: List<int>.generate(60, (i) => i),
                  selectedTime: selectedTime.minute,
                  alignment: Alignment.centerLeft,
                  offAxisFraction: .5,
                  timeChanged: onMinuteChange,
                  useMagnifier: true,
                )),
              ],
            ),
          ),
          SizedBox(
            height: 320,
            width: double.infinity,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientWhiteBorderLeftToRight,
                        ),
                      ),
                      const SizedBox(height: 46),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientWhiteBorderLeftToRight,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientWhiteBorderRightToLeft,
                        ),
                      ),
                      const SizedBox(height: 46),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient: AppColors.gradientWhiteBorderRightToLeft,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SFDatePicker extends StatefulWidget {
  const SFDatePicker({
    Key? key,
    required this.timeChanged,
    required this.selectedTime,
    required this.offAxisFraction,
    required this.alignment,
    this.useMagnifier = false,
    required this.datas,
  }) : super(key: key);

  final int selectedTime;
  final ValueChanged<int> timeChanged;
  final double offAxisFraction;
  final Alignment alignment;
  final bool useMagnifier;
  final List<int> datas;

  @override
  State<SFDatePicker> createState() => _SFDatePickerState();
}

class _SFDatePickerState extends State<SFDatePicker> {
  late final controller =
      FixedExtentScrollController(initialItem: widget.selectedTime);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int temp = 0;
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        final metrics = scrollNotification.metrics;
        if (scrollNotification is ScrollEndNotification &&
            metrics is FixedExtentMetrics) {
          widget.timeChanged(temp);
          return true;
        } else {
          return false;
        }
      },
      child: CupertinoPicker(
        looping: true,
        selectionOverlay: const SizedBox(),
        offAxisFraction: widget.offAxisFraction,
        squeeze: 1,
        scrollController: controller,
        useMagnifier: widget.useMagnifier,
        itemExtent: 48.0,
        backgroundColor: AppColors.dark,
        onSelectedItemChanged: (int index) {
          temp = index;
        },
        children: List<Widget>.generate(
          widget.datas.length,
          (int i) {
            final value = widget.datas[i];
            return Container(
              width: double.infinity,
              height: 46,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              alignment: widget.alignment,
              child: Text(
                value < 10 ? '0$value' : '$value',
                textAlign: TextAlign.right,
                style: TextStyles.white1w700size16,
              ),
            );
          },
        ),
      ),
    );
  }
}
