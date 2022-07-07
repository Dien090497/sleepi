import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/transfer_spending/transfer_cubit.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_state.dart';

class PopUpConfirmTransfer extends StatelessWidget {
  const PopUpConfirmTransfer({
    Key? key,
    required this.fee,
    required this.cubit,
    required this.amount,
    required this.tokenName,
    required this.contractAddress,

  }) : super(key: key);

  final double fee;
  final TransferCubit cubit;
  final double amount;
  final String tokenName;
  final String contractAddress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          SFText(
            keyText: LocaleKeys.confirm_transfer,
            style: TextStyles.bold18LightWhite,
          ),
          const SizedBox(height: 24),
          SFCard(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SFText(
                        keyText: LocaleKeys.from,
                        style: TextStyles.lightGrey12,
                      ),
                      const SizedBox(height: 12.0),
                      SFText(
                        keyText: LocaleKeys.wallet,
                        style: TextStyles.bold18White,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SFText(
                        keyText: LocaleKeys.to,
                        style: TextStyles.lightGrey12,
                      ),
                      const SizedBox(
                        height: 12.0,
                      ),
                      SFText(
                        keyText: LocaleKeys.spending,
                        style: TextStyles.bold18White,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 12.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.fee,
                style: TextStyles.lightGrey14,
              ),
              Expanded(
                  child: SFText(
                      keyText: "$fee AVAX",
                      style: TextStyles.lightWhite16,
                      textAlign: TextAlign.end)),
            ],
          ),
          const SizedBox(
            height: 8.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SFText(
                keyText: LocaleKeys.you_will_transfer,
                style: TextStyles.lightGrey14,
              ),
              Expanded(
                  child: SFText(
                keyText: "$amount ${tokenName.toUpperCase()}",
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.end,
              )),
            ],
          ),
          const SizedBox(
            height: 32.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SFButton(
                  text: LocaleKeys.cancel,
                  textStyle: TextStyles.w600LightGreySize16,
                  color: AppColors.light4,
                  width: double.infinity,
                  onPressed: () => Navigator.maybePop(context),
                ),
              ),
              const SizedBox(
                width: 16.0,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, userState) {
                  if (userState is UserLoaded) {
                    return Expanded(
                      child: SFButton(
                        text: LocaleKeys.confirm,
                        textStyle: TextStyles.bold14LightWhite,
                        width: double.infinity,
                        gradient: AppColors.gradientBlueButton,
                        onPressed: () {
                          Navigator.pop(context);
                          //showSuccessfulDialog(context, null);
                          cubit.transferSpending(amount: amount, addressContract: contractAddress, userId: userState.userInfoEntity.id);
                        },
                      ),
                    );
                    //return ProfileWidget(userInfo: userState.userInfoEntity);
                  }
                  return const SizedBox();
                },
              ),
              /*Expanded(
                child: SFButton(
                  text: LocaleKeys.confirm,
                  textStyle: TextStyles.bold14LightWhite,
                  width: double.infinity,
                  gradient: AppColors.gradientBlueButton,
                  onPressed: () {
                    Navigator.pop(context);
                    //showSuccessfulDialog(context, null);
                    cubit.transferSpending(amount: amount, addressContract: contractAddress);
                  },
                ),
              ),*/
            ],
          )
        ],
      ),
    );
  }
}
