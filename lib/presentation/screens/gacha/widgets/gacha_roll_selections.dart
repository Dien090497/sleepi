import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_animation_screen.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

class GachaRollSelections extends StatefulWidget {
  const GachaRollSelections({
    Key? key,
    required this.singleGachaImages,
    required this.timesGachaImages,
    required this.singleProbability,
    required this.timesProbability,
    required this.normalGacha,
  }) : super(key: key);

  final String singleGachaImages;
  final String timesGachaImages;
  final int singleProbability;
  final int timesProbability;
  final bool normalGacha;

  @override
  State<GachaRollSelections> createState() => _GachaRollSelectionsState();
}

class _GachaRollSelectionsState extends State<GachaRollSelections> {
  bool enableButton = true;
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
                  animation: widget.normalGacha ? Const.normalGachaAnimation : Const.specialGachaAnimation,
                  audio: widget.normalGacha ? Const.normalGachaAudio : Const.specialGachaAudio,
              )
          );
          setState(() => enableButton = true);
        }
        },
        builder: (context, state) {
          final cubit = context.read<GachaSpinCubit>();
          return Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    enableButton ?  cubit.gachaSpin(GachaSpinSchema(probability: widget.singleProbability)) : null;
                    setState(() =>  enableButton = false);
                  },
                  child: SFIcon(widget.singleGachaImages),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cubit.gachaSpin(GachaSpinSchema(probability: widget.timesProbability));
                    setState(() =>  enableButton = false);
                  },
                  child: SFIcon(widget.timesGachaImages),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
