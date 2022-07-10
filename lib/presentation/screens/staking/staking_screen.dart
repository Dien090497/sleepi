import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/staking_list.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/top_bar_staking.dart';

class StakingScreen extends StatelessWidget {
  const StakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: SafeArea(
          child: BlocBuilder<UserBloc, UserState>(
            builder: (context, state) {
              final tokenList = <TokenEntity>[];
              if (state is UserLoaded) {
                tokenList.addAll(state.listTokens);
              }
              return Column(
                  children: [
                    TopBarStaking(
                      valueGold: tokenList.first.balance,
                      valueSilver: tokenList.elementAt(1).balance,
                    ),
                    Expanded(child: StakingList(balanceSlft: tokenList.isNotEmpty ? tokenList.first.balance : 0,)),
                  ]);
            },
          )),
    );
  }
}
