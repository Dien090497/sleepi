import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/sf_text_border.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/di/translations/keys.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/introduce_app.dart';
import 'package:slee_fi/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool swCheck = true;
  bool checkIntroduce = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => HomeBloc()..add(const FetchData()),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(
                width: size.width,
                height: size.height,
                child: Image.asset(
                  Imgs.background,
                  fit: BoxFit.fill,
                )),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const LoadingIcon(),
                  loaded: () {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: MediaQuery.of(context).padding.top,
                          ),
                          const TopBarCommon(),
                          const SizedBox(
                            height: 7,
                          ),
                          Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: Column(
                                children: [
                                  const Text(
                                    Keys.mainBed,
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
                                        const Text(
                                          Keys.middleBed,
                                          style: TextStyles.blue14,
                                        ),
                                        const SizedBox(height: 24),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 7),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              const Icon(
                                                Icons.arrow_back_ios,
                                                color: AppColors.labelColor,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.pushNamed(
                                                      context, R.nftInfo,
                                                      arguments: false);
                                                },
                                                child:
                                                    SvgPicture.asset(Ics.sleep),
                                              ),
                                              const Icon(
                                                Icons.arrow_forward_ios_sharp,
                                                color: AppColors.labelColor,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const SizedBox(height: 32),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: const [
                                            SFTextBorder(
                                              text: 'IDIDID',
                                              textColor: AppColors.blue,
                                              radius: 50,
                                            ),
                                            SizedBox(width: 8,),
                                            SFTextBorder(
                                              text: '100/100',
                                              textColor: AppColors.green,
                                              radius: 50,
                                            ),
                                            SizedBox(width: 8,),
                                            SFTextBorder(
                                              text: 'Lv9999',
                                              textColor: AppColors.yellow,
                                              radius: 50,
                                            ),
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
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40),
                                    child: Row(
                                      children: [
                                        SFText(
                                          keyText: 'Insurance: 5%',
                                          style: TextStyles.bold15black,
                                        ),
                                        const SizedBox(width: 5),
                                        CupertinoSwitch(
                                          value: swCheck,
                                          onChanged: (value) {
                                            setState(() {
                                              swCheck = value;
                                            });
                                          },
                                        ),
                                        const Spacer(),
                                        SFText(
                                            keyText: 'Item',
                                            style: TextStyles.bold15black),
                                        const SizedBox(width: 10),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, R.itemSelection);
                                          },
                                          child: const Icon(
                                            Icons.add_circle_outline,
                                            size: 30,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 45),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: SFText(
                                        keyText: 'What’s Insurance?',
                                        style: TextStyles.black10Bold,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: SFText(
                                      keyText: '6:29',
                                      style: TextStyles.header,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      decoration: const BoxDecoration(
                                          color: AppColors.greyBottomNavBar),
                                      child: SFText(
                                        keyText: '7:30',
                                        style: TextStyles.header,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: SFText(
                                      keyText: '8:31',
                                      style: TextStyles.header,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      decoration: const BoxDecoration(
                                          color: AppColors.greyBottomNavBar),
                                      child: SFText(
                                        keyText: 'START',
                                        style: TextStyles.header,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(vertical: 5),
                                    child: SFText(
                                      keyText: 'Arrange:06:00-09:00',
                                      style: TextStyles.bold20black,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.add_circle_outline,
                                          size: 30),
                                      const SizedBox(width: 10),
                                      SFText(
                                          keyText: 'Alarm: Bell',
                                          style: TextStyles.header),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      CupertinoSwitch(
                                        value: swCheck,
                                        onChanged: (value) {
                                          setState(() {
                                            swCheck = value;
                                          });
                                        },
                                      ),
                                      const SizedBox(width: 10),
                                      Container(
                                        padding: const EdgeInsets.all(5),
                                        decoration: const BoxDecoration(
                                            color: Colors.cyanAccent,
                                            shape: BoxShape.circle),
                                        child: GestureDetector(
                                          child: const Icon(
                                            Icons.question_answer,
                                            size: 15,
                                          ),
                                          onTap: () {
                                            setState(() {
                                              checkIntroduce = true;
                                            });
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10),
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: AppColors.black),
                                              borderRadius:
                                                  BorderRadius.circular(20)),
                                          width: size.width / 2,
                                          child: SFText(
                                            keyText: '000 gst',
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 50,
                                        ),
                                        GestureDetector(
                                          child: const Icon(Icons.feedback),
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, R.feedback);
                                          },
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 20,
                                        left: 10,
                                        bottom: 70,
                                        top: 10),
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      width: size.width,
                                      height: 80,
                                      decoration: BoxDecoration(
                                          color: AppColors.greyBottomNavBar,
                                          border: Border.all(
                                              color: AppColors.black)),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Container(
                                              width: 50,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  border: Border.all(
                                                      color: AppColors.black),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
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
    );
  }
}
