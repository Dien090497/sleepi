import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';

class WalletDetailList extends StatelessWidget {
  const WalletDetailList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      width: double.infinity,
      padding : const EdgeInsets.only(top: 20),
      child:  ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          itemBuilder: (BuildContext context,int index){
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              margin: const EdgeInsets.only(top: 12.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: AppColors.white.withOpacity(0.05),
              ),
              child: ListTile(
                leading: Image.asset("assets/images/slft.png"),
                title: SFText(keyText: "SLFT", style: TextStyles.lightWhite16),
                trailing: SFText(keyText: "xxxxxxxxx", style: TextStyles.lightWhite16,),
              ),
            );
          }
      ),
    );
  }
}
