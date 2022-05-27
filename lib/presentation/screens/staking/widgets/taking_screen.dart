import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/staking/widgets/popup_staking.dart';

class TakingScreen extends StatelessWidget {
  const TakingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            const SizedBox(
              height: 140,
            ),
            Container(
                height: 316,
                width: double.infinity,
                padding: const EdgeInsets.all(4.0),
                color: AppColors.greyBottomNavBar,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 18),
                    Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: SFText(
                            keyText: Keys.stakeSlft,
                            style: TextStyles.bold32black)),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SFText(
                            keyText: Keys.yourSlftInSpending,
                            style: TextStyles.bold20black),
                        SFText(
                            keyText: "XXXXXXX  SLFT",
                            style: TextStyles.bold20black),
                      ],
                    ),
                    const SizedBox(
                      height: 24.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: SFText(
                              keyText: Keys.stakeWithdraw,
                              style: TextStyles.bold32black),
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                              onTap: () {},
                              child: SFText(
                                  keyText: Keys.max,
                                  style: TextStyles.bold20black)),
                        ),
                        Expanded(
                          flex: 4,
                          child: SFText(
                              keyText: "XXX    SLFT",
                              style: TextStyles.bold32black),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                            onTap: () {
                              showCustomDialog(context,
                                  children: [const PopUpStaking()]);
                            },
                            child: SFText(
                                keyText: Keys.confirm,
                                style: TextStyles.bold32black)),
                        GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: SFText(
                                keyText: Keys.cancel,
                                style: TextStyles.bold32black))
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
