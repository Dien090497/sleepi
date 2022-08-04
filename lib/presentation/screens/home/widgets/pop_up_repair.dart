import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_label_value.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_state.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class PopUpRepair extends StatelessWidget {
  const PopUpRepair({
    Key? key,
    required this.bedEntity,
    required this.cubit,
  }) : super(key: key);

  final BedEntity bedEntity;
  final BottomBarInfoIndividualCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarInfoIndividualCubit,
        BottomBarInfoIndividualState>(
      bloc: cubit,
      builder: (context, state) {
        if (state is BottomBarInfoIndividualLoaded) {}
        return Stack(
          children: [
            Positioned(
              right: 0,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: AppColors.lightGrey,
                ),
              ),
            ),
            Column(
              children: [
                SFText(
                  keyText: LocaleKeys.repair,
                  style: TextStyles.white1w700size16,
                ),
                SFIcon(
                  bedEntity.image,
                  height: 160,
                ),
                const SizedBox(
                  height: 10,
                ),
                state is BottomBarInfoIndividualLoaded
                    ? SFText(
                        keyText: LocaleKeys.durability,
                        suffix:
                            ' : ${state.valueRepair ?? bedEntity.durability.toInt()}/100',
                        style: TextStyles.white16,
                      )
                    : const Center(child: CircularProgressIndicator()),
                state is BottomBarInfoIndividualLoaded
                    ? Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: SfSlider(
                          value: state.valueRepair ?? bedEntity.durability,
                          min: 0,
                          max: 100,
                          activeColor: AppColors.green,
                          thumbIcon: Container(
                            width: 16,
                            height: 16,
                            decoration: const BoxDecoration(
                              color: AppColors.white,
                              shape: BoxShape.circle,
                            ),
                            padding: const EdgeInsets.all(4),
                            child: Container(
                              decoration: const BoxDecoration(
                                color: AppColors.green,
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          onChanged: (v) {
                            cubit.changeRepair(
                                valueRepair: v,
                                durability: bedEntity.durability);
                          },
                        ),
                      )
                    : const SizedBox(),
                const SizedBox(height: 32),
                state is BottomBarInfoIndividualLoaded
                    ? SFLabelValue(
                        label: LocaleKeys.cost,
                        value: '${state.cost ?? 0.0} SLFT',
                        styleValue: TextStyles.white16,
                      )
                    : const SFLabelValue(
                        label: LocaleKeys.cost,
                        value: '-- SLFT',
                        styleValue: TextStyles.white16,
                      ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Expanded(
                      child: SFButton(
                        text: LocaleKeys.cancel,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        width: double.infinity,
                        textStyle: TextStyles.lightGrey16,
                        color: AppColors.light4,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SFButton(
                        text: LocaleKeys.confirm,
                        onPressed: () {
                          if (state is BottomBarInfoIndividualLoaded) {
                            cubit.repairNFT(
                                bedId: bedEntity.nftId,
                                durability: state.valueRepair?.toInt() ??
                                    (100 - bedEntity.durability.toInt()));
                          }
                        },
                        width: double.infinity,
                        textStyle: TextStyles.white16,
                        gradient: AppColors.gradientBlueButton,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
