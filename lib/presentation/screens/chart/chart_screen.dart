import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class ChartScreen extends StatelessWidget {
  const ChartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Center(
        child: Column(
          children: [
            SFText(keyText: 'keyText'),
          ],
        ),
      ),
    ));
  }
}
