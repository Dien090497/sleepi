import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_state.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_list.dart';
import 'package:slee_fi/presentation/screens/transfer/widgets/transfer_widget.dart';

class TransferScreenArg {
  final TokenEntity tokenEntity;
  final bool fromSpendingToWallet;
  final TransferType transferType;

  TransferScreenArg(
      this.tokenEntity, this.fromSpendingToWallet, this.transferType);
}

class TransferScreen extends StatelessWidget {
  const TransferScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as TransferScreenArg;

    return BlocProvider(
      create: (_) => TransferCubit(!args.fromSpendingToWallet),
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
                  children: [
                    const TransferWidget(),
                    const SizedBox(height: 24),
                    Expanded(
                      child: TransferList(
                        transferType: args.transferType,
                        tokenEntity: args.tokenEntity,
                        spendingToWallet: args.fromSpendingToWallet,
                      ),
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
}
