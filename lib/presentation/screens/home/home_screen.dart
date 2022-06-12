import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/launch_url_utils.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheet.dart';
import 'package:slee_fi/common/widgets/sf_button_outlined.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_image_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/alarm_bell.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/middle_bed.dart';
import 'package:slee_fi/presentation/screens/home/widgets/modal_item_list.dart';
import 'package:slee_fi/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  void _onRefresh(RefreshController refreshController) async {
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    final RefreshController refreshController = RefreshController();

    return BlocProvider(
      create: (_) => HomeBloc()..add(const FetchData()),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return state.when(
            initial: () => const SizedBox.shrink(),
            loading: () => const LoadingIcon(),
            loaded: () {
              return SafeArea(
                bottom: false,
                child: Column(
                  children: [
                    const TopBarCommon(),
                    const SizedBox(height: 27),
                    Expanded(
                      child: SmartRefresher(
                        controller: refreshController,
                        enablePullDown: true,
                        header: const WaterDropHeader(),
                        onRefresh: () {
                          _onRefresh(refreshController);
                        },
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.0),
                              child: MiddleBed(),
                            ),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SFImageBorder(
                                  icon: Imgs.jewelPurple,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(75, 75),
                                  padding: 8,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SFImageBorder(
                                  icon: Imgs.jewelGreen,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(75, 75),
                                  padding: 8,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SFImageBorder(
                                  icon: Ics.icItemsEmpty,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(75, 75),
                                  padding: 25,
                                  iconColor: AppColors.lightGrey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SFImageBorder(
                                  icon: Ics.icItemsEmpty,
                                  onTap: () {},
                                  radius: 16,
                                  size: const Size(75, 75),
                                  padding: 25,
                                  iconColor: AppColors.lightGrey,
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SFButtonOutLined(
                                    title: LocaleKeys.use_item,
                                    onPressed: () {
                                      SFModalBottomSheet.show(
                                          context, 0.8, const ModalItemList());
                                    },
                                    fixedSize: const Size.fromHeight(40),
                                    textStyle: TextStyles.lightGrey16500,
                                    icon: Icons.add_circle_outline,
                                    borderColor: Colors.white.withOpacity(0.1),
                                    withBorder: 1,
                                  ),
                                  const SizedBox(height: 24),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${LocaleKeys.insurance.tr()}: 5%',
                                        style: TextStyles.bold16LightWhite,
                                      ),
                                      SizedBox(
                                        height: 24,
                                        child: HomeSwitch(
                                          onChanged: (bool value) {},
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 2),
                                  GestureDetector(
                                    onTap: () {
                                      launchInsurance(context);
                                    },
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SFText(
                                          keyText: LocaleKeys.what_is_insurance,
                                          style: TextStyles.lightGrey12,
                                        ),
                                        const SizedBox(
                                          width: 8,
                                        ),
                                        const SFIcon(Ics.icCircleQuestion),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            const AlarmBell(),
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
    );
  }
}
