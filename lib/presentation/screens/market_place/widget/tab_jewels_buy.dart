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
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_jewel_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

import 'jewel_buy_widget.dart';

class TabJewelsBuy extends StatefulWidget {
  const TabJewelsBuy({Key? key, required this.cubit}) : super(key: key);
  final MarketPlaceCubit cubit;


  @override
  State<TabJewelsBuy> createState() => _TabJewelsBuyState();
}

class _TabJewelsBuyState extends State<TabJewelsBuy> {
  late List<MarketPlaceModel> listJewels = [];

  void _showJewelDialog(
      BuildContext context, MarketPlaceModel jewel, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpJewelMarketPlace(
        jewel: jewel,
        cubit: cubit,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(jewel.nftId);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:  BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
        bloc: widget.cubit,

        listener: (context, state) {
          final cubit = context.read<MarketPlaceCubit>();
          if (state is MarketPlaceStateLoaded) {
            listJewels = state.list.list;
          }

          if (state is MarketPlaceStateLoadedMore) {
            listJewels.addAll(state.list.list);
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
                            widget.cubit.params.minLevel,
                            widget.cubit.params.maxLevel,
                          )),
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
                              count: listJewels.length,
                              childAspectRatio: 8 / 10,
                              onRefresh: () {
                                widget.cubit.refresh();
                              },
                              marketPlaceCubit: widget.cubit,
                              isLoadMore: widget.cubit.loadMore,
                              itemBuilder: (context, i) {
                                return GestureDetector(
                                  onTap: () {
                                    _showJewelDialog(
                                        context, listJewels[i], widget.cubit);
                                  },
                                  child: JewelsBuyWidget(
                                    jewel: listJewels[i],
                                    onPressedButton: () {
                                      _showJewelDialog(context,
                                          listJewels[i], widget.cubit);
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
