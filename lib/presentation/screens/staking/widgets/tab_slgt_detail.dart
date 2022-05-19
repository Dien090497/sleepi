import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class TabSLGTDetail extends StatelessWidget {
  const TabSLGTDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: SFText(keyText: "Coming soon",style: TextStyles.bold32black)),
      ),
    );
  }
}
