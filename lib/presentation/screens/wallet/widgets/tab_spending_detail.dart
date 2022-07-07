import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/token/token_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_cubit.dart';
import 'package:slee_fi/presentation/blocs/global_wallet/global_wallet_state.dart';
import 'package:slee_fi/presentation/screens/passcode/passcode_screen.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/pop_up_info_spending.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/spending_detail_list.dart';

class TabSpendingDetail extends StatelessWidget {
  const TabSpendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 19.0,
                ),
                const PopupInfoSpending(),
                const SizedBox(height: 12.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: BlocBuilder<GlobalWalletCubit, GlobalWalletState>(
                    builder: (context, state) {
                      final tokenList = <TokenEntity>[];

                      if (state is GlobalWalletStateLoaded) {
                        tokenList.addAll(state.tokenList);
                      }
                      return Column(
                        children: tokenList
                            .map((e) => SFCard(
                                  // onTap: () => Navigator.pushNamed(context, R.staking),
                                  margin: const EdgeInsets.only(top: 8),
                                  child: ListTile(
                                    leading:  SFIcon(
                                      e.icon,
                                      width: 40,
                                      height: 40,
                                    ),
                                    minLeadingWidth: 12,
                                    title: SFText(
                                        keyText: e.symbol.toUpperCase(),
                                        style: TextStyles.lightWhite16,
                                        stringCase: StringCase.upperCase),
                                    trailing: SFText(
                                      keyText: '${e.balance}',
                                      style: TextStyles.lightWhite16,
                                    ),
                                  ),
                                ))
                            .toList(),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 18.0),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: SizedBox(
                      height: 48,
                      child: SFButtonOutLined(
                        title: LocaleKeys.stake,
                        textStyle: TextStyles.bold16Blue,
                        borderColor: AppColors.blue,
                        onPressed: () {
                          Navigator.pushNamed(context, R.staking);
                        },
                      )),
                ),
                const SizedBox(height: 25),
                const SpendingDetailList(),
              ],
            ),
          ),
          Positioned(
            bottom: 24,
            left: 24,
            right: 24,
            child: SFButton(
                text: LocaleKeys.transfer,
                textStyle: TextStyles.w600WhiteSize16,
                gradient: AppColors.gradientBlueButton,
                height: 48,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(context, R.passcode,
                      arguments: PasscodeArguments(route: R.transfer));
                }),
          ),
        ],
      ),
    );
  }
}
