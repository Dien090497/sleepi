import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
import 'package:slee_fi/common/widgets/textfield_verification.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/pop_with_result.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/create_wallet/create_wallet_state.dart';

class CreateWalletScreen extends StatefulWidget {
  const CreateWalletScreen({Key? key}) : super(key: key);

  @override
  State<CreateWalletScreen> createState() => _CreateWalletScreenState();
}

class _CreateWalletScreenState extends State<CreateWalletScreen> {


  @override
  Widget build(BuildContext context) {
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
          return Stack(
            children: [
              DismissKeyboardWidget(
                child: BackgroundWidget(
                  appBar: SFAppBar(
                    context: context,
                    title: LocaleKeys.create_wallet,
                    textStyle: TextStyles.bold18LightWhite,
                  ),
                  child: SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 23),
                      child: Column(
                        children: [
                          Expanded(
                            child: ListView(
                              children: [
                                SFCard(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 24),
                                  child: Column(
                                    children: [
                                      TextfieldVerificationEmail(
                                          maxLength: 6,
                                          onPressed: () => cubit.sendOtp(),
                                          valueChanged: (otp) =>
                                              cubit.otp = otp,
                                          errorText: ''),
                                      const SizedBox(height: 16),
                                      SFText(
                                        keyText: LocaleKeys
                                            .you_have_already_created_a_wallet_address,
                                        style: TextStyles.w400lightGrey12,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SFButton(
                            text: LocaleKeys.create_wallet,
                            textStyle: TextStyles.w600WhiteSize16,
                            height: 48,
                            width: double.infinity,
                            color: AppColors.blue,
                            onPressed: () => cubit.process(),
                          ),
                          const SizedBox(height: 24),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              if (state is createWalletStateInitial && state.isLoading)
                const LoadingScreen(),
            ],
          );
        },
      ),
    );
  }
}
