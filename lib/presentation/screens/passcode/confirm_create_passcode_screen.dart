import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';
import 'package:slee_fi/usecase/create_pass_code_usecase.dart';
import 'package:slee_fi/usecase/wallet/import_wallet_usecase.dart';

class ConfirmCreatePasscodeArguments {
  final String passcode;
  final String? mnemonic;

  ConfirmCreatePasscodeArguments(this.passcode, this.mnemonic);
}

class ConfirmCreatePasscodeScreen extends StatelessWidget {
  const ConfirmCreatePasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
        as ConfirmCreatePasscodeArguments;

    final TextEditingController passcodeController = TextEditingController();
    bool wrongPassword = false;
    bool isLoading = false;

    return BackgroundWidget(
      appBar: SFAppBar(
        context: context,
        title: LocaleKeys.secure_wallet,
        textStyle: TextStyles.bold18LightWhite,
      ),
      child: SafeArea(
        child: StatefulBuilder(builder: (context, setState) {
          return Stack(
            children: [
              ListView(
                children: [
                  const SizedBox(height: 65),
                  Center(
                      child: SFText(
                          keyText: LocaleKeys.confirm_your_passcode,
                          style: TextStyles.white12)),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 40,
                    child: PinCodeWidget(controller: passcodeController),
                  ),
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30,
                        child: wrongPassword
                            ? SFText(
                                keyText: LocaleKeys.incorrect_passcode,
                                style: TextStyles.red14)
                            : const SizedBox(),
                      ),
                      SizedBox(height: 15.h),
                      PasscodeNumPad(
                        passcodeController: passcodeController,
                        onCompleted: (String passcode) async {
                          if (passcode != args.passcode) {
                            setState(() => wrongPassword = true);
                            passcodeController.clear();
                          } else if (passcode == args.passcode) {
                            setState(() => isLoading = true);
                            final createPassCodeUC =
                                await getIt<CreatePassCodeUseCase>()
                                    .call(passcode);
                            await createPassCodeUC.fold(
                              (l) async {
                                showMessageDialog(context, '$l');
                              },
                              (r) async {
                                final mnemonic = args.mnemonic;
                                if (mnemonic != null) {
                                  final importRes =
                                      await getIt<ImportWalletUseCase>()
                                          .call(mnemonic);
                                  importRes.fold(
                                    (l) {
                                      showMessageDialog(context, '$l');
                                    },
                                    (r) {
                                      context
                                          .read<WalletCubit>()
                                          .loadCurrentWallet(r);
                                      Navigator.pop(context);
                                      Navigator.pop(context, true);
                                    },
                                  );
                                } else {
                                  final res =
                                      await getIt<CreatePassCodeUseCase>()
                                          .call(passcode);
                                  res.fold(
                                    (l) {
                                      showMessageDialog(context, '$l');
                                    },
                                    (r) {
                                      Navigator.pop(context);
                                      Navigator.pop(context, true);
                                    },
                                  );
                                }
                              },
                            );
                          }
                          setState(() => isLoading = false);
                        },
                      )
                    ],
                  ),

                  SizedBox(height: 32.h),
                  // SFTextButton(
                  //   text: LocaleKeys.forgotPasscode,
                  //   textStyle: TextStyles.white12Underline,
                  //   onPressed: () {Navigator.pushNamed(context, R.restoreWallet);},
                  // )
                ],
              ),
              if (isLoading) const LoadingIcon(),
            ],
          );
        }),
      ),
    );
  }
}
