import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_state.dart';

class CancelSell extends StatelessWidget {
  const CancelSell(
      {Key? key, required this.bedEntity, required this.cubit,})
      : super(key: key);

  final BedEntity bedEntity;
  final BottomBarInfoIndividualCubit cubit;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomBarInfoIndividualCubit, BottomBarInfoIndividualState>(
      bloc: cubit,
      builder: (context, state) {
        return Stack(
          children: [
            Column(
              children: [
                SFText(
                  keyText: LocaleKeys.cancel_sell,
                  style: TextStyles.white1w700size16,
                ),
                const SizedBox(height: 32),
                SFIcon(bedEntity.image, height: 160,),
                const SizedBox(height: 32),
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
                    state is BottomBarInfoIndividualLoading ?
                      const Expanded(child: LoadingIcon())
                    : Expanded(
                      child: SFButton(
                        text: LocaleKeys.confirm,
                        onPressed: () {
                          cubit.cancelSell(nftId: bedEntity.nftId);
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