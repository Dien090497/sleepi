import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_state.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_wallet_warning.dart';

import 'pop_up_warning_bind_wallet.dart';

class PopUpAvalancheWallet extends StatelessWidget {
  const PopUpAvalancheWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLoadingCreateWallet = false;
    return BlocProvider(
      create: (_) => CreateWalletCubit()..init(),
      child: BlocConsumer<CreateWalletCubit, CreateWalletState>(
        listener: (context, state) {
          if (state is createWalletDone) {
            Navigator.pop(
                context,
                PopWithResults(
                  fromPage: R.createWallet,
                  toPage: R.wallet,
                  results: {"data": state.entity},
                ));
          }
        },
        builder: (context, state) {
          final cubit = context.read<CreateWalletCubit>();
          return isLoadingCreateWallet
              ? const Padding(
                  padding: EdgeInsets.all(24.0),
                  child: SizedBox(
                    height: 100,
                    child: Center(child: CircularProgressIndicator()),
                  ),
                )
              : Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SFText(
                        keyText: LocaleKeys.avalanche_wallet,
                        style: TextStyles.bold18LightWhite,
                      ),
                      const SizedBox(height: 32),
                      SizedBox(
                          height: 48,
                          child: SFButtonOutLined(
                            title: LocaleKeys.create_a_new_wallet,
                            textStyle: TextStyles.bold16Blue,
                            borderColor: AppColors.blue,
                            onPressed: () {
                              showCustomAlertDialog(context, showClosed: false,
                                  children:
                                      PopUpWarningBindWallet(onPressed: () {
                                Navigator.pop(context);
                                showCustomAlertDialog(context,
                                        children: const PopUpWalletWarning())
                                    .then((value) => {
                                          Navigator.pushNamed(
                                                  context, R.createPasscode)
                                              .then((value) {
                                            if (value == true) {
                                              cubit.createWallet();
                                              isLoadingCreateWallet = true;
                                            }
                                          })
                                        });
                              }));
                            },
                          )),
                      const SizedBox(height: 17),
                      SFButton(
                        text: LocaleKeys.import_a_wallet_using_seed_phrase,
                        textStyle: TextStyles.w600WhiteSize16,
                        height: 48,
                        width: double.infinity,
                        color: AppColors.blue,
                        onPressed: () async {
                          showCustomAlertDialog(context, showClosed: false,
                              children: PopUpWarningBindWallet(onPressed: () {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, R.importWallet)
                                .then((value) {
                              if (value is PopWithResults) {
                                Navigator.pop(context, value);
                              }
                            });
                          }));
                        },
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
