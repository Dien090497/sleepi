import 'dart:async';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/background_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/introduce_app.dart';
import 'package:slee_fi/presentation/screens/home/widgets/middle_bed.dart';
import 'package:slee_fi/presentation/screens/home/widgets/modal_item_list.dart';
import 'package:slee_fi/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool swCheck = true;
  bool checkIntroduce = false;
  late int _selectedHour = DateTime.now().hour;
  late int _selectedMinute = DateTime.now().minute;
  late Timer _timer;
  late int startTime = 0;

  @override
  void initState() {
    startTime = 1 * 60;
    startTimer();
    super.initState();
  }

  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (startTime == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            startTime--;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  Widget viewGif() {
    return Container(
      width: 70,
      height: 70,
      padding: const EdgeInsets.symmetric(vertical: 19, horizontal: 19),
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

  convertTimer() {
    if (startTime <= 0) {
      return '00:00:00';
    } else {
      return '${startTime ~/ (60 * 60) < 10 ? '0${startTime ~/ (60 * 60)}' : startTime ~/ (60 * 60)}'
          ':${(startTime % (60 * 60)) ~/ 60 < 10 ? '0${(startTime % (60 * 60)) ~/ 60}' : (startTime % (60 * 60)) ~/ 60}'
          ':${(startTime % (60 * 60)) % 60 < 10 ? '0${(startTime % (60 * 60)) % 60}' : (startTime % (60 * 60)) % 60}';
    }
  }

  Widget alarmBell(size) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
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
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
            ),
            child: SizedBox(
              height: 320.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CupertinoPicker(
                        looping: true,
                        selectionOverlay: Container(),
                        offAxisFraction: -0.5,
                        squeeze: 1,
                        scrollController: FixedExtentScrollController(
                          initialItem: _selectedHour,
                        ),
                        itemExtent: 48.0,
                        backgroundColor: AppColors.dark,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            _selectedHour = index;
                          });
                        },
                        children: List<Widget>.generate(24, (int index) {
                          return Column(
                            children: [
                              if (_selectedHour == index)
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: AppColors
                                        .gradientWhiteBorderLeftToRight,
                                  ),
                                ),
                              Container(
                                width: size.width,
                                height: 46,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.centerRight,
                                child: Text(
                                  index < 10 ? '0$index' : '$index',
                                  textAlign: TextAlign.right,
                                  style: TextStyles.white1w700size16,
                                ),
                              ),
                              if (_selectedHour == index)
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: AppColors
                                        .gradientWhiteBorderLeftToRight,
                                  ),
                                ),
                            ],
                          );
                        })),
                  ),
                  Expanded(
                    child: CupertinoPicker(
                        selectionOverlay: Container(),
                        looping: true,
                        squeeze: 1,
                        offAxisFraction: 0.5,
                        useMagnifier: true,
                        scrollController: FixedExtentScrollController(
                          initialItem: _selectedMinute,
                        ),
                        itemExtent: 48.0,
                        backgroundColor: AppColors.dark,
                        onSelectedItemChanged: (int index) {
                          setState(() {
                            _selectedMinute = index;
                          });
                        },
                        children: List<Widget>.generate(60, (int index) {
                          return Column(
                            children: [
                              if (_selectedMinute == index)
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: AppColors
                                        .gradientWhiteBorderRightToLeft,
                                  ),
                                ),
                              Container(
                                width: size.width,
                                height: 46,
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 12),
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  index < 10 ? '0$index' : '$index',
                                  textAlign: TextAlign.right,
                                  style: TextStyles.white1w700size16,
                                ),
                              ),
                              if (_selectedMinute == index)
                                Container(
                                  height: 1,
                                  decoration: BoxDecoration(
                                    gradient: AppColors
                                        .gradientWhiteBorderRightToLeft,
                                  ),
                                ),
                            ],
                          );
                        })),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            // '${translate(LocaleKeys.range)}: 06:00-09:00',
            '${LocaleKeys.range.tr()}: 06:00-09:00',
            style: TextStyles.white16500,
          ),
          const SizedBox(
            height: 24,
          ),
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
              const SizedBox(
                width: 22,
              ),
              CupertinoSwitch(
                activeColor: AppColors.green,
                value: swCheck,
                onChanged: (value) {
                  setState(() {
                    swCheck = value;
                  });
                },
              ),
            ],
          ),
          const SizedBox(
            height: 16,
          ),
          SFButton(
            text: startTime == 0 ? LocaleKeys.start.tr() : '${convertTimer()}',
            textStyle: TextStyles.white16,
            radius: 100,
            gradient: startTime == 0 ? AppColors.gradientBlueButton : null,
            color: AppColors.lightGrey,
            height: 40,
            width: size.width,
            onPressed: () {
              if (startTime == 0) Navigator.pushNamed(context, R.tracking);
            },
          ),
          const SizedBox(
            height: 32,
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                      color: AppColors.darkColor,
                      borderRadius: BorderRadius.circular(20)),
                  child: SFText(
                    keyText: '000/160 SLTF',
                    style: TextStyles.lightGrey10,
                  ),
                ),
              ),
              const SizedBox(
                width: 12,
              ),
              GestureDetector(
                onTap: () => Navigator.pushNamed(context, R.question),
                child: SvgPicture.asset(
                  Ics.icCircleQuestion,
                  width: 20,
                  height: 20,
                  color: AppColors.lightGrey,
                ),
              ),
              const SizedBox(
                width: 12,
              ),
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
          const SizedBox(
            height: 29,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              viewGif(),
              const SizedBox(
                height: 20,
              ),
              viewGif(),
              const SizedBox(
                height: 20,
              ),
              viewGif(),
              const SizedBox(
                height: 20,
              ),
              viewGif(),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => HomeBloc()..add(const FetchData()),
      child: BackgroundWidget(
        child: SafeArea(
          child: Stack(
            children: [
              BlocBuilder<HomeBloc, HomeState>(
                builder: (context, state) {
                  return state.when(
                    initial: () => const SizedBox.shrink(),
                    loading: () => const LoadingIcon(),
                    loaded: () {
                      return Column(
                        children: [
                          const TopBarCommon(),
                          const SizedBox(
                            height: 7,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const ScrollPhysics(),
                              child: Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 16.0),
                                    child: MiddleBed(),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 16.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SFButtonOutLined(
                                          title: LocaleKeys.use_item,
                                          onPressed: () {
                                            SFModalBottomSheet.show(context,
                                                0.8, const ModalItemList());
                                          },
                                          fixedSize: Size(size.width, 40),
                                          textStyle: TextStyles.lightGrey16500,
                                          icon: Icons.add_circle_outline,
                                          borderColor:
                                              Colors.white.withOpacity(0.1),
                                          withBorder: 1,
                                        ),
                                        const SizedBox(
                                          height: 24,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              // '${translate(LocaleKeys.insurance)}: 5%',
                                              '${LocaleKeys.insurance.tr()}: 5%',
                                              style:
                                                  TextStyles.bold16LightWhite,
                                            ),
                                            SizedBox(
                                              height: 24,
                                              child: CupertinoSwitch(
                                                activeColor: AppColors.green,
                                                value: swCheck,
                                                onChanged: (value) {
                                                  setState(() {
                                                    swCheck = value;
                                                  });
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                        const SizedBox(
                                          height: 2,
                                        ),
                                        SFText(
                                          keyText: LocaleKeys.what_insurance,
                                          style: TextStyles.lightGrey12,
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 16,
                                  ),
                                  alarmBell(size),
                                ],
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
              checkIntroduce
                  ? IntroduceApp(
                      backOnPress: (check) {
                        setState(() {
                          checkIntroduce = check;
                        });
                      },
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
