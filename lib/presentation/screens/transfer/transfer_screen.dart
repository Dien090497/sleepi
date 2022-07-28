import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_list.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_widget.dart';

class TransferScreenArg {
  final String address;
  final bool isToSpending;

  TransferScreenArg({
    required this.address,
    required this.isToSpending,
  });
}

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as TransferScreenArg;

    return BlocBuilder<UserBloc, UserState>(
      builder: (context, spendingState) {
        return BlocBuilder<WalletCubit, WalletState>(
          builder: (context, walletState) {
            if (spendingState is UserLoaded &&
                walletState is WalletStateLoaded) {
              /// nếu wallet -> spending thì tokenFrom sẽ lấy từ spendingState
              final tokenFrom = args.isToSpending
                  ? walletState.tokenList
                      .firstWhere((e) => e.address == args.address)
                  : spendingState.listTokens
                      .firstWhere((e) => e.address == args.address);

              /// nếu wallet -> spending thì tokenTo sẽ lấy từ walletState
              final tokenTo = args.isToSpending
                  ? walletState.tokenList
                      .firstWhere((e) => e.address == args.address)
                  : spendingState.listTokens
                      .firstWhere((e) => e.address == args.address);
              return BlocProvider(
                create: (_) =>
                    TransferCubit(tokenFrom, tokenTo, args.isToSpending)
                      ..getFee(),
                child: Stack(
                  children: [
                    BackgroundWidget(
                      appBar: SFAppBar(
                        context: context,
                        title: LocaleKeys.transfer,
                        textStyle: TextStyles.bold18LightWhite,
                      ),
                      resizeToAvoidBottomInset: false,
                      child: DismissKeyboardWidget(
                        child: SafeArea(
                          bottom: false,
                          child: Column(
                            children: const [
                              TransferWidget(),
                              SizedBox(height: 24),
                              Expanded(
                                child: TransferList(),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<TransferCubit, TransferState>(
                      builder: (context, state) =>
                          state is TransferLoaded && state.isLoading
                              ? const LoadingScreen()
                              : const SizedBox(),
                    )
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        );
      },
    );
  }
}
