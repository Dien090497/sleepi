import 'package:flutter/material.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/sf_app_bar.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/screens/tracking/widgets/analog_clock.dart';
import 'package:slee_fi/resources/resources.dart';

class TrackingScreen extends StatefulWidget {
  const TrackingScreen({Key? key}) : super(key: key);

  @override
  State<TrackingScreen> createState() => _TrackingScreenState();
}

class _TrackingScreenState extends State<TrackingScreen> {
  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Scaffold(
          backgroundColor: AppColors.transparent,
          appBar: SFAppBar(
              context: context,
              title: Keys.tracking,
              textStyle: TextStyles.bold18LightWhite),
          body: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 318,
                    height: 318,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(Imgs.borderClock),
                        )
                    ),
                  ),
                  Container(
                    width: 190,
                    height: 190,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.white.withOpacity(0.07),
                    ),
                  ),
                  const SizedBox(
                    width: 230,
                    height: 230,
                    child: AnalogClock(
                      isLive: true,
                      hourHandColor: Colors.white,
                      minuteHandColor: Colors.white,
                      showSecondHand: true,
                      secondHandColor: AppColors.blue,
                      numberColor: AppColors.textColor,
                      showNumbers: true,
                      textScaleFactor: 1.2,
                      showTicks: true,
                      tickColor: AppColors.tick,
                      showDigitalClock: false,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.0),
                child: SFLabelValue(
                  label: Keys.alarm,
                  value: '10:00',
                  styleLabel: TextStyles.textColorSize16,
                  styleValue: TextStyles.textColorSize16,
                ),
              ),
              const Spacer(),
              SFButton(
                text: Keys.wakeUp,
                width: double.infinity,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                onPressed: () {
                  Navigator.pushNamed(context, R.result);
                },
              ),
              const SizedBox(
                height: 26,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
