import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool swCheck = true;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (_) => HomeBloc()..add(const FetchData()),
      child: Scaffold(
        body: Stack(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return state.when(
                  initial: () => const SizedBox.shrink(),
                  loading: () => const LoadingIcon(),
                  loaded: () {
                    return SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          const TopBarCommon(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 100),
                            child: SFButton(
                              text: 'Main Bed',
                              onPressed: () {},
                              width: size.width,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 20),
                            child: Container(
                              height: size.height * 0.25,
                              width: size.width,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: AppColors.greyBottomNavBar,
                              ),
                              child: SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 80),
                                      child: SFButton(
                                        text: 'Middle Bet',
                                        onPressed: () {},
                                        width: size.width,
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Icon(Icons.arrow_back_ios),
                                          Container(
                                            height: 65,
                                            width: 100,
                                            color: Colors.cyanAccent,
                                            child: const SizedBox(),
                                          ),
                                          const Icon(
                                              Icons.arrow_forward_ios_sharp),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: AppColors.black)),
                                            child: SFText(
                                              keyText: 'IDIDIDID',
                                              style: TextStyles.black12,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: AppColors.black)),
                                            child: SFText(
                                              keyText: '100/100',
                                              style: TextStyles.black12,
                                            ),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 12, vertical: 2),
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(20),
                                                border: Border.all(
                                                    color: AppColors.black)),
                                            child: SFText(
                                              keyText: 'Lv9999',
                                              style: TextStyles.black12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const SizedBox(height: 10),
                                    SFText(
                                      keyText: 'Time:4-7hours',
                                      style: TextStyles.bold20black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 40),
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
                                const SizedBox(
                                  width: 10,
                                ),
                                const Icon(
                                  Icons.add_circle_outline,
                                  size: 30,
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 45),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: SFText(
                                keyText: 'What’s Insurance?',
                                style: TextStyles.black10Bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SFText(
                              keyText: '6:29',
                              style: TextStyles.header,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SFText(
                              keyText: '8:31',
                              style: TextStyles.header,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
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
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: SFText(
                              keyText: 'Arrange:06:00-09:00',
                              style: TextStyles.bold20black,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.add_circle_outline, size: 30),
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
                                child:
                                    const Icon(Icons.question_answer, size: 15),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: AppColors.black),
                                      borderRadius: BorderRadius.circular(20)),
                                  width: size.width / 2,
                                  child: SFText(keyText: '000 gst'),
                                ),
                                const SizedBox(
                                  width: 50,
                                ),
                                GestureDetector(
                                  child: const Icon(Icons.feedback),
                                  onTap: () {
                                    Navigator.pushNamed(context, R.feedback);
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              width: size.width,
                              height: 80,
                              decoration: BoxDecoration(
                                  color: AppColors.greyBottomNavBar,
                                  border: Border.all(color: AppColors.black)),
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
                                              BorderRadius.circular(15)),
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
                                              BorderRadius.circular(15)),
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
                                              BorderRadius.circular(15)),
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
                                              BorderRadius.circular(15)),
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
            //IntroduceApp()
          ],
        ),
      ),
    );
  }
}
