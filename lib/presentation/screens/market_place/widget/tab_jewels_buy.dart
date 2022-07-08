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
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_insufficient.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_jewel_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

import 'jewel_buy_widget.dart';

class TabJewelsBuy extends StatelessWidget {
  const TabJewelsBuy({Key? key}) : super(key: key);

  void _showJewelDialog(
      BuildContext context, MarketPlaceModel jewel, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpJewelMarketPlace(
        jewel: jewel,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(jewel);
        },
      ),
    );
  }

  void _showDonWorryDialog(BuildContext context, MarketPlaceModel nft) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopupInsufficient(
        nft: nft,
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

            if (state is MarketPlaceStateBuySuccess) {
              showSuccessfulDialog(context, null);
            }

            if (state is MarketPlaceStateBuyNotEnoughAVAX) {
              _showDonWorryDialog(context, state.nft);
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
                          LocaleKeys.bonus.tr(),
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
                                      count: listJewels.length,
                                      childAspectRatio: 8 / 10,
                                      onRefresh: () {
                                        cubit.refresh();
                                      },
                                      itemBuilder: (context, i) {
                                        return GestureDetector(
                                          onTap: () {
                                            _showJewelDialog(
                                                context, listJewels[i], cubit);
                                          },
                                          child: JewelsBuyWidget(
                                            jewel: listJewels[i],
                                            onPressedButton: () {
                                              _showJewelDialog(context,
                                                  listJewels[i], cubit);
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
