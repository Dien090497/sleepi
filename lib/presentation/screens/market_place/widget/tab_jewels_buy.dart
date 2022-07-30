import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_state.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_jewel_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'jewel_buy_widget.dart';

class TabJewelsBuy extends StatelessWidget {
  const TabJewelsBuy({Key? key, required this.cubit}) : super(key: key);
  final MarketPlaceCubit cubit;

  void _showJewelDialog(
      BuildContext context, MarketPlaceModel jewel, MarketPlaceCubit cubit) {
    bool isBuying = false;
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpJewelMarketPlace(
        jewel: jewel,
        cubit: cubit,
        onConfirmTap: () async {
          if (isBuying) return;
          isBuying = true;
          Navigator.pop(context);
          final msg = await cubit.buyNFT(jewel.nftId);
          cubit.refresh();
          if (msg.isEmpty) {
            showSuccessfulDialog(context, LocaleKeys.purchased_successfully);
            context.read<UserBloc>().add(const RefreshBalanceToken());
          } else {
            showMessageDialog(context, msg);
          }
          isBuying = false;
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocBuilder<MarketPlaceCubit, MarketPlaceState>(
        bloc: cubit,
        builder: (context, state) {
          return Column(
            children: [
              TabBarFilter(
                cubit: cubit,
                tabTexts: const [LocaleKeys.buy, LocaleKeys.rent],
                onFilterTap: () {
                  showFilterModalBottomSheet(
                    cubit: cubit,
                    context,
                    sections: {
                      LocaleKeys.type.tr(): [
                        LocaleKeys.ruby.tr(),
                        LocaleKeys.sapphire.tr(),
                        LocaleKeys.emerald.tr(),
                        LocaleKeys.diamond.tr(),
                        LocaleKeys.amethyst.tr(),
                      ],
                    },
                    sliders: {
                      LocaleKeys.level.tr(): FilterSliderValues(
                          max: 5,
                          min: 1,
                          value: SfRangeValues(
                            cubit.params.minLevel,
                            cubit.params.maxLevel,
                          )),
                    },
                  );
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12.w),
                  child: state is MarketPlaceStateLoaded
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  SFGridView(
                                    count: state.list.length,
                                    childAspectRatio: 8 / 10,
                                    onRefresh: () {
                                      cubit.refresh();
                                    },
                                    marketPlaceCubit: cubit,
                                    isLoadMore: cubit.loadMore,
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          _showJewelDialog(
                                              context, state.list[i], cubit);
                                        },
                                        child: JewelsBuyWidget(
                                          jewel: state.list[i],
                                          onPressedButton: () {
                                            _showJewelDialog(
                                                context, state.list[i], cubit);
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                        bottom:
                                            MediaQuery.of(context).size.height *
                                                0.3),
                                    child: const Center(
                                      child: SFIcon(Ics.commingSoon),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        )
                      : state is MarketPlaceStateLoading ||
                              (state is MarketPlaceStateLoaded &&
                                  state.isLoading)
                          ? const LoadingIcon()
                          : const SizedBox(),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
