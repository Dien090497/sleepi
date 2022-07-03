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
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/import_wallet/import_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/import_wallet/import_wallet_state.dart';

class ImportWalletScreen extends StatelessWidget {
  const ImportWalletScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cubit = ImportWalletCubit()..init();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<ImportWalletCubit, ImportWalletState>(
        listener: (context, state) {
          if (state is ImportWalletVerifyOtpSuccess) {
            Navigator.pushNamed(context, R.createPasscode).then((value) {
              if (value == true) {
                cubit.importWallet();
              }
            });
          }

          if (state is ImportWalletDone) {
            Future.delayed(
              const Duration(milliseconds: 200),
              () => Navigator.pop(
                  context,
                  PopWithResults(
                    fromPage: R.importWallet,
                    toPage: R.wallet,
                    results: {"data": state.entity},
                  )),
            );
          }
        },
        builder: (context, state) {
          return Stack(
            children: [
              DismissKeyboardWidget(
                child: BackgroundWidget(
                  resizeToAvoidBottomInset: false,
                  appBar: SFAppBar(
                    context: context,
                    title: LocaleKeys.secure_wallet,
                    textStyle: TextStyles.bold18LightWhite,
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              padding: const EdgeInsets.symmetric(vertical: 36),
                              children: [
                                SFCard(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      TextfieldVerificationEmail(
                                          maxLength: 6,
                                          onPressed: () => cubit.sendOtp(),
                                          valueChanged: (otp) =>
                                              cubit.otp = otp,
                                          errorText:
                                              state is ImportWalletErrorOtp
                                                  ? state.msg
                                                  : ''),
                                      const SizedBox(height: 20),
                                      SFTextField(
                                        controller: TextEditingController(
                                            text:
                                                'blind later more near guide door mystery cheap gap clip address appear'),
                                        labelText: LocaleKeys.seed_phrase,
                                        hintText: LocaleKeys
                                            .enter_the_seed_phrase_word,
                                        hintStyle: TextStyles.w400lightGrey12,
                                        onChanged: (mnemonic) =>
                                            cubit.mnemonic = mnemonic,
                                        maxLine: 10,
                                        maxLength: 256,
                                      ),
                                      const SizedBox(height: 5),
                                      if (state is ImportWalletErrorMnemonic)
                                        SFText(
                                          keyText: state.msg,
                                          style: TextStyles.w400Red12,
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SFButton(
                            text: LocaleKeys.import_wallet
                                .reCase(StringCase.titleCase),
                            textStyle: TextStyles.w600WhiteSize16,
                            height: 48,
                            width: double.infinity,
                            color: AppColors.blue,
                            onPressed: () {
                              FocusScope.of(context).unfocus();
                              cubit.process();
                            },
                          ),
                          const SizedBox(height: 24)
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state is ImportWalletInitial && state.isLoading)
                const LoadingScreen()
            ],
          );
        },
      ),
    );
  }
}
