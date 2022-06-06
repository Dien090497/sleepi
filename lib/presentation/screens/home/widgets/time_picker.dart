import 'package:flutter/cupertino.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';

class TimePicker extends StatefulWidget {
  const TimePicker({Key? key}) : super(key: key);

  @override
  State<TimePicker> createState() => _TimePickerState();
}

class _TimePickerState extends State<TimePicker> {
  late int _selectedHour = DateTime.now().hour;
  late int _selectedMinute = DateTime.now().minute;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
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
                  child: CupertinoPicker(
                      looping: true,
                      selectionOverlay: Container(),
                      offAxisFraction: -0.5,
                      squeeze: 1,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedHour,
                      ),
                      itemExtent: 48.0,
                      backgroundColor: AppColors.dark,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _selectedHour = index;
                        });
                      },
                      children: List<Widget>.generate(24, (int index) {
                        return Container(
                          width: size.width,
                          height: 46,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.centerRight,
                          child: Text(
                            index < 10 ? '0$index' : '$index',
                            textAlign: TextAlign.right,
                            style: TextStyles.white1w700size16,
                          ),
                        );
                      })),
                ),
                Expanded(
                  child: CupertinoPicker(
                      selectionOverlay: Container(),
                      looping: true,
                      squeeze: 1,
                      offAxisFraction: 0.5,
                      useMagnifier: true,
                      scrollController: FixedExtentScrollController(
                        initialItem: _selectedMinute,
                      ),
                      itemExtent: 48.0,
                      backgroundColor: AppColors.dark,
                      onSelectedItemChanged: (int index) {
                        setState(() {
                          _selectedMinute = index;
                        });
                      },
                      children: List<Widget>.generate(60, (int index) {
                        return Container(
                          width: size.width,
                          height: 46,
                          padding:
                          const EdgeInsets.symmetric(horizontal: 12),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            index < 10 ? '0$index' : '$index',
                            textAlign: TextAlign.right,
                            style: TextStyles.white1w700size16,
                          ),
                        );
                      })),
                ),
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
                          gradient:
                          AppColors.gradientWhiteBorderLeftToRight,
                        ),
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient:
                          AppColors.gradientWhiteBorderLeftToRight,
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
                          gradient:
                          AppColors.gradientWhiteBorderRightToLeft,
                        ),
                      ),
                      const SizedBox(
                        height: 46,
                      ),
                      Container(
                        height: 1,
                        decoration: BoxDecoration(
                          gradient:
                          AppColors.gradientWhiteBorderRightToLeft,
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
