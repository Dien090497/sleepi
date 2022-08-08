import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/cached_image.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
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
    // final Size size = MediaQuery.of(context).size;
    final homeBloc = context.read<HomeBloc>();

    return Column(
      children: [
        SFText(keyText: LocaleKeys.main_bed, style: TextStyles.white18),
        const SizedBox(height: 16),
        Container(
          // width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 24),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.05),
            borderRadius: BorderRadius.circular(16),
          ),
          child: BlocBuilder<HomeBloc, HomeState>(
            builder: (context, state) {
              final selectBed = state is HomeLoaded && state.selectedBed != null
                  ? state.selectedBed
                  : null;
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SizedBox(
                      // width: size.width,
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
                                  homeBloc.add(const LoadMoreBed());
                                  return;
                                }
                                final bed = state.bedList[index];
                                homeBloc.add(ChangeBed(bed: bed));
                              },
                              loop: state.bedList.length > 1,
                              itemCount: state.bedList.isEmpty
                                  ? 1
                                  : state.bedList.length +
                                      (state.loadMoreBed ? 1 : 0),
                              control: const SwiperControl(
                                  disableColor: AppColors.transparent))
                          : state is HomeLoading
                              ? const LoadingIcon()
                              : const SizedBox(),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BedQualityWidget(bed: selectBed),
                  const SizedBox(height: 24),
                  SFText(
                    keyText:
                        '${LocaleKeys.time.tr()}: ${selectBed != null ? selectBed.startTime : '0'}h-${selectBed != null ? selectBed.endTime : '0'}h',
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
        SFText(keyText: bedEntity.nftClass, style: TextStyles.blue14),
        Expanded(
          child: GestureDetector(
            onTap: () async {
              final result = await Navigator.pushNamed(context, R.nftInfo,
                  arguments: InfoIndividualParams(buy: true, bed: bedEntity));
              if (result != null && result is BedEntity) {
                // context.read<HomeBloc>().add(ChangeBed(bed: result));
                context.read<HomeBloc>().add(const FetchBedDetail());
              }
            },
            child: CachedImage(image: bedEntity.image, height: 180.h),
          ),
        ),
      ],
    );
  }
}

class BedQualityWidget extends StatelessWidget {
  const BedQualityWidget({Key? key, required this.bed}) : super(key: key);

  final BedEntity? bed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Container(
          constraints: const BoxConstraints(maxWidth: 120),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: (bed != null
                    ? bed!.quality!.qualityBedColor
                    : AppColors.commonBed)
                .withOpacity(0.05),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            bed != null ? bed!.name : '00',
            maxLines: 2,
            style: TextStyles.blue14.copyWith(
                color: bed != null
                    ? bed!.quality!.qualityBedColor
                    : AppColors.commonBed),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.green.withOpacity(0.05),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            '${bed != null ? (bed!.durability % 1 == 0 ? bed!.durability.toInt() : bed!.durability) : '0'}/100',
            style: TextStyles.green14,
          ),
        ),
        const SizedBox(width: 8),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color: AppColors.yellow.withOpacity(0.05),
          ),
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
          child: Text(
            'Lv ${bed != null ? bed!.level : '0'}',
            style: TextStyles.yellow14,
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
