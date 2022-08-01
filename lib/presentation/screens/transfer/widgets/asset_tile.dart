import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_list_tile.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';

class AssetTile extends StatelessWidget {
  const AssetTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransferCubit, TransferState>(
      builder: (context, state) {
        if (state is TransferLoaded) {
          final selectedToken = state.currentToken;
          final tokens =
              state.isToSpending ? state.walletTokens : state.spendingTokens;
          print('### $tokens');
          return SFCard(
            onTap: () {
              final cubit = context.read<TransferCubit>();
              SFModalBottomSheet.show(
                  context,
                  0.6,
                  ModalTransferBetween(
                    onSelect: (token) {
                      cubit.selectToken(token);
                    },
                    selectedToken: selectedToken,
                    tokens: tokens,
                  ));
            },
            child: SFListTile(
              leading: SFIcon(selectedToken.icon),
              text: selectedToken.name.toUpperCase(),
              textStyle: TextStyles.lightWhite16,
              trailing: const Icon(Icons.keyboard_arrow_down,
                  color: AppColors.lightGrey),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}

class ModalTransferBetween extends StatelessWidget {
  const ModalTransferBetween({
    required this.onSelect,
    required this.tokens,
    required this.selectedToken,
    Key? key,
  }) : super(key: key);

  final ValueChanged<TokenEntity> onSelect;
  final List<TokenEntity> tokens;
  final TokenEntity selectedToken;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tokens.length,
      shrinkWrap: true,
      padding: const EdgeInsets.all(24.0),
      itemBuilder: (BuildContext context, int i) {
        final token = tokens[i];
        final icon = token.icon;
        final isAvax = token.name.toLowerCase() == 'avax';
        return SFCard(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          margin: const EdgeInsets.only(top: 8.0),
          radius: 8,
          child: SFListTile(
              leading: Padding(
                padding: EdgeInsets.only(left: isAvax ? 4.0 : 0),
                child: SFIcon(
                  icon,
                  width: isAvax ? 32 : 40,
                  height: isAvax ? 32 : 40,
                ),
              ),
              text: token.name.toUpperCase(),
              textStyle: TextStyles.lightWhite16,
              trailing: token.address == selectedToken.address
                  ? const Icon(
                      Icons.check,
                      color: AppColors.green,
                      size: 32,
                    )
                  : const SizedBox()),
          onTap: () {
            onSelect(token);
            Navigator.pop(context);
          },
        );
      },
    );
  }
}
