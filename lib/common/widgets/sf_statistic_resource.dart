import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/resources/resources.dart';

class SFStatisticResource extends StatelessWidget {
  const SFStatisticResource({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.white.withOpacity(0.15)),
        borderRadius: BorderRadius.circular(100),
      ),
      child: BlocBuilder<UserBloc, UserState>(
        builder: (context, state) {
          final tokenList = <TokenEntity>[];

          if (state is UserLoaded) {
            tokenList.addAll(state.tokens);
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 4),
              ItemResource(value: tokenList[0].balance, url: tokenList[0].icon),
              const SizedBox(width: 16),
              ItemResource(value: tokenList[1].balance, url: tokenList[1].icon),
              const SizedBox(width: 16),
              ItemResource(value: tokenList[2].balance, url: tokenList[2].icon),
              const SizedBox(width: 12),
              const SFIcon(Ics.icSolanaCircle),
            ],
          );
        },
      ),
    );
  }
}

class ItemResource extends StatelessWidget {
  const ItemResource({Key? key, required this.value, required this.url})
      : super(key: key);
  final double value;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SvgPicture.asset(url),
        const SizedBox(width: 4),
        Text(value.toStringAsFixed(2), style: TextStyles.white14),
      ],
    );
  }
}
