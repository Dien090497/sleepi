import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_card.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/bottom_bar_info_individual/bottom_bar_info_individual_state.dart';

class PopUpTransfer extends StatelessWidget {
  const PopUpTransfer({
    Key? key,
    this.onCancel,
    required this.valueTransfer,
    required this.bedEntity,
    required this.cubit,
  }) : super(key: key);

  final int valueTransfer;
  final VoidCallback? onCancel;
  final BedEntity bedEntity;
  final BottomBarInfoIndividualCubit cubit;

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<BottomBarInfoIndividualCubit, BottomBarInfoIndividualState>(
      bloc: cubit,
      builder: (context, state) {
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
                  keyText: LocaleKeys.confirm_transfer,
                  style: TextStyles.white1w700size16,
                ),
                const SizedBox(height: 20),
                SFCard(
                  margin: EdgeInsets.zero,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 18),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          SFText(
                            keyText: LocaleKeys.from,
                            style: TextStyles.lightGrey12,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: SFText(
                              keyText: LocaleKeys.to,
                              style: TextStyles.lightGrey12,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          SFText(
                            keyText: LocaleKeys.inventory,
                            style: TextStyles.bold16LightWhite,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: SFText(
                              keyText: LocaleKeys.wallet,
                              style: TextStyles.bold16LightWhite,
                              textAlign: TextAlign.right,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    SFText(
                      keyText: LocaleKeys.fee,
                      style: TextStyles.lightGrey12,
                    ),
                    const SizedBox(width: 4),
                    state is BottomBarInfoIndividualLoaded ?
                      Expanded(
                        child: SFText(
                          keyText: '${state.gasPrice} AVAX',
                          textAlign: TextAlign.right,
                          style: TextStyles.white12,
                        ),
                      )
                      : Expanded(
                        child: SFText(
                          keyText: '--.-- AVAX',
                          textAlign: TextAlign.right,
                          style: TextStyles.white12,
                        ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    SFText(
                      keyText: LocaleKeys.you_will_transfer,
                      style: TextStyles.lightGrey12,
                    ),
                    const SizedBox(width: 4),
                    Expanded(
                        child: SFText(
                          keyText: '$valueTransfer NFT',
                          textAlign: TextAlign.right,
                          style: TextStyles.white12,
                        )),
                  ],
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
                        textStyle: TextStyles.lightGrey16,
                        color: AppColors.light4,
                        width: double.infinity,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: SFButton(
                        text: LocaleKeys.confirm,
                        onPressed: () {
                          cubit.transferNFTtoMainWallet(contractAddress: bedEntity.contractAddress, tokenId: bedEntity.tokenId.toString());
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
