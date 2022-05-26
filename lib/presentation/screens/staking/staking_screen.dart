import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/staking_list.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/top_bar_staking.dart';

class StakingScreen extends StatelessWidget {
  const StakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        body: SafeArea(
          child: Column(
            children: const [
              TopBarStaking(valueGold: 47.52, valueSilver: 52.88,),
              Expanded(child: StakingList()),
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                alignment: Alignment.centerLeft,
                child: const SFBackButton(),
              ),
              SFText(keyText: Keys.staking, style: TextStyles.bold40black),
              SFSubTabBar(
                texts: const [Keys.slft, Keys.slgt],
              ),
              const SizedBox(height: 35),
              const Expanded(
                child: TabBarView(
                  children: [
                    TabSLFTDetail(),
                    TabSLGTDetail(),
                  ],
                ),
              ),
            ],
          )
        ),
      ),
    );
  }
}
