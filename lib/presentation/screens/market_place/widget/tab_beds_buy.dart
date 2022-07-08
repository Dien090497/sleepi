import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/models/market_place/market_place_model.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/filter_sheet.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/gridview_bed_item.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_bed_market_place.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/pop_up_insufficient.dart';
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';

class TabBedsBuy extends StatefulWidget {
  const TabBedsBuy({Key? key}) : super(key: key);

  @override
  State<TabBedsBuy> createState() => _TabBedsBuyState();
}

class _TabBedsBuyState extends State<TabBedsBuy> {
  late List<MarketPlaceModel> listBeds = [];

  void _showBedDialog(
      BuildContext context, MarketPlaceModel bed, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpBedMarketPlace(
        bed: bed,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(bed);
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
    return DefaultTabController(
      length: 2,
      child: BlocProvider(
        create: (context) => MarketPlaceCubit()..init(1),
        child: BlocConsumer<MarketPlaceCubit, MarketPlaceState>(
          listener: (context, state) {
            final cubit = context.read<MarketPlaceCubit>();
            if (state is MarketPlaceStateSuccess) {
              listBeds = state.list.list;
            }

            if (state is MarketPlaceStateBuySuccess) {
              cubit.refresh();
              showSuccessfulDialog(context, null);
            }

            if (state is MarketPlaceStateBuyNotEnoughAVAX) {
              _showDonWorryDialog(context, state.nft);
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
                          LocaleKeys.beds.tr(),
                          LocaleKeys.bed_box.tr(),
                          LocaleKeys.genesis_beds.tr(),
                        ],
                        LocaleKeys.class_.tr(): [
                          LocaleKeys.short.tr(),
                          LocaleKeys.middle.tr(),
                          LocaleKeys.long.tr(),
                          LocaleKeys.flexible.tr(),
                        ],
                        LocaleKeys.quality.tr(): [
                          LocaleKeys.common.tr(),
                          LocaleKeys.uncommon.tr(),
                          LocaleKeys.rare.tr(),
                          LocaleKeys.epic.tr(),
                          LocaleKeys.legendary.tr(),
                        ],
                      },
                      sliders: {
                        LocaleKeys.level.tr(): const FilterSliderValues(
                            max: 30, min: 0, interval: 30),
                        LocaleKeys.mint.tr():
                            const FilterSliderValues(max: 7, min: 0),
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
                                    GridViewBedItem(
                                      beds: listBeds,
                                      onRefresh: () {
                                        cubit.refresh();
                                      },
                                      onBuyTap: (bed) {
                                        _showBedDialog(context, bed, cubit);
                                      },
                                      onBedTap: (bed) {
                                        Navigator.pushNamed(context, R.nftInfo,
                                            arguments: InfoIndividualParams(
                                                bed: bed, buy: true));
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
