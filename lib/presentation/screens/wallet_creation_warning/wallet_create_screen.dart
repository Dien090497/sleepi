import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_textfield.dart';
import 'package:slee_fi/di/translations/keys.dart';

class WalletCreateScreen extends StatelessWidget {
  const WalletCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Scaffold(
        backgroundColor: AppColors.transparent,
        appBar: SFAppBar(context: context,
          title: Keys.createWallet,
          textStyle: TextStyles.bold18LightWhite,),
        body: SafeArea(
          child: Stack(
            children: [
              Align(alignment: Alignment.bottomCenter, child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SFButton(text: Keys.createWallet,
                  textStyle: TextStyles.w600WhiteSize16,
                  color: AppColors.blue,
                  onPressed: () {

                  },
                ),
              ),),
              ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: [
                  SFCard(
                    margin: const EdgeInsets.only(top: 16.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 24.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SFText(keyText: Keys.emailVerificationCode,
                          style: TextStyles.lightGrey14,),
                        const SizedBox(height: 4,),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                color: AppColors.white.withOpacity(0.1)),
                          ),
                          padding: const EdgeInsets.only(left: 12, right: 4),
                          child: Row(
                            children: const [
                              Expanded(
                                child: SFTextField(
                                  noBorder: true,
                                ),
                              ),
                              SFTextButton(
                                text: Keys.sendCode,
                                textStyle: TextStyles.blue12,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        SFText(
                          keyText: "You have already created a wallet  address. If you want to create a new wallet, please verify and continue.",
                          style: TextStyles.lightGrey16,)
                      ],
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
