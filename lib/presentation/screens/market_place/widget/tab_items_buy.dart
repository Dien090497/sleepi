import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_state.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/item_bed_buy_widget.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_item_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key, required this.cubit}) : super(key: key);
  final MarketPlaceCubit cubit;

  void _showItemDialog(
      BuildContext context, MarketPlaceModel item, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpItemMarketPlace(
        item: item,
        cubit: cubit,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(item.nftId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
        bloc: cubit,
        listener: (context, state) {
          final cubit = context.read<MarketPlaceCubit>();

          if (state is MarketPlaceStateBuySuccess) {
            cubit.refresh();
            showSuccessfulDialog(context, LocaleKeys.purchased_successfully);
          }

          if (state is MarketPlaceStateBuyFailed) {
            cubit.refresh();
            showMessageDialog(context, state.msg);
          }
        },
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
                        LocaleKeys.blue,
                        LocaleKeys.purple,
                        LocaleKeys.red,
                        LocaleKeys.white,
                      ],
                    },
                    sliders: {
                      LocaleKeys.level.tr(): FilterSliderValues(
                          value: SfRangeValues(
                            cubit.params.minLevel,
                            cubit.params.maxLevel,
                          ),
                          max: 5,
                          min: 1),
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
                                    marketPlaceCubit: cubit,
                                    isLoadMore: cubit.loadMore,
                                    count: state.list.length,
                                    isScroll: true,
                                    onRefresh: () {
                                      cubit.refresh();
                                    },
                                    childAspectRatio: 8 / 10,
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          _showItemDialog(
                                              context, state.list[i], cubit);
                                        },
                                        child: ItemBedBuyWidget(
                                          item: state.list[i],
                                          onPressedButton: () {
                                            _showItemDialog(
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
                                  // SFGridView(
                                ],
                              ),
                            ),
                          ],
                        )
                      : state is MarketPlaceStateLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
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
