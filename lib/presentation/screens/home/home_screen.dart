import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/utils/launch_url_utils.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/common/widgets/topbar_common.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_bloc.dart';
import 'package:slee_fi/presentation/blocs/lucky_box/lucky_box_cubit.dart';
import 'package:slee_fi/presentation/screens/home/widgets/alarm_bell.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_list_widget.dart';
import 'package:slee_fi/presentation/screens/home/widgets/home_switch.dart';
import 'package:slee_fi/presentation/screens/home/widgets/middle_bed.dart';
import 'package:slee_fi/presentation/screens/home/widgets/use_item.dart';
import 'package:slee_fi/resources/resources.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => HomeBloc()..add(const FetchBed())),
        BlocProvider(create: (_) => LuckyBoxCubit()..fetchLuckyBox()),
        BlocProvider(create: (_) => ItemBloc()),
      ],
      child: FocusDetector(
        onFocusGained: () {
          context.read<HomeBloc>().add(RefreshBed());
        },
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              const TopBarCommon(),
              const SizedBox(height: 27),
              Expanded(
                child: HomeListWidget(
                  child: ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16.0),
                        child: MiddleBed(),
                      ),
                      const SizedBox(height: 10),
                      const UseItem(),
                      const SizedBox(height: 24),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: BlocBuilder<HomeBloc, HomeState>(
                          builder: (context, state) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state is HomeLoaded &&
                                    state.selectedBed != null)
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${LocaleKeys.insurance.tr()}: ${state.selectedBed!.insurancePercent}%',
                                        style: TextStyles.bold16LightWhite,
                                      ),
                                      SizedBox(
                                        height: 24,
                                        child: HomeSwitch(
                                          onChanged: (bool value) {
                                            context
                                                .read<HomeBloc>()
                                                .add(ChangeInsurance(value));
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                const SizedBox(height: 2),
                                if (state is HomeLoaded &&
                                    state.bedList.isNotEmpty) ...[
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
                                        const SizedBox(width: 8),
                                        const SFIcon(Ics.icCircleQuestion),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(height: 24),
                                ],
                                SFText(
                                  keyText: LocaleKeys.you_can_set_your_alarm_here,
                                  style: TextStyles.lightGrey12,
                                ),
                              ],
                            );
                          },
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
      ),
    );
  }
}
