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
    final spendingState = context.watch<UserBloc>().state;
    final walletState = context.watch<WalletCubit>().state;

    if (spendingState is UserLoaded && walletState is WalletStateLoaded) {
      try {
        final spendingToken = spendingState.listTokens.firstWhere(
            (e) => e.address.toLowerCase() == args.address.toLowerCase());
        final walletToken = walletState.tokenList.firstWhere(
            (e) => e.address.toLowerCase() == args.address.toLowerCase());

        /// nếu wallet -> spending thì currentToken sẽ lấy từ spendingState
        final currentToken = args.isToSpending ? walletToken : spendingToken;

        /// nếu wallet -> spending thì backupToken sẽ lấy từ walletState
        final backupToken = args.isToSpending ? spendingToken : walletToken;
        return BlocProvider(
          create: (_) => TransferCubit(args.isToSpending,
              currentToken: currentToken,
              backupToken: backupToken,
              spendingTokens: spendingState.listTokens,
              walletTokens: walletState.tokenList)
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
                        Expanded(child: TransferList()),
                      ],
                    ),
                  ),
                ),
              ),
              BlocBuilder<TransferCubit, TransferState>(
                builder: (_, state) =>
                    state is TransferLoaded && state.isLoading
                        ? const LoadingScreen()
                        : const SizedBox(),
              )
            ],
          ),
        );
      } catch (e) {
        return BackgroundWidget(
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.transfer,
            textStyle: TextStyles.bold18LightWhite,
          ),
          child: const LoadingIcon(),
        );
      }
    }
    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.transfer,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: const LoadingIcon(),
    );
  }
}
