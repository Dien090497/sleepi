import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_cubit.dart';
import 'package:slee_fi/presentation/blocs/passcode/passcode_state.dart';
import 'package:slee_fi/presentation/screens/passcode/confirm_create_passcode_screen.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/passcode_numpad.dart';
import 'package:slee_fi/presentation/screens/passcode/widgets/pin_code_widget.dart';

class CreatePasscodeArguments {
  final String? route;
  final bool? isShowSuccessDialog;

  CreatePasscodeArguments({
    this.route,
    this.isShowSuccessDialog,
  });
}

class CreatePasscodeScreen extends StatelessWidget {
  const CreatePasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mnemonic = ModalRoute.of(context)?.settings.arguments as String?;
    final TextEditingController passCodeController = TextEditingController();

    return BlocConsumer<PasscodeCubit, PasscodeState>(
      listener: (context, state) {
        // if (state is createPassCodeDone) {
        //   if (args != null && args.route != null) {
        //     Navigator.pushNamed(context, args.route!).then((results) {
        //       Navigator.pop(context, results);
        //     });
        //   } else {
        //     Navigator.pushNamed(context, R.confirmPasscode,
        //             arguments: ConfirmCreatePasscodeArguments(state.passcode))
        //         .then((confirmSuccess) {
        //       if (confirmSuccess == true) {
        //         Navigator.pop(context, confirmSuccess);
        //         args?.isShowSuccessDialog == true
        //             ? showSuccessfulDialog(
        //                 context, LocaleKeys.reset_passcode_successfully,
        //                 padding: const EdgeInsets.all(10),
        //                 style: TextStyles.bold14White)
        //             : null;
        //       }
        //     });
        //   }
        // }
      },
      builder: (context, state) {
        return BackgroundWidget(
          appBar: SFAppBar(
            context: context,
            title: LocaleKeys.secure_wallet,
            textStyle: TextStyles.bold18LightWhite,
          ),
          child: SafeArea(
            child: ListView(
              children: [
                const SizedBox(height: 65),
                Center(
                    child: SFText(
                        keyText: LocaleKeys.create_your_passcode,
                        style: TextStyles.white12)),
                const SizedBox(height: 12),
                PinCodeWidget(controller: passCodeController),
                SizedBox(height: 4.h),
                PasscodeNumPad(
                  passcodeController: passCodeController,
                  onCompleted: (String passcode) {
                    Navigator.pushNamed(context, R.confirmPasscode,
                        arguments:
                            ConfirmCreatePasscodeArguments(passcode, mnemonic));
                    passCodeController.clear();
                  },
                ),
                SizedBox(height: 32.h),
                // SFTextButton(
                //   text: LocaleKeys.forgotPasscode,
                //   textStyle: TextStyles.white12Underline,
                //   onPressed: () {Navigator.pushNamed(context, R.restoreWallet);},
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}
