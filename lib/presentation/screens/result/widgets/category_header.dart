import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/resources/resources.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader(
      {Key? key,
      required this.earning,
      required this.sleepDuration,
      required this.score})
      : super(key: key);

  final int earning;
  final String sleepDuration;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                gradient: AppColors.gradientBlueButton,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Stack(
                children: [
                  Container(
                    width: 164,
                    height: 164,
                    decoration: BoxDecoration(
                      color: AppColors.darkPurple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  Container(
                    width: 164,
                    height: 164,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 58),
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.07),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: SvgPicture.asset(Ics.sleep),
                  )
                ],
              ),
            ),
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 164,
              height: 164,
              decoration: BoxDecoration(
                color: AppColors.blue.withOpacity(0.15),
                borderRadius: BorderRadius.circular(16),
              ),
              margin: const EdgeInsets.all(1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SFText(
                          keyText: LocaleKeys.earning,
                          style: TextStyles.blue14,
                        ),
                      ),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SFImageBorder(
                          icon: Ics.icGold,
                          onTap: () {},
                          radius: 8,
                          size: const Size(40, 40),
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
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Container(
              width: 164,
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
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SFText(
                          keyText: LocaleKeys.sleep_duration_enter,
                          style: TextStyles.green14,
                        ),
                      ),
                      const Spacer(),
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
            const SizedBox(
              width: 16,
            ),
            Container(
              width: 164,
              height: 164,
              decoration: BoxDecoration(
                color: AppColors.yellow.withOpacity(0.15),
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
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0),
                        child: SFText(
                          keyText: LocaleKeys.sleep_score,
                          style: TextStyles.yellow14,
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
                      )
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
          ],
        )
      ],
    );
  }
}
