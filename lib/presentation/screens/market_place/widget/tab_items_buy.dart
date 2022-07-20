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

class TabItemsBuy extends StatefulWidget {
  const TabItemsBuy({Key? key, required this.cubit}) : super(key: key);
  final MarketPlaceCubit cubit;

  @override
  State<TabItemsBuy> createState() => _TabItemsBuyState();
}

class _TabItemsBuyState extends State<TabItemsBuy> {
  List<MarketPlaceModel> listItems = [];

  @override
  void dispose() {
    super.dispose();
  }

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
        bloc: widget.cubit,
        listener: (context, state) {
          final cubit = context.read<MarketPlaceCubit>();
          if (state is MarketPlaceStateLoaded) {
            listItems = state.list.list;
          }

          if (state is MarketPlaceStateLoadedMore) {
            listItems.addAll(state.list.list);
            setState(() {});
          }

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
                cubit: widget.cubit,
                tabTexts: const [LocaleKeys.buy, LocaleKeys.rent],
                onFilterTap: () {
                  showFilterModalBottomSheet(
                    cubit: widget.cubit,
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
                            widget.cubit.params.minLevel,
                            widget.cubit.params.maxLevel,
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
                  child: (state is MarketPlaceStateLoading)
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  SFGridView(
                                    marketPlaceCubit: widget.cubit,
                                    isLoadMore: widget.cubit.loadMore,
                                    count: listItems.length,
                                    isScroll: true,
                                    onRefresh: () {
                                      widget.cubit.refresh();
                                    },
                                    childAspectRatio: 8 / 10,
                                    itemBuilder: (context, i) {
                                      return GestureDetector(
                                        onTap: () {
                                          _showItemDialog(context, listItems[i],
                                              widget.cubit);
                                        },
                                        child: ItemBedBuyWidget(
                                          item: listItems[i],
                                          onPressedButton: () {
                                            _showItemDialog(context,
                                                listItems[i], widget.cubit);
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
