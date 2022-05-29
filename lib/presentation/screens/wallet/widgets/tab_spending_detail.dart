import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/spending_detail_list.dart';
import 'package:slee_fi/resources/resources.dart';

class TabSpendingDetail extends StatelessWidget {
  const TabSpendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: SFText(
                        keyText: Keys.spendingAccount, style: TextStyles.blue12),
                  ),
                  GestureDetector(
                    onTap: () =>
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: SFText(
                              keyText: Keys.displaysMessageFromSpendingDetail,
                              style: TextStyles.white14),
                        )),
                    child: SvgPicture.asset(Ics.icQuestion),
                  ),
                ],
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  children: [
                    SFCard(
                      // onTap: () => Navigator.pushNamed(context, R.staking),
                      child: ListTile(
                        leading: Image.asset(Imgs.slft),
                        title: SFText(
                            keyText: Keys.slft,
                            style: TextStyles.lightWhite16,
                            toUpperCase: true),
                        trailing: SFText(
                          keyText: "0",
                          style: TextStyles.lightWhite16,
                        ),
                      ),
                    ),
                    SFCard(
                      child: ListTile(
                        leading: Image.asset(Imgs.slgt),
                        title: SFText(
                            keyText: Keys.slgt,
                            style: TextStyles.lightWhite16,
                            toUpperCase: true),
                        trailing: SFText(
                          keyText: "0",
                          style: TextStyles.lightWhite16,
                        ),
                      ),
                    ),
                    SFCard(
                      child: ListTile(
                        leading: Image.asset(Imgs.avax),
                        title: SFText(
                          keyText: Keys.avax,
                          style: TextStyles.lightWhite16,
                          toUpperCase: true,
                        ),
                        trailing: SFText(
                          keyText: "0",
                          style: TextStyles.lightWhite16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                    height: 48,
                    child: SFButtonOutLined(
                      title: Keys.stake,
                      textStyle: TextStyles.bold16Blue,
                      borderColor: AppColors.blue,
                      onPressed: () {Navigator.pushNamed(context, R.staking);},
                    )
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const Expanded(child: SpendingDetailList()),
            ],
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
                child: SFButton(
                  text: Keys.transfer,
                  textStyle: TextStyles.w600WhiteSize16,
                  height: 48,
                  width: double.infinity,
                  color: AppColors.blue,
                  onPressed: () => Navigator.pushNamed(context, R.transfer),
                ),
              ))
        ],
      ),
    );
  }
}
