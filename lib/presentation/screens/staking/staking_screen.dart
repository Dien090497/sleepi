import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/staking_list.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/top_bar_staking.dart';

class StakingArguments {
  final List tokenList ;

  StakingArguments({required this.tokenList});
}
class StakingScreen extends StatelessWidget {
  const StakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
          child: Column(children: const [
            TopBarStaking(
              valueGold: 47.52,
              valueSilver: 52.88,
            ),
            Expanded(child: StakingList()),
          ])),
    );
  }
}
