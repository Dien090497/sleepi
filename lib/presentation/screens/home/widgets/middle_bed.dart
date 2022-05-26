import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_text_border.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/resources/resources.dart';

class MiddleBed extends StatelessWidget {
  const MiddleBed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery
        .of(context)
        .size;
    return Column(
      children: [
        const SizedBox(
          height: 20,
        ),
        SFText(
          keyText: Keys.mainBed,
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
            borderRadius:
            BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              SFText(
                keyText: Keys.middleBed,
                style: TextStyles.blue14,
              ),
              const SizedBox(height: 24),
              Padding(
                padding:
                const EdgeInsets.symmetric(
                    horizontal: 7),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    const Icon(
                      Icons.arrow_back_ios,
                      color: AppColors.lightGrey,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                            context, R.nftInfo,
                            arguments: false);
                      },
                      child: SvgPicture.asset(
                          Ics.sleep),
                    ),
                    const Icon(
                      Icons
                          .arrow_forward_ios_sharp,
                      color: AppColors.lightGrey,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Row(
                mainAxisAlignment:
                MainAxisAlignment.center,
                children: const [
                  Spacer(),
                  SFTextBorder(
                    text: 'IDIDID',
                    textColor: AppColors.blue,
                    radius: 50,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SFTextBorder(
                    text: '100/100',
                    textColor: AppColors.green,
                    radius: 50,
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  SFTextBorder(
                    text: 'Lv9999',
                    textColor: AppColors.yellow,
                    radius: 50,
                  ),
                  Spacer(),
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
