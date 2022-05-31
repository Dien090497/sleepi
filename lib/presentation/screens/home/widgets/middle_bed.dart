import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class MiddleBed extends StatelessWidget {
  const MiddleBed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SFText(
          keyText: LocaleKeys.mainBed,
          style: TextStyles.white18,
        ),
        const SizedBox(
          height: 16,
        ),
        Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(
            vertical: 24,
            horizontal: 16,
          ),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SFText(
                keyText: LocaleKeys.middleBed,
                style: TextStyles.blue14,
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.lightGrey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, R.nftInfo,
                            arguments: false);
                      },
                      child: SvgPicture.asset(Ics.sleep),
                    ),
                    const Icon(
                      Icons.arrow_forward_ios_sharp,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  SFButton(
                    text: 'IDIDID',
                    textStyle: TextStyles.blue14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SFButton(
                    text: '100/100',
                    textStyle: TextStyles.green14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  SFButton(
                    text: 'Lv9999',
                    textStyle: TextStyles.yellow14,
                    color: Colors.white.withOpacity(0.05),
                    radius: 50,
                  ),
                  const Spacer(),
                ],
              ),
              const SizedBox(height: 16),
              SFText(
                keyText: 'Time: 4h - 7h',
                style: TextStyles.labelStyle,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
