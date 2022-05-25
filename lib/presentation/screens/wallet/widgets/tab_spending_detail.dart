import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/spending_detail_list.dart';

class TabSpendingDetail extends StatelessWidget {
  const TabSpendingDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0,),
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: SFText(keyText: Keys.spendingAccount, style: TextStyles.blue12),
            ),
            GestureDetector(
              onTap: () => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: SFText(keyText: Keys.displaysMessageFromSpendingDetail, style: const TextStyle(color: AppColors.white),),
              )),
              child: SFIcon("assets/icons/ic_question.svg"),
            ),
          ],
        ),
        const SizedBox(height: 16.0,),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              SFCard(
                child: ListTile(
                  leading: Image.asset("assets/images/slft.png"),
                  title: SFText(keyText: Keys.slft, style: TextStyles.lightWhite16, toUpperCase: true),
                  trailing: SFText(keyText: "0", style: TextStyles.lightWhite16,),
                ),
              ),
              SFCard(
                child: ListTile(
                  leading: Image.asset("assets/images/slgt.png"),
                  title: SFText(keyText: Keys.slgt, style: TextStyles.lightWhite16, toUpperCase: true),
                  trailing: SFText(keyText: "0", style: TextStyles.lightWhite16,),
                ),
              ),
              SFCard(
                child: ListTile(
                  leading: Image.asset("assets/images/avax.png"),
                  title: SFText(keyText: Keys.avax, style: TextStyles.lightWhite16, toUpperCase: true,),
                  trailing: SFText(keyText: "0", style: TextStyles.lightWhite16,),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16.0,),
        SFText(keyText: Keys.baceOnSolana, style: TextStyles.white14, textAlign: TextAlign.center,),
        const SizedBox(height: 16.0,),
        const Expanded(child: SpendingDetailList()),
        Align(alignment: Alignment.bottomCenter, child: SFButton(text: Keys.transfer, onPressed: () {},))
      ],
    );
  }
}
