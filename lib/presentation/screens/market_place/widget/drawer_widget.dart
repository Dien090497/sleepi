import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SFText(keyText: 'Filter(0)'),
                SFText(keyText: 'Clear Filter'),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SFText(keyText: 'type'),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 110,
                  child: SFButton(text: 'Efficiency'),
                ),
                SizedBox(
                  width: 110,
                  child: SFButton(text: 'Luck'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                SizedBox(
                  width: 110,
                  child: SFButton(text: 'comfort'),
                ),
                SizedBox(
                  width: 110,
                  child: SFButton(text: 'Resilience'),
                ),
              ],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SFText(keyText: 'quality'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
