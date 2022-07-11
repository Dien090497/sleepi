import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/resources/resources.dart';

class MiddleBed extends StatelessWidget {
  const MiddleBed({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    // final beds = List.generate(BedType.values.length * 5,
    //     (i) => BedType.values[i % BedType.values.length]);
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
          child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
            return Column(
              children: [
                SizedBox(
                  width: size.width,
                  height: 200,
                  child: state is HomeLoaded
                      ? Swiper(
                          itemBuilder: (BuildContext context, int index) {
                            return state.bedList.isNotEmpty
                                ? _buildBedItem(state.bedList[index], context)
                                : const SFIcon(Ics.addBed, fit: BoxFit.none);
                          },
                          onIndexChanged: (index) {
                            if (state.bedList.isEmpty) {
                              return;
                            }
                            var bed = state.bedList[index];
                            context.read<HomeBloc>().add(ChangeBed(
                                level: bed.level,
                                durability: bed.durability,
                                time: bed.time,
                                id: bed.id));
                          },

                          itemCount:
                              state.bedList.isEmpty ? 1 : state.bedList.length,
                          control: const SwiperControl(),
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
                      text: state is HomeLoaded ? '${state.id}' : '__',
                      textStyle: TextStyles.blue14,
                      color: Colors.white.withOpacity(0.05),
                      radius: 50,
                      height: 36,
                    ),
                    const SizedBox(width: 8),
                    SFButton(
                      text:
                          '${state is HomeLoaded ? state.durability : '___'}/100',
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
          }
              // => state.when(
              //     error: (message) => const SizedBox.shrink(),
              //     initial: () => const SizedBox.shrink(),
              //     loading: () => const LoadingIcon(),
              //     loaded: (listBed, id, level, durability, time) =>),
              ),
        ),
      ],
    );
  }

  _buildBedItem(BedEntity bedEntity, BuildContext context) {
    return Column(
      children: [
        SFText(keyText: bedEntity.name, style: TextStyles.blue14),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(context, R.nftInfo,
                arguments: InfoIndividualParams(
                    buy: true,
                    bed: bedEntity));
          },
          child: CachedNetworkImage(
            imageUrl: bedEntity.image,
            placeholder: (context, url) => const Center(
              child: SizedBox(
                width: 40.0,
                height: 40.0,
                child: CircularProgressIndicator(),
              ),
            ),
            errorWidget: (context, url, error) => Container(
                decoration: const BoxDecoration(
                  color: AppColors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                ),
                child: const Icon(Icons.error)),
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider, fit: BoxFit.fitHeight),
              ),
            ),
            height: 180,
          ),
        ),
      ],
    );
  }
}
