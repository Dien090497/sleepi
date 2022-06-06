import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/resources/resources.dart';

class TabTrophyDetail extends StatelessWidget {
  const TabTrophyDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.3),
      child: const Center(child: SFIcon(Imgs.commingSoon)),
    );
  }
}
