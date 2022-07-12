import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/num_ext.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/staking_info_response/staking_info_response.dart';
import 'package:slee_fi/presentation/blocs/staking/staking_cubit.dart';
import 'package:slee_fi/presentation/blocs/staking/staking_state.dart';
import 'package:slee_fi/presentation/screens/staking/layout/deposit_slft_screen.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_calculator.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_info_staking.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/presentation/screens/trade/trade_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class StakingList extends StatelessWidget {
  final double balanceSlft;

  const StakingList({required this.balanceSlft, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StakingInfoResponse? stakingInfo;
    return BlocProvider(
      create: (context) => StakingCubit()..getStakingInfo(),
      child: BlocConsumer<StakingCubit, StakingState>(
        listener: (context, state) {
          if(state is StakingStateStakingInfoSuccess){
            stakingInfo = state.stakingInfoResponse;
          }
          if(state is StakingStateUnStakingSuccess){
            showSuccessfulDialog(context, null);
          }
          if(state is StakingStateCompoundSuccess){
            showSuccessfulDialog(context, null);
          }
        },
        builder: (context, state) {
          final cubit = context.read<StakingCubit>();
          return ListView(
            padding: const EdgeInsets.all(16.0),
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: AppColors.gradientBluePurpleStaking,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SFText(
                      keyText: "TVL",
                      style: TextStyles.bold16LightWhite,
                    ),
                    const SizedBox(
                      height: 19.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: LimitedBox(
                              child: SFText(
                                keyText: "${stakingInfo?.tvl ?? "0"} SLFT",
                                style: TextStyles.w700WhiteSize24,
                              ),
                            )),
                        SFText(
                          keyText: "(=xxxxxx USD)",
                          style: TextStyles.w400White14,
                          textAlign: TextAlign.end,
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SizedBox(),
                  PopupInfoStaking(),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              SFCard(
                radius: 8,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.earning_token,
                      style: TextStyles.lightWhite16,
                    ),
                    SFText(
                      keyText: "+ ${stakingInfo?.stake.earningToken ?? "0"}%",
                      style: TextStyles.green16,
                    )
                  ],
                ),
              ),
              SFCard(
                radius: 8,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.minting_discount,
                      style: TextStyles.lightWhite16,
                    ),
                    SFText(
                      keyText: "+ ${stakingInfo?.stake.mintingDiscount ?? "0"}%",
                      style: TextStyles.green16,
                    )
                  ],
                ),
              ),
              SFCard(
                radius: 8,
                margin: const EdgeInsets.only(top: 8),
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 18.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SFText(
                      keyText: LocaleKeys.level_up_discount,
                      style: TextStyles.lightWhite16,
                    ),
                    SFText(
                      keyText: "+ ${stakingInfo?.stake.levelUpDiscount ?? "0"}%",
                      style: TextStyles.green16,
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SFText(
                    keyText: LocaleKeys.stake_tokens,
                    style: TextStyles.lightGrey14,
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomAlertDialog(
                        context,
                        padding: const EdgeInsets.all(24),
                        children: const PopUpCalculator(),
                      );
                    },
                    child: Row(
                      children: [
                        const SFIcon(Ics.icCalculator),
                        SizedBox(width: 8.w),
                        SFText(
                          keyText: "ROI",
                          style: TextStyles.lightGrey16,
                        )
                      ],
                    ),
                  )
                ],
              ),
              SFCard(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.05),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: SFText(
                              keyText: LocaleKeys.your_token_earned.tr(args: ['SLFT']),
                              style: TextStyles.lightWhite16,
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Ics.icSlft,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            SFText(
                              keyText: "${stakingInfo != null ? double.parse(stakingInfo!.stake.totalReward != null ? stakingInfo!.stake.totalReward! : "0").formatBalanceToken : 0}",
                              style: TextStyles.lightWhite16,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: SFText(
                              keyText: LocaleKeys.your_staked_amount,
                              style: TextStyles.lightWhite16,
                            )),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Ics.icSlft,
                              width: 32,
                              height: 32,
                              fit: BoxFit.contain,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            SFText(
                              keyText: "${stakingInfo != null ? double.parse(stakingInfo!.stake.totalStake != null ? stakingInfo!.stake.totalStake! : "0").formatBalanceToken : 0}",
                              style: TextStyles.lightWhite16,
                            )
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: SFText(
                              keyText: LocaleKeys.apr,
                              style: TextStyles.lightWhite16,
                              stringCase: StringCase.upperCase,
                            )),
                        SFText(
                          keyText: "${stakingInfo != null ? double.parse(stakingInfo!.apr).formatBalanceToken : 0}%",
                          style: TextStyles.lightWhite16,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.white.withOpacity(0.05),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SFButton(
                          text: LocaleKeys.deposit,
                          textStyle: TextStyles.boldWhite14,
                          gradient: AppColors.gradientBlueButton,
                          width: 95,
                          height: 36,
                          onPressed: () =>
                              Navigator.pushNamed(context, R.depositSLFT, arguments: DepositSlftArguments(balanceSlft: balanceSlft)).then((value) => {
                                if(value == true){
                                  cubit.getStakingInfo()
                                }
                              }),
                        ),
                        SFButtonOutLined(
                            fixedSize: Size(102.w, 32.h),
                            borderColor: AppColors.blue,
                            title: LocaleKeys.withdraw,
                            textStyle: TextStyles.bold14Blue,
                            onPressed: () {
                              showCustomDialog(context,
                                  children: [
                                    PopUpStaking(
                                      message: LocaleKeys.do_you_really_want_to_withdraw
                                          .tr(namedArgs: {
                                        'amount': stakingInfo != null ? double.parse(stakingInfo!.stake.totalStake != null ? stakingInfo!.stake.totalStake! : "0").formatBalanceToken : "0",
                                        'token': 'SLFT',
                                      }),
                                      onPressed: () => cubit.unStaking(),
                                    )
                                  ]);
                            }
                        ),
                        GestureDetector(
                          onTap: () {
                            if(stakingInfo?.isCompound == true){
                              showCustomDialog(context,
                                  children: [
                                    PopUpStaking(
                                      message: LocaleKeys.do_you_really_want_to_compound
                                          .tr(namedArgs: {
                                        'amount': stakingInfo!= null ? double.parse(stakingInfo!.stake.totalStake != null ? stakingInfo!.stake.totalStake! : "0").formatBalanceToken : "0",
                                        'token': 'SLFT',
                                      }),
                                      onPressed: () => cubit.compound(),
                                    )
                                  ]);
                            }else {
                              showCustomAlertDialog(context,
                                  width: MediaQuery.of(context).size.width * 0.7,
                                  children: PopUpStaking(
                                    message: LocaleKeys.compound_will_be_activated_after.tr(),
                                    isShowButton:  false,
                                  ));
                            }

                          },
                          child: SFText(
                            keyText: LocaleKeys.compound,
                            style: TextStyles.bold14Blue,
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 48.0,
              ),
              SFButton(
                text: "${LocaleKeys.buy.tr()} SLFT",
                textStyle: TextStyles.boldWhite14,
                color: AppColors.blue,
                width: double.infinity,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    R.trade,
                    arguments: TradeArguments(
                      Const.tokens[0]['address'].toString(),
                    ),
                  );
                },
              ),
              const SizedBox(
                height: 16.0,
              ),
            ],
          );
        },
      ),
    );
  }
}

