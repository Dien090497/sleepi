import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_percent_border.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_cubit.dart';
import 'package:slee_fi/presentation/blocs/gacha/gacha_spin_state.dart';
import 'package:slee_fi/presentation/screens/gacha/layout/gacha_animation_screen.dart';

class ChanceWidget extends StatelessWidget {
  const ChanceWidget(
      {required this.onPressed, required this.totalValue, required this.numberOfSpin, required this.normalGacha, Key? key})
      : super(key: key);
  final int numberOfSpin;
  final int totalValue;
  final bool normalGacha;
  final VoidCallback onPressed;

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
          if(state is GachaGetSuccess){
            Navigator.pop(context, true);
            Navigator.pushNamed(context, R.gachaAnimation,
                arguments: GachaAnimationArguments(
                  isGetSpin: true,
                  animation: normalGacha ? Const.normalGachaAnimation : Const.specialGachaAnimation,
                  audio: normalGacha ? Const.normalGachaAudio : Const.specialGachaAudio,
                  spinInfo: state.response,
                )
            ).then((value) => onPressed());
          }
        },
        builder: (context, state) {
          final cubit = context.read<GachaSpinCubit>();

          return Row(
            children: [
              Expanded(
                child: Stack(alignment: Alignment.centerLeft, children: [
                  SFPercentBorderGradient(
                    valueActive: numberOfSpin > totalValue ? totalValue.toDouble() : numberOfSpin.toDouble(),
                    totalValue: totalValue.toDouble(),
                    linearGradient: AppColors.gradientBlueButton,
                    lineHeight: 18,
                    barRadius: 20,
                    backgroundColor: Colors.white.withOpacity(0.05),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: SFText(
                      keyText: '$numberOfSpin/$totalValue',
                      style: TextStyles.white10,
                    ),
                  )
                ]),
              ),
              const SizedBox(width: 16,),
              SFButton(
                height: 32,
                text: LocaleKeys.get,
                textStyle: TextStyles.boldWhite14,
                gradient: numberOfSpin >= totalValue ? AppColors.gradientGacha : AppColors.gradientROI,
                disabled: numberOfSpin >= totalValue ? false : true,
                onPressed: () {
                  normalGacha  ? cubit.getCommon() : cubit.getSpecial();
                  showLoadingDialog(context);
                  // showCustomAlertDialog(context,
                  //     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  //     width: MediaQuery.of(context).size.width * 0.8,
                  //     children:  PopupGachaConfirm(
                  //       priceSpin: 0,
                  //       quantity: 1,
                  //       onConfirmTap: () {
                  //         normalGacha  ? cubit.getCommon() : cubit.getSpecial();
                  //         Navigator.pop(context, true);
                  //         showLoadingDialog(context, "Loading");
                  //       },
                  //     ));
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
