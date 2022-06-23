import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/screens/home/widgets/button_start.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/time_picker.dart';
import 'package:slee_fi/resources/resources.dart';

class AlarmBell extends StatelessWidget {
  const AlarmBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: const BoxDecoration(
        color: AppColors.dark,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(40),
          topLeft: Radius.circular(40),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const TimePicker(),
          const SizedBox(height: 16),
          Text(
            '${LocaleKeys.range.tr()}: 03:00-06:00',
            style: TextStyles.white16500,
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: SFButtonOutLined(
                  title: LocaleKeys.alarm_bell,
                  onPressed: () {
                    Navigator.pushNamed(context, R.alarmSoundEffect);
                  },
                  fixedSize: const Size(274, 40),
                  textStyle: TextStyles.blue16,
                  borderColor: AppColors.blue,
                  iconColor: AppColors.blue,
                  withBorder: 1,
                ),
              ),
              const SizedBox(width: 22),
              HomeSwitch(
                onChanged: (bool value) {},
              ),
            ],
          ),
          const SizedBox(height: 16),
          const ButtonStart(),
          const SizedBox(height: 32),
          Row(
            children: [
              Expanded(child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SFPercentBorderGradient(
                    valueActive: 70,
                    totalValue: 100,
                    linearGradient: AppColors.gradientBluePurple,
                    lineHeight: 18,
                    barRadius: 20,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SFText(
                      keyText: '100/150 SLFT',
                      style: TextStyles.white10,
                    ),
                  )
                ],
              ),),
              // Expanded(
              //   child: Container(
              //     padding:
              //         const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              //     decoration: BoxDecoration(
              //         color: AppColors.darkColor,
              //         borderRadius: BorderRadius.circular(20)),
              //     child: SFText(
              //       keyText: '0.00/160 SLFT',
              //       style: TextStyles.lightGrey10,
              //     ),
              //   ),
              // ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, R.question),
                child: SvgPicture.asset(
                  Ics.icCircleQuestion,
                  width: 20,
                  height: 20,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, R.feedback),
                child: SvgPicture.asset(
                  Ics.starOutlined,
                  width: 20,
                  height: 20,
                  color: AppColors.yellow,
                ),
              ),
            ],
          ),
          const SizedBox(height: 29),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              ViewGif(),
              SizedBox(height: 20),
              ViewGif(),
              SizedBox(height: 20),
              ViewGif(),
              SizedBox(height: 20),
              ViewGif(),
              SizedBox(height: 20),
              ViewGif(),
              SizedBox(height: 20),
              ViewGif(),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class ViewGif extends StatelessWidget {
  const ViewGif({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDarkColor, width: 1),
      ),
      child: SvgPicture.asset(
        Ics.gift,
        color: AppColors.borderDarkColor,
      ),
    );
  }
}
