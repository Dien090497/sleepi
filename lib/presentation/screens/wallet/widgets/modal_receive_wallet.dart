import 'package:flutter/material.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalReceiveWallet extends StatelessWidget {
  const ModalReceiveWallet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(24),
      children: [
        SFText(
          keyText: LocaleKeys.receive,
          style: TextStyles.bold18White,
          stringCase: StringCase.upperCase,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.28),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: AppColors.blue.withOpacity(0.15)),
            child: SFText(
              keyText: LocaleKeys.avalanche,
              style: TextStyles.blue14,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(height: 32,),
        Image.asset(
          Imgs.qrCodeTest,
          height: 180,
          color: AppColors.lightWhite,
        ),
        const SizedBox(
          height: 32.0,
        ),
        SFText(
          keyText: LocaleKeys.scan_address_to_receive_payment,
          style: TextStyles.lightGrey12,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 12.0,
        ),
        Container(
          padding:
              const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100.0),
              color: AppColors.white.withOpacity(0.05)),
          child: SFText(
            keyText: "Eq7fbhoajsdRA29asjBWRmxwwo9aj92as",
            style: TextStyles.lightGrey16,
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        SFButton(
          text: LocaleKeys.copy_address,
          textStyle: TextStyles.w600WhiteSize16,
          width: double.infinity,
          height: 48,
          gradient: AppColors.gradientBlueButton,
          onPressed: () {},
        ),

      ],
    );
  }
}
