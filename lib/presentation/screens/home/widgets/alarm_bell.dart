import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/button_start.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/time_picker.dart';
import 'package:slee_fi/resources/resources.dart';

class AlarmBell extends StatelessWidget {
  const AlarmBell({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        final bed = state is HomeLoaded ? state.selectedBed : null;
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
                '${LocaleKeys.range.tr()}: ${state is HomeLoaded && bed != null ? '${bed.startTime}' : '03:00-06:00'}',
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
                  Expanded(
                    child: BlocBuilder<HomeBloc, HomeState>(
                      buildWhen: (previous, current) =>
                          (current is HomeLoaded && previous is! HomeLoaded) ||
                          ((current is HomeLoaded &&
                              previous is HomeLoaded &&
                              current.tokenEarn != previous.tokenEarn)),
                      builder: (context, state) => Stack(
                        alignment: Alignment.centerLeft,
                        children: [
                          SFPercentBorderGradient(
                            valueActive:
                                state is HomeLoaded ? state.tokenEarn : 0,
                            totalValue: 150,
                            linearGradient: AppColors.gradientBluePurple,
                            lineHeight: 18,
                            barRadius: 20,
                            backgroundColor: Colors.white.withOpacity(0.05),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: SFText(
                              keyText:
                                  '${state is HomeLoaded ? state.tokenEarn : 0}/150 SLFT',
                              style: TextStyles.white10,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
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
              BlocBuilder<HomeBloc, HomeState>(
                buildWhen: (previous, current) {
                  return (previous is HomeLoaded &&
                      current is HomeLoaded &&
                      !_theSameList(current.luckyBoxes, previous.luckyBoxes));
                },
                builder: (context, state) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.isNotEmpty),
                      const SizedBox(height: 20),
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.length >= 2),
                      const SizedBox(height: 20),
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.length >= 3),
                      const SizedBox(height: 20),
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.length >= 4),
                      const SizedBox(height: 20),
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.length >= 5),
                      const SizedBox(height: 20),
                      ViewGift(
                          showLuckyBox: state is HomeLoaded &&
                              state.luckyBoxes.length >= 6),
                    ],
                  );
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        );
      },
    );
  }

  bool _theSameList(
      List<LuckyBoxEntity> currentList, List<LuckyBoxEntity> prevList) {
    if (currentList.length == prevList.length) {
      for (int i = 0; i < prevList.length; i++) {
        var index =
            currentList.indexWhere((element) => element.id == prevList[i].id);
        if (index == -1) return false;
      }
      return true;
    }
    return false;
  }
}

class ViewGift extends StatelessWidget {
  const ViewGift({Key? key, required this.showLuckyBox}) : super(key: key);
  final bool showLuckyBox;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      padding: EdgeInsets.all(showLuckyBox ? 0 : 12),
      decoration: BoxDecoration(
        color: AppColors.darkColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.borderDarkColor, width: 1),
      ),
      child: SFIcon(
        showLuckyBox ? Imgs.icLuckyBoxGreen : Ics.gift,
        color: showLuckyBox ? null : AppColors.borderDarkColor,
      ),
    );
  }
}
