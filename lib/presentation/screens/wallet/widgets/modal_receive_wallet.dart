import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalReceiveWallet extends StatelessWidget {
  const ModalReceiveWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        const SizedBox(height: 32,),
        SFText(keyText: Keys.receive, style: TextStyles.bold18White, toUpperCase: true, textAlign: TextAlign.center,),
        const SizedBox(height: 16,),

        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.35, vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColors.blue.withOpacity(0.15)
            ),
            child: SFText(keyText: Keys.avalanche, style: TextStyles.blue14, textAlign: TextAlign.center,),
    return Container(
      height: MediaQuery.of(context).copyWith().size.height * 0.56,
      alignment: Alignment.topCenter,
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Scaffold(
        body: SafeArea(
          child: ListView(
            shrinkWrap: true,
            children: [
              SFText(
                keyText: Keys.receive,
                style: TextStyles.bold20black,
                toUpperCase: true,
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.35,
                    vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: AppColors.black, width: 1),
                      color: AppColors.greenAccent),
                  child: SFText(
                    keyText: Keys.solana,
                    style: TextStyles.black13,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Image.asset(
                "assets/images/qr_code_test.png",
                height: 180,
              ),
              const SizedBox(
                height: 8.0,
              ),
              SFText(
                keyText: Keys.scanAddressToReceivePayment,
                style: TextStyles.black15Italic,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 4.0,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width * 0.1,
                    vertical: 8.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 16.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: AppColors.black),
                  ),
                  child: SFText(
                      keyText: "Eq7fbhoajsdRA29asjBWRmxwwo9aj92as",
                      style: TextStyles.grey12),
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
              const SizedBox(
                height: 12.0,
              ),
            ],
          ),
        ) ,
        Image.asset(Imgs.qrCodeTest, height: 180, color: AppColors.lightGrey,),
        const SizedBox(height: 32.0,),
        SFText(keyText: Keys.scanAddressToReceivePayment, style: TextStyles.lightGrey12, textAlign: TextAlign.center,),
        const SizedBox(height: 4.0,),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
            decoration:  BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: AppColors.white.withOpacity(0.05)
            ),
            child: SFText(keyText: "Eq7fbhoajsdRA29asjBWRmxwwo9aj92as", style: TextStyles.lightGrey16, textAlign: TextAlign.center,),
          ),
        ) ,
        const SizedBox(height: 32,),
        SFButton(
          text: Keys.copyAddress,
          textStyle: TextStyles.bold16LightWhite,
          height: 50,
          color: AppColors.blue,
          toUpperCase: true,
          onPressed: () {},
        ),
        const SizedBox(height: 12,),
      ],
    );
  }
}
