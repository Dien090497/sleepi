import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_back_button.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_logo.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_cubit.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/presentation/screens/passcode/create_passcode_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class PasscodeArguments {
  final String? route;
  final bool? isShowSuccessDialog;

  PasscodeArguments({this.route, this.isShowSuccessDialog});
}

class PasscodeScreen extends StatelessWidget {
  const PasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)?.settings.arguments as PasscodeArguments?;
    TextEditingController passCodeController = TextEditingController();

    return BlocProvider(
      create: (BuildContext context) => PasscodeCubit(),
      child: BlocConsumer<PasscodeCubit, PasscodeState>(
        listener: (context, state) {
          final cubit = context.read<PasscodeCubit>();
          if (state is checkPassCodeValid) {
            if (args != null) {
              Navigator.pushReplacementNamed(context, args.route! ,arguments: CreatePasscodeArguments(isShowSuccessDialog: args.isShowSuccessDialog ?? false) );
            } else {
              // _createWalletDialog(context);
              Navigator.pop(context, true);
            }
          } else {
            passCodeController.text = '';
            Future.delayed(
              const Duration(milliseconds: 2000),
              () => cubit.init(),
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<PasscodeCubit>();
          return BackgroundWidget(
            child: SafeArea(
              child: ListView(
                children: [
                  const SizedBox(height: 12.0),
                  Stack(
                    children: const [
                      Positioned(left: 10, top: 0, child: SFBackButton()),
                      Align(alignment: Alignment.center, child: SFLogo()),
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
                    child: PinCodeWidget(controller: passCodeController),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30,
                    child: state is checkPassCodeInValid
                        ? SFText(
                            keyText: LocaleKeys.incorrect_passcode,
                            style: TextStyles.red14)
                        : const SizedBox(),
                  ),
                  SizedBox(height: 15.h),
                  PasscodeNumPad(
                    passcodeController: passCodeController,
                    onCompleted: (String passcode) {
                      cubit.checkPassCode(passCodeController.text);
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
          );
        },
      ),
    );
  }
}
