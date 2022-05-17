import 'package:flutter/material.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/screens/wire_staking/widgets/tab_slft_detail.dart';
import 'package:slee_fi/presentation/screens/wire_staking/widgets/tab_slgt_detail.dart';
import '../../../common/style/app_colors.dart';
import '../../../common/widgets/sf_back_button.dart';
import '../../../common/widgets/sf_sub_tab_bar.dart';

class WireStakingScreen extends StatelessWidget {
  const WireStakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Container(
                margin: const EdgeInsets.only(left: 8.0),
                alignment: Alignment.centerLeft,
                child: const SFBackButton(),
              ),
              SFText(keyText: "Staking", style: const TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: AppColors.black),),
              SFSubTabBar(
                texts: const ["SLFT", "SLGT"],
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
          ),
        ),
      ),
    );
  }
}
