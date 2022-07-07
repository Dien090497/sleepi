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

class TabItemsBuy extends StatelessWidget {
  const TabItemsBuy({Key? key}) : super(key: key);

  void _showItemDialog(BuildContext context, MarketPlaceModel item) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpItemMarketPlace(
        item: item,
        onConfirmTap: () {
          Navigator.pop(context);
          showSuccessfulDialog(context, null);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<MarketPlaceModel> listItems = [];
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => MarketPlaceCubit()..init(3),
        child: BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
          listener: (context, state) {
            if (state is MarketPlaceStateSuccess) {
              listItems = state.list.list;
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
                            max: 5, min: 1, interval: 2),
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
                                      onRefresh: (){
                                        cubit.refresh();
                                      },
                                      childAspectRatio: 8 / 10,
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {
                                            _showItemDialog(
                                                context, listItems[i]);
                                          },
                                          child: ItemBedBuyWidget(
                                            item: listItems[i],
                                            onPressedButton: () {
                                              _showItemDialog(
                                                context,
                                                listItems[i],
                                              );
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
