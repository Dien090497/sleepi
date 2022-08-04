import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_bed_market_place.dart';

class BottomBarMarketPlaceWidget extends StatelessWidget {
  const BottomBarMarketPlaceWidget({Key? key, required this.bed})
      : super(key: key);
  final MarketPlaceModel bed;

  void _showBedDialog(
      BuildContext context, MarketPlaceModel bed, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpBedMarketPlace(
        cubit: cubit,
        bed: bed,
        onConfirmTap: () async {
          Navigator.pop(context);
          final msg = await cubit.buyNFT(bed.nftId);
          cubit.refresh();
          if (msg.isEmpty) {
            showSuccessfulDialog(context, LocaleKeys.purchased_successfully)
                .then((value) {
              Navigator.pop(context);
              context.read<UserBloc>().add(const RefreshBalanceToken());
            });
          } else {
            showMessageDialog(context, msg).then((value) {
              Navigator.pop(context);
            });
          }
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MarketPlaceCubit(),
      child: BlocBuilder<MarketPlaceCubit, MarketPlaceState>(
        builder: (context, state) {
          final cubit = context.read<MarketPlaceCubit>();
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
                                keyText: '${bed.price} ${bed.symbol}',
                                style: TextStyles.white16,
                              ),
                            ),
                            SFButton(
                              text: LocaleKeys.buy_now,
                              textStyle: TextStyles.white14W700,
                              gradient: AppColors.gradientBlueButton,
                              onPressed: () {
                                _showBedDialog(context, bed, cubit);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (state is MarketPlaceStateLoading ||
                        (state is MarketPlaceStateLoaded && state.isLoading))
                      const LoadingIcon(),
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
