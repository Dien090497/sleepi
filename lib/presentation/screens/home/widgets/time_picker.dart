import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({Key? key}) : super(key: key);

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
            margin: const EdgeInsets.symmetric(
              horizontal: 50,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Expanded(
                    child: SFDatePicker(
                  selectedTime: DateTime.now().hour,
                  alignment: Alignment.centerRight,
                  offAxisFraction: -.5,
                  timeChanged: (time) {},
                )),
                Expanded(
                    child: SFDatePicker(
                  selectedTime: DateTime.now().minute,
                  alignment: Alignment.centerLeft,
                  offAxisFraction: .5,
                  timeChanged: (time) {},
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
                      const SizedBox(
                        height: 46,
                      ),
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
  }) : super(key: key);

  final int selectedTime;
  final ValueChanged<int> timeChanged;
  final double offAxisFraction;
  final Alignment alignment;
  final bool useMagnifier;

  @override
  State<SFDatePicker> createState() => _SFDatePickerState();
}

class _SFDatePickerState extends State<SFDatePicker> {
  late int _time = widget.selectedTime;

  @override
  Widget build(BuildContext context) {
    return CupertinoPicker(
        looping: true,
        selectionOverlay: Container(),
        offAxisFraction: widget.offAxisFraction,
        squeeze: 1,
        scrollController: FixedExtentScrollController(
          initialItem: _time,
        ),
        useMagnifier: widget.useMagnifier,
        itemExtent: 48.0,
        backgroundColor: AppColors.dark,
        onSelectedItemChanged: (int index) {
          setState(() {
            _time = index;
          });
          widget.timeChanged(index);
        },
        children: List<Widget>.generate(24, (int index) {
          return Container(
            width: double.infinity,
            height: 46,
            padding: const EdgeInsets.symmetric(horizontal: 12),
            alignment: widget.alignment,
            child: Text(
              index < 10 ? '0$index' : '$index',
              textAlign: TextAlign.right,
              style: TextStyles.white1w700size16,
            ),
          );
        }));
  }
}
