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

class ImportWalletScreen extends StatefulWidget {
  const ImportWalletScreen({Key? key}) : super(key: key);

  @override
  State<ImportWalletScreen> createState() => _ImportWalletScreenState();
}

class _ImportWalletScreenState extends State<ImportWalletScreen> {

  TextEditingController controllerMnemonic = TextEditingController();
  TextEditingController controllerOTP = TextEditingController();


  @override
  void dispose() {
    controllerMnemonic.dispose();
    controllerOTP.dispose();
    super.dispose();
  }

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
                cubit.importWallet(mnemonic: controllerMnemonic.text);
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
                                          errorText:
                                              state is ImportWalletErrorOtp
                                                  ? state.msg
                                                  : '',
                                        controller: controllerOTP,
                                      ),
                                      const SizedBox(height: 20),
                                      SFTextField(
                                        labelText: LocaleKeys.seed_phrase,
                                        hintText: LocaleKeys
                                            .enter_the_seed_phrase_word,
                                        hintStyle: TextStyles.w400lightGrey12,
                                        maxLine: 10,
                                        maxLength: 256,
                                        controller: controllerMnemonic,
                                      ),
                                      const SizedBox(height: 5),
                                      if (state is ImportWalletErrorMnemonic )
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
                              cubit.process(otp: controllerOTP.text, mnemonic: controllerMnemonic.text);
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
