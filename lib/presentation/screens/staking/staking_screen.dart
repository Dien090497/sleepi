import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/tab_slft_detail.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/tab_slgt_detail.dart';

class StakingScreen extends StatelessWidget {
  const StakingScreen({Key? key}) : super(key: key);

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
          ),
        ),
      ),
    );
  }
}
