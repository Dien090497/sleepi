import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_cancel_sell.dart';

class CancelSellBottombar extends StatelessWidget {
  const CancelSellBottombar(
      {Key? key, required this.beds, required this.onCancelSellSuccess})
      : super(key: key);
  final BedEntity beds;
  final Function onCancelSellSuccess;

  void _showBedDialog(BuildContext context, BedEntity beds,
      BottomBarInfoIndividualCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: CancelSell(
        bedEntity: beds,
        cubit: cubit,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cubit = BottomBarInfoIndividualCubit()..init();
    return BlocProvider(
      create: (context) => cubit,
      child: BlocConsumer<BottomBarInfoIndividualCubit,
          BottomBarInfoIndividualState>(
        listener: (context, state) {
          if (state is BottomBarInfoIndividualError) {
            showMessageDialog(context, state.message);
          }

          if (state is BottomBarInfoIndividualLoaded) {
            if (state.successTransfer) {
              showSuccessfulDialog(context, null, onBackPress: () {
                Navigator.pop(context);
                Navigator.pop(context);
              });
              onCancelSellSuccess();
            }
          }
        },
        builder: (context, state) {
          return Material(
            color: Colors.transparent,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                      height: 56,
                      decoration: BoxDecoration(
                        gradient: AppColors.gradientBlueButton,
                        borderRadius: BorderRadius.circular(25),
                      ),
                    ),
                    Container(
                      height: 54,
                      margin: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                        color: AppColors.lightDark,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(width: 12),
                            Expanded(
                              child: SFText(
                                keyText: '${beds.price}',
                                style: TextStyles.white16,
                              ),
                            ),
                            SFButton(
                              text: LocaleKeys.cancel_sell,
                              textStyle: TextStyles.white14W700,
                              gradient: AppColors.gradientBlueButton,
                              onPressed: () {
                                _showBedDialog(context, beds, cubit);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
