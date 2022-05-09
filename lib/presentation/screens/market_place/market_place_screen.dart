import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class MarketPlaceScreen extends StatelessWidget {
  const MarketPlaceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: SFText(keyText: 'MarketPlace Screen'),
          ),
        )
    );
  }
}
