import 'package:flutter/material.dart';

import '../../../../common/widgets/sf_text.dart';

class TabSLGTDetail extends StatelessWidget {
  const TabSLGTDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(child: SFText(keyText: "Coming soon",style: const TextStyle(fontSize: 32),)),
      ),
    );
  }
}
