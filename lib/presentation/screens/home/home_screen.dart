import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/launch_url_utils.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/screens/home/widgets/alarm_bell.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/middle_bed.dart';
import 'package:slee_fi/presentation/screens/home/widgets/use_item.dart';
import 'package:slee_fi/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final RefreshController refreshController = RefreshController();
  final HomeBloc _homeBloc = HomeBloc();

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  void _onRefresh() async {
    _homeBloc.add(RefreshBed());
    await Future.delayed(const Duration(milliseconds: 1000));
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => _homeBloc..add(const FetchData()),
      child: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TopBarCommon(),
            const SizedBox(height: 27),
            Expanded(
              child: SmartRefresher(
                controller: refreshController,
                enablePullDown: true,
                onRefresh: () {
                  _onRefresh();
                },
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: MiddleBed(homeBloc: _homeBloc),
                    ),
                    const SizedBox(height: 10),
                    const UseItem(),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SFText(
                                  keyText: LocaleKeys.what_is_insurance,
                                  style: TextStyles.lightGrey12,
                                ),
                                const SizedBox(width: 8),
                                const SFIcon(Ics.icCircleQuestion),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          SFText(
                            keyText: 'You can set your alarm here',
                            style: TextStyles.lightGrey12,
                          )
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
      ),
    );
  }
}
