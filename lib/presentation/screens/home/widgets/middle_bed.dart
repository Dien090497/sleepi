import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class MiddleBed extends StatelessWidget {
  const MiddleBed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final homeBloc = context.read<HomeBloc>();

    return Column(
      children: [
        SFText(
          keyText: LocaleKeys.main_bed,
          style: TextStyles.white18,
        ),
        const SizedBox(height: 16),
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
          child: BlocBuilder<HomeBloc, HomeState>(
            buildWhen: (previous, current) =>
                (current is HomeLoaded && previous is! HomeLoaded) ||
                (current is HomeLoaded &&
                    previous is HomeLoaded &&
                    previous.id != current.id),
            builder: (context, state) {
              return Column(
                children: [
                  SizedBox(
                    width: size.width,
                    height: 200.h,
                    child: state is HomeLoaded
                        ? Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return state.bedList.isNotEmpty &&
                                      index < state.bedList.length
                                  ? _BuildBedItem(
                                      bedEntity: state.bedList[index])
                                  : state.bedList.isNotEmpty &&
                                          index >= state.bedList.length
                                      ? const LoadingIcon()
                                      : GestureDetector(
                                          child: const SFIcon(Ics.addBed,
                                              fit: BoxFit.none),
                                          onTap: () {
                                            BlocProvider.of<
                                                        BottomNavigationBloc>(
                                                    context)
                                                .add(const SelectTab(4));
                                          },
                                        );
                            },
                            onIndexChanged: (index) {
                              if (state.bedList.isEmpty) {
                                return;
                              }
                              if (index >= state.bedList.length) {
                                homeBloc.add(LoadMoreBed());
                                return;
                              }
                              final bed = state.bedList[index];
                              homeBloc.add(ChangeBed(
                                  level: bed.level,
                                  durability: bed.durability,
                                  time: bed.time,
                                  id: bed.id));
                            },
                            loop: state.bedList.isNotEmpty,
                            itemCount: state.bedList.isEmpty
                                ? 1
                                : state.bedList.length +
                                    (state.loadMoreBed ? 1 : 0),
                            control: const SwiperControl(
                                disableColor: AppColors.grey),
                            // loop: state.bedList.isNotEmpty,
                          )
                        : state is HomeLoading
                            ? const LoadingIcon()
                            : const SizedBox(),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),
                      SFButton(
                        text: state is HomeLoaded ? '${state.id}' : '00',
                        textStyle: TextStyles.blue14,
                        color: Colors.white.withOpacity(0.05),
                        radius: 50,
                        height: 36,
                      ),
                      const SizedBox(width: 8),
                      SFButton(
                        text:
                            '${state is HomeLoaded ? state.durability % 1 == 0 ? state.durability.toInt() : state.durability : '100'}/100',
                        textStyle: TextStyles.green14,
                        color: Colors.white.withOpacity(0.05),
                        radius: 50,
                        height: 36,
                      ),
                      const SizedBox(width: 8),
                      SFButton(
                        text: 'Lv${state is HomeLoaded ? state.level : '0'}',
                        textStyle: TextStyles.yellow14,
                        color: Colors.white.withOpacity(0.05),
                        radius: 50,
                        height: 36,
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(height: 24),
                  SFText(
                    keyText:
                        '${LocaleKeys.time.tr()}: ${state is HomeLoaded ? state.time : '0'}h',
                    style: TextStyles.lightGrey12,
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}

class _BuildBedItem extends StatelessWidget {
  const _BuildBedItem({Key? key, required this.bedEntity}) : super(key: key);
  final BedEntity bedEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SFText(keyText: bedEntity.name, style: TextStyles.blue14),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, R.nftInfo,
                arguments: InfoIndividualParams(buy: true, bed: bedEntity));
          },
          child: CachedImage(image: bedEntity.image, height: 180.h),
        ),
      ],
    );
  }
}
