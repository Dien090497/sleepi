import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';

class ModalReceiveWallet extends StatelessWidget {
  const ModalReceiveWallet({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).copyWith().size.height*0.56,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child:  Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              SFText(keyText: Keys.receive, style: TextStyles.bold20black, toUpperCase: true, textAlign: TextAlign.center,),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.35, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.black, width: 1),
                    color: AppColors.greenAccent
                  ),
                  child: SFText(keyText: Keys.solana, style: TextStyles.black13, textAlign: TextAlign.center,),
                ),
              ) ,
              Image.asset("assets/images/qr_code_test.png", height: 180,),
              const SizedBox(height: 8.0,),
              SFText(keyText: Keys.scanAddressToReceivePayment, style: TextStyles.black15Italic, textAlign: TextAlign.center,),
              const SizedBox(height: 4.0,),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.1, vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
                  decoration:  BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: SFText(keyText: "Eq7fbhoajsdRA29asjBWRmxwwo9aj92as", style: TextStyles.grey12),
                ),
              ),
              SFButton(
                text: Keys.copyAddress,
                textStyle: TextStyles.bold16blackItalic,
                height: 50,
                color: AppColors.greenAccent,
                toUpperCase: true,
                onPressed: () {},
              ),
              const SizedBox(height: 12.0,),
            ],
          ),
        ),
      ),
    );
  }
}
