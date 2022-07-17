import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_animation_screen.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

class GachaRollSelections extends StatelessWidget {
  const GachaRollSelections({
    Key? key,
    required this.singleGacha,
    required this.timesGacha,
    required this.singleProbability,
    required this.timesProbability,
    required this.normalGacha,
  }) : super(key: key);

  final int singleGacha;
  final int timesGacha;
  final int singleProbability;
  final int timesProbability;
  final bool normalGacha;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GachaSpinCubit(),
      child: BlocConsumer<GachaSpinCubit, GachaSpinState>(
        listener: (context, state) {
        if(state is GachaSpinSuccess) {
          Navigator.pushNamed(context, R.gachaAnimation,
              arguments: GachaAnimationArguments(
                  spinInfo: state.gachaSpinResponse,
                  animation: normalGacha ? Const.normalGachaAnimation : Const.specialGachaAnimation,
                  audio: normalGacha ? Const.normalGachaAudio : Const.specialGachaAudio,
              )
          );
        }
        },
        builder: (context, state) {
          final cubit = context.read<GachaSpinCubit>();
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cubit.gachaSpin(GachaSpinSchema(probability: singleProbability));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: AppColors.blue),
                      color: AppColors.blue.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SFText(
                          keyText: '$singleGacha SLFT',
                          style: TextStyles.bold18Blue,
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        SFText(
                          keyText: LocaleKeys.single_gacha,
                          style: TextStyles.blue14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 35),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cubit.gachaSpin(GachaSpinSchema(probability: timesProbability));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: AppColors.blue),
                        borderRadius: BorderRadius.circular(15),
                        color: AppColors.blue.withOpacity(0.05)
                    ),
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.symmetric(
                        vertical: 15, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SFText(
                            keyText: '$timesGacha SLFT',
                            style: TextStyles.bold18Blue),
                        const SizedBox(
                          height: 5,
                        ),
                        SFText(
                          keyText:
                          LocaleKeys.ten_times_gacha.tr(
                              namedArgs: {'num': '10'}),
                          style: TextStyles.blue14,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
