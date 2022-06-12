import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_calculator.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/pop_up_info_staking.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';
import 'package:slee_fi/resources/resources.dart';

class StakingList extends StatelessWidget {
  const StakingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                      child: SFText(
                    keyText: "xxxxxx SLFT",
                    style: TextStyles.w700WhiteSize24,
                  )),
                  Expanded(
                      child: SFText(
                    keyText: "(=xxxxxx USD)",
                    style: TextStyles.w400White14,
                    textAlign: TextAlign.end,
                  ))
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
                keyText: "+ X%",
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
                keyText: "+ X%",
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
                keyText: "+ X%",
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
                    keyText: LocaleKeys.your_token_earned.tr(args: ['NFT']),
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
                        keyText: "XXX",
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
                        keyText: "XXX",
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
                    keyText: "X%",
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
                    // width: 84,
                    height: 32,
                    onPressed: () =>
                        Navigator.pushNamed(context, R.depositSLFT),
                  ),
                  SizedBox(
                    // width: 84,
                    height: 32,
                    child: SFButtonOutLined(
                      borderColor: AppColors.blue,
                      title: LocaleKeys.withdraw,
                      textStyle: TextStyles.bold14Blue,
                      onPressed: () =>
                          Navigator.pushNamed(context, R.withdrawSLFT),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      showCustomDialog(context, children: [
                        PopUpStaking(
                          message: LocaleKeys.do_you_really_want_to_compound
                              .tr(namedArgs: {
                            'amount': 'xxx',
                            'token': 'SLFT',
                          }),
                          onPressed: () => showSuccessfulDialog(context),
                        )
                      ]);
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
          height: 32.0,
        ),
        Column(
          children: [
            SFButton(
              text: "${LocaleKeys.buy.tr()} SLFT",
              textStyle: TextStyles.boldWhite14,
              color: AppColors.blue,
              width: double.infinity,
              onPressed: () {},
            ),
            const SizedBox(
              height: 16.0,
            ),
            SizedBox(
              height: 48,
              child: SFButtonOutLined(
                  title: LocaleKeys.show_contract_on_avascan,
                  textStyle: TextStyles.bold16Blue,
                  borderColor: AppColors.blue,
                  onPressed: () {}),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        )
      ],
    );
  }
}
