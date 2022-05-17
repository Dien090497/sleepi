import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: const BoxDecoration(
                      color: Colors.cyanAccent, shape: BoxShape.circle),
                  child: const Icon(
                    Icons.arrow_back_ios,
                  ),
                ),
                SFText(keyText: 'FeedBack'),
                const SizedBox(),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 30),
              child: Row(
                children: [
                  SizedBox(
                    width: size.width / 3,
                    child: const SFTextField(),
                  ),
                  const SizedBox(width: 10),
                  const Expanded(child: SFTextField()),
                ],
              ),
            ),
            const SFTextField(
              maxLine: 8,
              maxLenght: 100,
            ),
            const Spacer(),
            SFButton(
              text: 'Submit',
              width: size.width,
            )
          ],
        ),
      ),
    ));
  }
}
