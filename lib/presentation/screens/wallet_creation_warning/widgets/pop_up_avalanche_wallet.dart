import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_cubit.dart';
import 'package:slee_fi/presentation/screens/wallet_creation_warning/widgets/pop_up_wallet_warning.dart';
import 'package:slee_fi/usecase/create_new_mnemonic_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

class PopUpAvalancheWallet extends StatelessWidget {
  const PopUpAvalancheWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CreateWalletCubit(),
      child: Padding(
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
                  Navigator.pop(context);
                  showCustomAlertDialog(
                    context,
                    children: PopUpWalletWarning(
                      onPressed: () {
                        final newSp =
                            getIt<CreateNewMnemonicUseCase>().call(NoParams());
                        newSp.fold(
                          (l) {
                            showMessageDialog(context, '$l');
                          },
                          (r) {
                            Navigator.pushNamed(context, R.createPasscode,
                                    arguments: r)
                                .then((value) {
                              Navigator.pop(context, value);
                            });
                          },
                        );
                      },
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 17),
            SFButton(
              text: LocaleKeys.import_a_wallet_using_seed_phrase,
              textStyle: TextStyles.w600WhiteSize16,
              height: 48,
              width: double.infinity,
              color: AppColors.blue,
              onPressed: () {
                Navigator.pushNamed(context, R.importWallet).then((value) {
                  Navigator.pop(context, value);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
