import 'package:flutter/material.dart';
// import 'package:flutter_translate/flutter_translate.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

class BoxInfoWidget extends StatelessWidget {
  const BoxInfoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        children: [
          SFButton(
            text: 'Eq7fbho...9gQJxjh',
            color: Colors.white.withOpacity(0.05),
            textStyle: TextStyles.lightWhite14,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            '${translate(LocaleKeys.time)}: 6h -8h',
            style: TextStyles.lightGrey14,
          ),
          const SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              SFButton(
                text: LocaleKeys.quality,
                textStyle: TextStyles.blue14,
                color: Colors.blue.withOpacity(0.05),
                radius: 50,
              ),
              const SizedBox(
                width: 8,
              ),
              SFButton(
                text: LocaleKeys.flexibleBed,
                textStyle: TextStyles.green14,
                color: Colors.green.withOpacity(0.05),
                radius: 50,
              ),
              const SizedBox(
                width: 8,
              ),
              SFButton(
                text: '100/100',
                textStyle: TextStyles.yellow14,
                color: Colors.yellow.withOpacity(0.05),
                radius: 50,
              ),
              const Spacer(),
            ],
          ),
          const SizedBox(
            height: 24,
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              SFPercentBorderGradient(
                valueActive: 20,
                totalValue: 100,
                linearGradient: AppColors.gradientBlueButton,
                lineHeight: 18,
                barRadius: 20,
                backgroundColor: Colors.white.withOpacity(0.05),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: SFText(
                  keyText: LocaleKeys.level,
                  args: const {'num': '5'},
                  style: TextStyles.white10,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              SFPercentBorderGradient(
                valueActive: 30,
                totalValue: 100,
                linearGradient: AppColors.gradientBluePurple,
                lineHeight: 18,
                barRadius: 20,
                backgroundColor: Colors.white.withOpacity(0.05),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  '${translate(LocaleKeys.bedMint)} 0/7',
                  style: TextStyles.white10,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
