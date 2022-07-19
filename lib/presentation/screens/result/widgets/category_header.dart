import 'package:flutter/material.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader(
      {Key? key,
      required this.earning,
      required this.sleepDuration,
      required this.score,
        this.imageBed})
      : super(key: key);

  final String earning;
  final String sleepDuration;
  final int score;
  final String? imageBed;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(1),
                decoration: BoxDecoration(
                  gradient: AppColors.gradientBlueButton,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Stack(
                  children: [
                    Container(
                      height: 164,
                      decoration: BoxDecoration(
                        color: AppColors.darkPurple,
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    Container(
                      height: 164,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: AppColors.white.withOpacity(0.07),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: SFIcon(imageBed ?? Imgs.shortBed, height: 160,),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                height: 164,
                decoration: BoxDecoration(
                  color: AppColors.blue.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SFText(
                              keyText: LocaleKeys.earning,
                              style: TextStyles.blue14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SFImageBorder(
                            icon: Ics.icSlft,
                            onTap: () {},
                            radius: 8,
                            size: const Size(42, 42),
                          ),
                        )
                      ],
                    ),
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '$earning SLFT',
                        style: TextStyles.bold24Blue,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        '~ 100 USD',
                        style: TextStyles.lightGrey12,
                      ),
                    ),
                    const SizedBox(
                      height: 29,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 164,
                decoration: BoxDecoration(
                  color: AppColors.green.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                margin: const EdgeInsets.all(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SFText(
                              keyText: LocaleKeys.sleep_duration,
                              style: TextStyles.green14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SFImageBorder(
                            icon: Ics.icTwoEyes,
                            onTap: () {},
                            radius: 8,
                            size: const Size(40, 40),
                            iconColor: AppColors.green,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Text(
                        sleepDuration,
                        style: TextStyles.bold24Green,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Expanded(
              child: Container(
                width: 164,
                height: 164,
                decoration: BoxDecoration(
                  color: AppColors.yellow.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 16.0),
                            child: SFText(
                              keyText: LocaleKeys.sleep_score,
                              style: TextStyles.yellow14,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: SFImageBorder(
                            icon: Ics.star,
                            onTap: () {},
                            radius: 8,
                            size: const Size(40, 40),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: SFText(
                        keyText: '$score/100',
                        style: TextStyles.bold24Yellow,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
