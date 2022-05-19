import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalMultiChainSwitch extends StatelessWidget {
  const ModalMultiChainSwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
        height: MediaQuery.of(context).copyWith().size.height * 0.32,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: AppColors.white,
        ),
        child: Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                SFText(keyText: Keys.multiChainSwitchUppercase, style: TextStyles.bold24blackItalic,),
               const SizedBox(height: 12.0,),
                Expanded(
                    child: ListView(
                      children:  [
                        Card(
                          shape:  RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                              side: const BorderSide(width: 2, color: AppColors.black),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.ac_unit, size: 32,),
                            title: SFText(keyText: "Solana", style: TextStyles.black16, ),
                            trailing: const Icon(Icons.check_circle, color: AppColors.green, size: 32,),
                          ),
                        ),
                        Card(
                          shape:  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                            side: const BorderSide(width: 2, color: AppColors.black),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.diamond, size: 32, color: AppColors.yellow,),
                            title: SFText(keyText: "BNB Smart Chain(BEP20)", style: TextStyles.black16, ),
                          ),
                        )
                    ],
                  )
                )
              ],
            ),
          ),
        )
    );
  }
}
