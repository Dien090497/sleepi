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

import 'jewel_buy_widget.dart';

class TabJewelsBuy extends StatelessWidget {
  const TabJewelsBuy({Key? key}) : super(key: key);

  void _showJewelDialog(BuildContext context, MarketPlaceModel jewel) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpJewelMarketPlace(
        jewel: jewel,
        onConfirmTap: () {
          Navigator.pop(context);
          showSuccessfulDialog(context, null);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<MarketPlaceModel> listJewels = [];

    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => MarketPlaceCubit()..init(2),
        child: BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
          listener: (context, state) {
            if (state is MarketPlaceStateSuccess) {
              listJewels = state.list.list;
            }
          },
          builder: (context, state) {
            final cubit = context.read<MarketPlaceCubit>();
            return Column(
              children: [
                TabBarFilter(
                  tabTexts: const [LocaleKeys.buy, LocaleKeys.rent],
                  onFilterTap: () {
                    showFilterModalBottomSheet(
                      context,
                      sections: {
                        LocaleKeys.type: [
                          LocaleKeys.efficiency.tr(),
                          LocaleKeys.luck.tr(),
                          LocaleKeys.resilience.tr(),
                          LocaleKeys.special.tr(),
                          LocaleKeys.bonus.tr(),
                        ],
                      },
                      sliders: {
                        LocaleKeys.level: const FilterSliderValues(
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
                                      count: listJewels.length,
                                      childAspectRatio: 8 / 10,
                                      onRefresh: (){
                                        cubit.refresh(2);
                                      },
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {
                                            _showJewelDialog(
                                                context, listJewels[i]);
                                          },
                                          child: JewelsBuyWidget(
                                            jewel: listJewels[i],
                                            onPressedButton: () {
                                              _showJewelDialog(
                                                  context, listJewels[i]);
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
      ),
    );
  }
}
