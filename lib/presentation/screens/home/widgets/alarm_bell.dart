import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
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
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_confirm_speed_up.dart';
import 'package:slee_fi/presentation/screens/home/widgets/popup_open_lucky_box.dart';
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
                '${LocaleKeys.range.tr()}: ${state is HomeLoaded && bed != null ? '${DateTime.now().hour + bed.startTime!}' : '03:00-06:00'}',
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
                  Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      SFPercentBorderGradient(
                        valueActive: state is HomeLoaded ? state.tokenEarn : 0,
                        totalValue: 150,
                        linearGradient: AppColors.gradientBluePurple,
                        lineHeight: 18,
                        barRadius: 20,
                        backgroundColor: Colors.white.withOpacity(0.05),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: SFText(
                          keyText:
                              '${state is HomeLoaded ? state.tokenEarn : 0}/150 SLFT',
                          style: TextStyles.white10,
                        ),
                      )
                    ],
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
                      ViewGif(
                        index: 0,
                        onTap: () {},
                        bedEntity: _boxWithIndex(state, 0),
                      ),
                      const SizedBox(height: 20),
                      ViewGif(
                        index: 1,
                        bedEntity: _boxWithIndex(state, 1),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      ViewGif(
                        index: 2,
                        bedEntity: _boxWithIndex(state, 2),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      ViewGif(
                        index: 2,
                        bedEntity: _boxWithIndex(state, 3),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      ViewGif(
                        index: 4,
                        bedEntity: _boxWithIndex(state, 4),
                        onTap: () {},
                      ),
                      const SizedBox(height: 20),
                      ViewGif(
                        index: 5,
                        bedEntity: _boxWithIndex(state, 5),
                        onTap: () {},
                      ),
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

  LuckyBoxEntity? _boxWithIndex(HomeState state, int index) {
    return state is HomeLoaded && state.luckyBoxes.length > index
        ? state.luckyBoxes[index]
        : null;
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

class ViewGif extends StatelessWidget {
  const ViewGif(
      {Key? key,
      required this.onTap,
      required this.index,
      required this.bedEntity})
      : super(key: key);
  final LuckyBoxEntity? bedEntity;
  final Function() onTap;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        'bed entity is  $bedEntity'.log;
        if (bedEntity != null) {
          onTap;
          _showPopUpInfoLuckyBox(
            context,
            Const.luckyBoxes[index % 5],
            bedEntity!.speedUpCost,
            bedEntity!.waitingTime,
            bedEntity!.id,
          );
        }
      },
      child: Container(
        width: 48,
        height: 48,
        padding: EdgeInsets.all(bedEntity != null ? 0 : 12),
        decoration: BoxDecoration(
          color: AppColors.darkColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppColors.borderDarkColor, width: 1),
        ),
        child: SFIcon(
          bedEntity != null ? Const.luckyBoxes[index % 5] : Ics.gift,
          color: bedEntity != null ? null : AppColors.borderDarkColor,
        ),
      ),
    );
  }

  _showPopUpInfoLuckyBox(BuildContext context, String image, String speedUpCost,
      int waitingTime, int id) {
    showCustomAlertDialog(context,
        padding: const EdgeInsets.all(24),
        children: PopUpOpenLuckyBox(
            cost: speedUpCost,
            image: image,
            id: id,
            waitingTime: waitingTime,
            onConfirm: () {
              _showConfirmSpeedUp(context, speedUpCost, id);
            }));
  }

  _showConfirmSpeedUp(BuildContext context, String amount, int id) {
    showCustomAlertDialog(context,
        padding: const EdgeInsets.all(24),
        children: PupUpConfirmSpeedUp(
          amount: amount,
          onConfirm: () {
            context.read<HomeBloc>().add(SpeedUpLuckyBox(id));
          },
        ));
  }
}
