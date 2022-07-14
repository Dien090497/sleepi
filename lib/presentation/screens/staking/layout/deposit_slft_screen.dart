import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/toast_utils.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/staking/staking_cubit.dart';
import 'package:slee_fi/presentation/blocs/staking/staking_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';

class DepositSlftArguments {
  final double? balanceSlft;

  DepositSlftArguments({this.balanceSlft});
}
class DepositSlftScreen extends StatefulWidget {
  const DepositSlftScreen({Key? key}) : super(key: key);

  @override
  State<DepositSlftScreen> createState() => _DepositSlftScreenState();
}

class _DepositSlftScreenState extends State<DepositSlftScreen> {
  late TextEditingController _amountEditingController;
  String? error;

  @override
  void initState() {
    _amountEditingController = TextEditingController()
      ..addListener(() {

      });
    super.initState();
  }

  @override
  void dispose() {
    _amountEditingController.dispose();
    super.dispose();
  }

  onValidValue(balance) {
    final result = _amountEditingController.text.toString().contains(',')
        ? _amountEditingController.text.toString().replaceAll(',', '.')
        : _amountEditingController.text.toString();
    if (_amountEditingController.text.isEmpty) {
      error = LocaleKeys.this_field_is_required.tr();
    }else if (double.parse(result) > balance) {
        error = LocaleKeys.you_dont_have_enough_money_to_staking.tr();
      } else if (double.parse(result) == 0) {
        error = LocaleKeys.amount_input_can_not_be_zero.tr();
      } else {
        error = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)?.settings.arguments
    as DepositSlftArguments?;

    return BlocProvider(
      create: (context) => StakingCubit()..init(),
      child: BlocConsumer<StakingCubit, StakingState>(
        listener: (context, state) {
          if (state is StakingStateError) {
            ToastUtils.showToastBottom(state.message, null);
          }
          if(state is StakingStateStakingSuccess){
            Navigator.pop(context, true);
            showSuccessfulDialog(context, null);
            context.read<UserBloc>().add(RefreshBalanceToken());
          }
        },
        builder: (context, state) {
          final cubit = context.read<StakingCubit>();

          return DismissKeyboardWidget(
            child: BackgroundWidget(
                resizeToAvoidBottomInset: false,
                appBar: SFAppBar(
                  context: context,
                  title: LocaleKeys.deposit_token.tr(args: ['SLFT']),
                  textStyle: TextStyles.bold18LightWhite,
                ),
                child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.symmetric(horizontal: 24.0),
                            children: [
                              SFCard(
                                margin: const EdgeInsets.only(top: 16.0),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 24.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                            child: SFText(
                                              keyText: LocaleKeys.your_token_in_spending
                                                  .tr(namedArgs: {"token": "SLFT"}),
                                              style: TextStyles.lightGrey12,
                                            )),
                                        SFText(
                                          keyText: "${args?.balanceSlft!.formatBalanceToken ?? "xxx"} SLFT",
                                          style: TextStyles.lightGrey12,
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 12.0,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SFText(
                                          keyText: LocaleKeys.deposit,
                                          style: TextStyles.bold18LightWhite,
                                        ),
                                        // Row(
                                        //   crossAxisAlignment: CrossAxisAlignment.center,
                                        //   children: [
                                        //     const SFIcon(
                                        //       Ics.icSlft,
                                        //       width: 30,
                                        //       height: 30,
                                        //     ),
                                        //     const SizedBox(
                                        //       width: 6,
                                        //     ),
                                        //     SFText(
                                        //       keyText: "XXX",
                                        //       style: TextStyles.lightWhite16,
                                        //     )
                                        //   ],
                                        // ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 21,
                                    ),
                                    Row(
                                      children: [
                                         Expanded(
                                            child: SFTextField(
                                              controller: _amountEditingController,
                                              showLabel: false,
                                              inputFormatters: [
                                                FilteringTextInputFormatter
                                                    .allow(RegExp(
                                                    r'^\d{1,}[.,]?\d{0,6}')),
                                              ],
                                              textInputType:
                                              const TextInputType.numberWithOptions(
                                                  decimal: true),
                                              errorText: error,
                                              // hintText: LocaleKeys.amount,
                                            )),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        SFButtonOutLined(
                                            title: LocaleKeys.max,
                                            textStyle: TextStyles.bold14Blue,
                                            borderColor: AppColors.blue,
                                            onPressed: () {
                                              if(args != null){
                                                setState((){
                                                  _amountEditingController.text = args.balanceSlft!.formatBalanceToken.toString();
                                                });
                                              }
                                            }),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24.0),
                          child: Column(
                            children: [
                              SFButton(
                                text: LocaleKeys.confirm,
                                textStyle: TextStyles.w600WhiteSize16,
                                height: 48,
                                width: double.infinity,
                                color: AppColors.blue,
                                onPressed: () {
                                  setState((){
                                    onValidValue(args?.balanceSlft!);
                                    if(error!.isEmpty){
                                      showCustomDialog(context, children: [
                                        PopUpStaking(
                                            message: LocaleKeys.do_you_really_want_to_deposit
                                                .tr(namedArgs: {
                                              'amount': _amountEditingController.value.text,
                                              'token': 'SLFT',
                                            }),
                                            onPressed: () {
                                              final result = _amountEditingController.text.toString().contains(',')
                                                  ? _amountEditingController.text.toString().replaceAll(',', '.')
                                                  : _amountEditingController.text.toString();
                                              double amount = double.parse(result);
                                              cubit.staking(amount);
                                            }
                                        )
                                      ]);
                                    }
                                  });
                                },
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              SizedBox(
                                  height: 48,
                                  child: SFButtonOutLined(
                                    title: LocaleKeys.cancel,
                                    textStyle: TextStyles.bold16Blue,
                                    borderColor: AppColors.blue,
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  )),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                      ],
                    ))),
          );
        },
      ),
    );
  }
}

