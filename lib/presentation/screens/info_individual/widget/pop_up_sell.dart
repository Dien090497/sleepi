import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/dismiss_keyboard_widget.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_infoIndividual/bottom_bar_infoIndividual_state.dart';

class PopUpSell extends StatefulWidget {
  const PopUpSell({
    Key? key,
    required this.bedEntity,
    required this.cubit,
  }) : super(key: key);

  final BedEntity bedEntity;
  final BottomBarInfoIndividualCubit cubit;

  @override
  State<PopUpSell> createState() => _PopUpSellState();
}

class _PopUpSellState extends State<PopUpSell> {
  int step = 0;
  bool amountNotZero = false;

  TextEditingController controller = TextEditingController();


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DismissKeyboardWidget(
      child: BlocBuilder<BottomBarInfoIndividualCubit, BottomBarInfoIndividualState>(
        bloc: widget.cubit,
        builder: (context, state) {
          return Stack(
            children: [
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.close, color: AppColors.lightGrey),
                ),
              ),
              Column(
                children: [
                  SFText(
                      keyText:
                      step == 2 ? LocaleKeys.confirm_to_sell : LocaleKeys.sell,
                      style: TextStyles.white1w700size18),
                  if (step >= 2) const SizedBox(height: 20),
                  if (step < 2)
                    SFIcon(
                      widget.bedEntity.image,
                      height: 160,
                      width: 160,
                    ),
                  if (step < 2)
                    Container(
                      decoration: BoxDecoration(
                        color: AppColors.blue.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                      child: SFText(keyText: widget.bedEntity.name, style: TextStyles.blue14),
                    ),
                  if (step < 2) const SizedBox(height: 32),
                  if (step == 0)
                    _Detail(
                      className: widget.bedEntity.nftClass,
                      level: widget.bedEntity.level.toString(),
                      durability: widget.bedEntity.durability.toInt().toString(),
                      bedMint: widget.bedEntity.bedMint.toString(),
                    )
                  else if (step == 1) ...[
                    Align(
                      alignment: Alignment.centerLeft,
                      child: SFText(
                        keyText: LocaleKeys.selling_price,
                        style: TextStyles.lightGrey14,
                      ),
                    ),
                    const SizedBox(height: 4),
                    _InputPrice(controller: controller,),
                    amountNotZero ? Align(
                      alignment: Alignment.centerLeft,
                      child: SFText(
                        keyText: LocaleKeys.amount_input_can_not_be_zero,
                        style: TextStyles.red14,
                      ),
                    ) : const SizedBox(),
                  ] else if (state is BottomBarInfoIndividualLoaded) ...[
                    _Confirm(amount: controller.text, fee: state.transactionFee,),
                    ]
                    else
                      _Confirm(amount: controller.text, fee: '--.--',),

                  const SizedBox(height: 24),
                  Row(
                    children: [
                      Expanded(
                        child: SFButton(
                          text: LocaleKeys.cancel,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          textStyle: TextStyles.lightGrey16,
                          color: AppColors.light4,
                          width: double.infinity,
                        ),
                      ),
                      const SizedBox(width: 12),
                      state is BottomBarInfoIndividualLoading ?
                        const Expanded(
                          child: LoadingIcon(),
                        )
                      : Expanded(
                        child: SFButton(
                          text: step < 2 ? LocaleKeys.next : LocaleKeys.confirm,
                          textStyle: TextStyles.white16,
                          width: double.infinity,
                          gradient: AppColors.gradientBlueButton,
                          onPressed: () {
                            switch (step) {
                              case 0:
                                step++;
                                break;
                              case 1:
                                if (controller.text.isNotEmpty) {
                                  setState(() {
                                    amountNotZero = false;
                                  });
                                  step++;
                                } else {
                                  setState(() {
                                    amountNotZero = true;
                                  });
                                }
                                break;
                              case 2:
                                widget.cubit.sellNFT(amount: controller.text, nftId: widget.bedEntity.nftId);
                                //Navigator.pop(context);
                                //showSuccessfulDialog(context, null);
                                break;
                            }
                            setState(() {});
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _Confirm extends StatelessWidget {
  const _Confirm({Key? key, required this.amount, required this.fee}) : super(key: key);

  final String amount;
  final String fee;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: SFText(
                  keyText: LocaleKeys.list_price,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: '$amount AVAX',
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Row(
        //   children: [
        //     Expanded(
        //       flex: 3,
        //       child: SFText(
        //           keyText: LocaleKeys.artist_royalties,
        //           style: TextStyles.lightGrey14),
        //     ),
        //     Expanded(
        //       child: SFText(
        //         keyText: '4%',
        //         style: TextStyles.lightWhite16,
        //         textAlign: TextAlign.right,
        //       ),
        //     ),
        //   ],
        // ),
        // const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText: LocaleKeys.transaction_fee,
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: '$fee%',
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: SFText(
                  keyText:
                      "${LocaleKeys.listing.tr()}/${LocaleKeys.cancel.tr()}",
                  style: TextStyles.lightGrey14),
            ),
            Expanded(
              child: SFText(
                keyText: LocaleKeys.free,
                style: TextStyles.lightWhite16,
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _InputPrice extends StatelessWidget {
  const _InputPrice({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.white.withOpacity(0.1)),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              style: TextStyles.lightWhite14,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [
                FilteringTextInputFormatter
                    .allow(RegExp(
                    r'^\d{1,}[.,]?\d{0,6}')),
              ],
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
              ),
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: SFText(keyText: 'AVAX', style: TextStyles.blue14W700),
          ),
        ],
      ),
    );
  }
}

class _Detail extends StatelessWidget {
  const _Detail({Key? key, required this.className, required this.durability, required this.level, required this.bedMint}) : super(key: key);

  final String className;
  final String durability;
  final String level;
  final String bedMint;

  @override
  Widget build(BuildContext context) {
    return SFCard(
      margin: EdgeInsets.zero,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 18),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(keyText: LocaleKeys.class_, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(keyText: className, style: TextStyles.lightWhite16W700),
              SizedBox(height: 24.h),
              SFText(
                  keyText: LocaleKeys.durability,
                  style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(keyText: '$durability/100', style: TextStyles.lightWhite16W700),
            ],
          ),
          const Spacer(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SFText(keyText: LocaleKeys.level, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),
              SFText(
                  keyText: level,
                  namedArgs: const {'num': ''},
                  style: TextStyles.lightWhite16W700),
              SizedBox(height: 24.h),
              SFText(
                  keyText: LocaleKeys.bed_mint, style: TextStyles.lightGrey14),
              SizedBox(height: 8.h),

              SFText(keyText: '$bedMint/7', style: TextStyles.lightWhite16W700),
            ],
          ),
        ],
      ),
    );
  }
}
