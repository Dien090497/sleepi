import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_animation_screen.dart';
import 'package:slee_fi/presentation/screens/gacha/widgets/pop_up_gacha_confirm.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/schema/gacha/gacha_spin_schema.dart';

class GachaRollSelections extends StatefulWidget {
  const GachaRollSelections({
    Key? key,
    required this.singleGachaImages,
    required this.timesGachaImages,
    required this.costSingle,
    required this.costMultiple,
    required this.singleProbability,
    required this.timesProbability,
    required this.normalGacha,
    required this.onPressed,
  }) : super(key: key);

  final String singleGachaImages;
  final String timesGachaImages;
  final int singleProbability;
  final int timesProbability;
  final int costSingle;
  final int costMultiple;
  final bool normalGacha;
  final VoidCallback onPressed;

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
          if (state is GachaSpinFailed) {
            Navigator.pop(context, true);
            showMessageDialog(context, "You don't have enough money");
          }
        if(state is GachaSpinSuccess) {
          Navigator.pop(context, true);
          Navigator.pushNamed(context, R.gachaAnimation,
              arguments: GachaAnimationArguments(
                  spinInfo: state.gachaSpinResponse,
                  animation: widget.normalGacha ? Const.normalGachaAnimation : Const.specialGachaAnimation,
                  audio: widget.normalGacha ? Const.normalGachaAudio : Const.specialGachaAudio,
              )
          ).then((value) => widget.onPressed());
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
                    showCustomAlertDialog(context,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        width: MediaQuery.of(context).size.width * 0.95,
                        children:  PopupGachaConfirm(
                          priceSpin: widget.costSingle,
                          quantity: 1,
                          onConfirmTap: () {
                            enableButton ? cubit.gachaSpin(GachaSpinSchema(probability: widget.singleProbability)) : null;
                            setState(() =>  enableButton = false);
                            Navigator.pop(context, true);
                            showLoadingDialog(context, "Loading", barrierDismissible: false);
                          },
                        ));
                  },
                  child: Stack(
                      children: [
                        SFIcon(widget.singleGachaImages, fit: BoxFit.fill),
                        Positioned(
                            bottom: 10,
                            right: 20,
                            child: Row(
                              children: [
                                const SFIcon(Ics.icSlft),
                                const SizedBox(width: 8,),
                                SFText(keyText: "${widget.costSingle}", style: TextStyles.w600WhiteSize16,),
                              ],
                            ))
                      ]
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    showCustomAlertDialog(context,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        width: MediaQuery.of(context).size.width * 0.95,
                        children:  PopupGachaConfirm(
                          priceSpin: widget.costMultiple,
                          quantity: 10,
                          onConfirmTap: () {
                            enableButton ? cubit.gachaSpin(GachaSpinSchema(probability: widget.timesProbability)) : null;
                            setState(() =>  enableButton = false);
                            Navigator.pop(context, true);
                            showLoadingDialog(context, "Loading", barrierDismissible: false);
                          }
                        )
                    );
                  },
                  child: Stack(
                      children: [
                        SFIcon(widget.timesGachaImages, fit: BoxFit.fill),
                        Positioned(
                          bottom: 10,
                            right: 20,
                            child: Row(
                              children: [
                                const SFIcon(Ics.icSlft),
                                const SizedBox(width: 8,),
                                SFText(keyText: "${widget.costMultiple}", style: TextStyles.w600Light4Size16,),
                              ],
                            ))
                      ]
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
