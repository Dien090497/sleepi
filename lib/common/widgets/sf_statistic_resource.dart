import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/numeral_utils/numeral.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
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
        builder: (context, userState) {
          if (userState is UserLoaded) {
            final listTokens = userState.listTokens;
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: listTokens
                  .map<Widget>((e) => ItemResource(
                        value: formatToken(e.availableBalance),
                        url: e.icon,
                      ))
                  .toList()
                ..addAll([
                  const SizedBox(width: 12),
                  const SFIcon(Ics.icSolanaCircle)
                ]),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

String formatToken(num quantity) {
  return Numeral(quantity).format();
}

class ItemResource extends StatelessWidget {
  const ItemResource({Key? key, required this.value, required this.url})
      : super(key: key);
  final String value;
  final String url;

  @override
  Widget build(BuildContext context) {
    final sizeWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: sizeWidth * 0.01),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(url, width: url.contains('avax') ? 20 : null),
          const SizedBox(width: 4),
          SFText(keyText: value, style: TextStyles.white14),
        ],
      ),
    );
  }
}
