import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class WithdrawSlftScreen extends StatelessWidget {
  const WithdrawSlftScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(
          context: context,
          title: Keys.withdrawSlft,
          textStyle: TextStyles.bold18LightWhite,
        ),
        body: SafeArea(
            child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          children: [
            SFCard(
              margin: const EdgeInsets.only(top: 16.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                          child: SFText(
                        keyText: Keys.yourStakedAmount,
                        style: TextStyles.lightGrey12,
                      )),
                      SFText(
                        keyText: "xxxx SLFT",
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
                        keyText: Keys.withdraw,
                        style: TextStyles.bold18LightWhite,
                      ),
                      SFButtonOutLined(
                          title: Keys.max,
                          textStyle: TextStyles.bold14Blue,
                          onPressed: () {}),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(Ics.icGold),
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
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
