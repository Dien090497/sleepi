import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_cubit.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/wallet/wallet_state.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class PasscodeArguments {
  final String? route;
  final bool? isShowSuccessDialog;
  final dynamic argNewRoute;

  PasscodeArguments({this.route, this.isShowSuccessDialog, this.argNewRoute});
}

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController passCodeController = TextEditingController();

    return BlocProvider(
      create: (_) => PasscodeCubit(),
      child: BlocConsumer<PasscodeCubit, PasscodeState>(
        listener: (context, state) {
          if (state is PasscodeValid) {
            final walletCubit = context.read<WalletCubit>();
            walletCubit.getWallet().then((_) => Navigator.pop(context, true));
          }
          if (state is PasscodeError) {
            passCodeController.clear();
          }
        },
        builder: (context, state) {
          final cubit = context.read<PasscodeCubit>();

          return BlocBuilder<WalletCubit, WalletState>(
            builder: (context, walletState) {
              return Stack(
                children: [
                  BackgroundWidget(
                    child: SafeArea(
                      child: ListView(
                        children: [
                          const SizedBox(height: 12.0),
                          Stack(
                            children: const [
                              Positioned(
                                  left: 10, top: 0, child: SFBackButton()),
                              Align(
                                  alignment: Alignment.center, child: SFLogo()),
                            ],
                          ),
                          const SizedBox(height: 60),
                          Center(
                            child: SFText(
                                keyText: LocaleKeys.enter_your_passcode,
                                style: TextStyles.white12),
                          ),
                          const SizedBox(height: 24),
                          SizedBox(
                            height: 40,
                            child:
                                PinCodeWidget(controller: passCodeController),
                          ),
                          Container(
                            alignment: Alignment.center,
                            height: 30,
                            child: state is PasscodeError
                                ? SFText(
                                    keyText: state.msg, style: TextStyles.red14)
                                : const SizedBox(),
                          ),
                          SizedBox(height: 15.h),
                          PasscodeNumPad(
                            passcodeController: passCodeController,
                            onCompleted: (String passcode) {
                              cubit.validate(passCodeController.text);
                            },
                          ),
                          SizedBox(height: 32.h),
                          SFTextButton(
                            text: "${LocaleKeys.forgot_passcode.tr()}?",
                            textStyle: TextStyles.white12Underline,
                            onPressed: () {
                              Navigator.pushNamed(context, R.forgotPasscode);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  if (state is PasscodeLoading ||
                      walletState is WalletStateLoading)
                    const LoadingIcon(),
                ],
              );
            },
          );
        },
      ),
    );
  }
}
