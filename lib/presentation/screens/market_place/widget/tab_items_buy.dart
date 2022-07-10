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

class TabItemsBuy extends StatefulWidget {
  const TabItemsBuy({Key? key}) : super(key: key);

  @override
  State<TabItemsBuy> createState() => _TabItemsBuyState();
}

class _TabItemsBuyState extends State<TabItemsBuy> {
  List<MarketPlaceModel> listItems = [];
  ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  void _showItemDialog(
      BuildContext context, MarketPlaceModel item, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpItemMarketPlace(
        item: item,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(item.id);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => MarketPlaceCubit()..init(3),
        child: BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
          listener: (context, state) {
            final cubit = context.read<MarketPlaceCubit>();
            if (state is MarketPlaceStateLoaded) {
              listItems = state.list.list;
            }
            if (state is MarketPlaceStateInit) {
              // scrollController.addListener(() {
              //   if (scrollController.position.maxScrollExtent ==
              //           scrollController.offset &&
              //       cubit.loadMore) {
              //     cubit.loadMoreMarketPlace();
              //   }
              // });
            }
            if (state is MarketPlaceStateBuySuccess) {
              cubit.refresh();
              showSuccessfulDialog(context, LocaleKeys.purchased_successfully);
            }

            if (state is MarketPlaceStateBuyFailed) {
              showMessageDialog(context, state.msg);
            }
          },
          builder: (context, state) {
            final cubit = context.read<MarketPlaceCubit>();
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
                          LocaleKeys.efficiency.tr(),
                          LocaleKeys.luck.tr(),
                          LocaleKeys.resilience.tr(),
                          LocaleKeys.special.tr(),
                        ],
                      },
                      sliders: {
                        LocaleKeys.level.tr(): const FilterSliderValues(
                            max: 5, min: 0, interval: 5),
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
                                      count: listItems.length,
                                      isScroll: true,
                                      onRefresh: () {
                                        cubit.refresh();
                                      },
                                      childAspectRatio: 8 / 10,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {
                                            _showItemDialog(
                                                context, listItems[i], cubit);
                                          },
                                          child: ItemBedBuyWidget(
                                            item: listItems[i],
                                            onPressedButton: () {
                                              _showItemDialog(
                                                  context, listItems[i], cubit);
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height *
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
      ),
    );
  }
}
