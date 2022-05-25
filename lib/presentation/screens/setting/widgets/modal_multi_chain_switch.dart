import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalMultiChainSwitch extends StatelessWidget {
  const ModalMultiChainSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        const SizedBox(height: 32.0,),
        SFText(keyText: Keys.multiChainSwitch, style: TextStyles.bold18White),
        const SizedBox(height: 32.0,),
        Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
              children:  [
                SFCard(
                  child: ListTile(
                    leading: Image.asset("assets/images/avax.png"),
                    title: SFText(keyText: "Solana", style: TextStyles.lightWhite16, ),
                    trailing: const Icon(Icons.check_circle, color: AppColors.green, size: 32,),
                  ),
                ),
                SFCard(
                  child: ListTile(
                    leading:Image.asset("assets/images/binance.png"),
                    title: SFText(keyText: "BNB Smart Chain(BEP20)", style: TextStyles.lightWhite16, ),
                  ),
                ),
              ],
            )
        )
      ],
    );
  }
}
