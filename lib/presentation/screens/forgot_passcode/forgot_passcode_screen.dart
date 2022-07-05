import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/forgot_passcode/forgot_passcode_cubit.dart';
import 'package:slee_fi/presentation/blocs/forgot_passcode/forgot_passcode_state.dart';

class ForgotPasscodeScreen extends StatelessWidget {
  const ForgotPasscodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasscodeCubit()..init(),
      child: Stack(
        children: [
          DismissKeyboardWidget(
            child: BackgroundWidget(
              resizeToAvoidBottomInset: false,
              appBar: SFAppBar(
                context: context,
                title: LocaleKeys.forgot_passcode.reCase(StringCase.titleCase),
                textStyle: TextStyles.bold18LightWhite,
              ),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ListView(
                        padding: const EdgeInsets.symmetric(horizontal: 24.0),
                        children: [
                          SFCard(
                            margin: const EdgeInsets.only(top: 16.0),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 12.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 24),
                                BlocBuilder<ForgotPasscodeCubit,
                                    ForgotPasscodeState>(
                                  builder: (context, state) {
                                    final cubit =
                                        context.read<ForgotPasscodeCubit>();
                                    return TextfieldVerificationEmail(
                                        maxLength: 6,
                                        validate: () =>
                                            cubit.checkExistsEmail(),
                                        onPressed: () => cubit.sendOTP(),
                                        valueChanged: (otp) => cubit.otp = otp,
                                        errorText:
                                            state is ForgotPasscodeStateError
                                                ? state.message
                                                : '');
                                  },
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
                      child: BlocConsumer<ForgotPasscodeCubit,
                          ForgotPasscodeState>(
                        listener: (context, state) {
                          if (state is ForgotPasscodeStateSuccess) {
                            Navigator.pushNamed(context, R.createPasscode)
                                .then((value) {
                              if (value == true) {
                                Navigator.pop(context);
                                Navigator.pop(context);
                                showSuccessfulDialog(context,
                                    LocaleKeys.reset_passcode_successfully);
                              }
                            });
                          }
                        },
                        builder: (context, state) => SFButton(
                          text: LocaleKeys.next,
                          textStyle: TextStyles.w600WhiteSize16,
                          height: 48,
                          width: double.infinity,
                          gradient: AppColors.gradientBlueButton,
                          onPressed: () {
                            context.read<ForgotPasscodeCubit>().verifyOtp();
                          },
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          BlocBuilder<ForgotPasscodeCubit, ForgotPasscodeState>(
            builder: (context, state) => state is ForgotPasscodeStateProcess
                ? const LoadingScreen()
                : const SizedBox(),
          )
        ],
      ),
    );
  }
}
