import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key? key,
    required this.onTimeSelected,
    required this.onScrolling,
  }) : super(key: key);

  final Function(DateTime) onTimeSelected;
  final Function(bool isScrolling) onScrolling;

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
          _DatePicker(
            onTimeSelected: onTimeSelected,
            onScrolling: onScrolling,
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

class _DatePicker extends StatefulWidget {
  const _DatePicker(
      {Key? key, required this.onTimeSelected, required this.onScrolling})
      : super(key: key);

  final Function(DateTime) onTimeSelected;
  final Function(bool isScrolling) onScrolling;

  @override
  State<_DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  bool isSelectingH = false;
  bool isSelectingM = false;
  late int selectedH;
  late int selectedM;

  late DateTime selectedTime;

  @override
  void initState() {
    final now = DateTime.now();
    selectedH = now.hour;
    selectedM = now.minute;
    selectedTime = now;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320.0,
      margin: const EdgeInsets.symmetric(horizontal: 50),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
              child: SFDatePicker(
            datas: List<int>.generate(24, (i) => i),
            selectedTime: selectedH,
            alignment: Alignment.centerRight,
            offAxisFraction: -.5,
            timeChanged: (hour) {
              isSelectingH = false;
              selectedH = hour;
              if (!isSelectingH && !isSelectingM) {
                widget.onTimeSelected(_convertSelectedTime());
              }
              widget.onScrolling(isSelectingM || isSelectingH);
            },
            onStartScroll: () {
              isSelectingH = true;
              widget.onScrolling(isSelectingM || isSelectingH);
            },
          )),
          Expanded(
              child: SFDatePicker(
            datas: List<int>.generate(60, (i) => i),
            selectedTime: selectedM,
            alignment: Alignment.centerLeft,
            offAxisFraction: .5,
            timeChanged: (minute) {
              isSelectingM = false;
              selectedM = minute;
              if (!isSelectingM && !isSelectingH) {
                widget.onTimeSelected(_convertSelectedTime());
              }
              widget.onScrolling(isSelectingM || isSelectingH);
            },
            useMagnifier: true,
            onStartScroll: () {
              isSelectingM = true;
              widget.onScrolling(isSelectingM || isSelectingH);
            },
          )),
        ],
      ),
    );
  }

  DateTime _convertSelectedTime() {
    final newSelected = DateTime(selectedTime.year, selectedTime.month,
        selectedTime.day, selectedH, selectedM);
    final now = DateTime.now();
    final wakeUpTime = newSelected.compareTo(now) <= 0
        ? newSelected.add(const Duration(days: 1))
        : newSelected;
    return wakeUpTime;
  }
}

class SFDatePicker extends StatefulWidget {
  const SFDatePicker({
    Key? key,
    required this.timeChanged,
    required this.selectedTime,
    required this.onStartScroll,
    required this.offAxisFraction,
    required this.alignment,
    this.useMagnifier = false,
    required this.datas,
  }) : super(key: key);

  final int selectedTime;
  final ValueChanged<int> timeChanged;
  final VoidCallback onStartScroll;
  final double offAxisFraction;
  final Alignment alignment;
  final bool useMagnifier;
  final List<int> datas;

  @override
  State<SFDatePicker> createState() => _SFDatePickerState();
}

class _SFDatePickerState extends State<SFDatePicker> {
  late int temp = widget.selectedTime;
  late final controller =
      FixedExtentScrollController(initialItem: widget.selectedTime);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (scrollNotification) {
        final metrics = scrollNotification.metrics;
        if (scrollNotification is ScrollEndNotification &&
            metrics is FixedExtentMetrics) {
          widget.timeChanged(temp);
          return true;
        } else {
          if (scrollNotification is ScrollStartNotification) {
            widget.onStartScroll();
          }
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
