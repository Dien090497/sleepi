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
import 'package:slee_fi/presentation/screens/market_place/widget/tab_bar_filter.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class TabBedsBuy extends StatelessWidget {
  const TabBedsBuy({Key? key, required this.cubit}) : super(key: key);
  final MarketPlaceCubit cubit;

  void _showBedDialog(
      BuildContext context, MarketPlaceModel bed, MarketPlaceCubit cubit) {
    showCustomAlertDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: PopUpBedMarketPlace(
        bed: bed,
        cubit: cubit,
        onConfirmTap: () {
          Navigator.pop(context);
          cubit.buyNFT(bed.nftId);
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
                        LocaleKeys.bed,
                        LocaleKeys.bedbox,
                        LocaleKeys.genesis_beds,
                      ],
                      LocaleKeys.class_.tr(): [
                        LocaleKeys.short,
                        LocaleKeys.middle,
                        LocaleKeys.long,
                        LocaleKeys.flexible,
                      ],
                      LocaleKeys.quality.tr(): [
                        LocaleKeys.common,
                        LocaleKeys.uncommon,
                        LocaleKeys.rare,
                        LocaleKeys.epic,
                        LocaleKeys.legendary,
                      ],
                    },
                    sliders: {
                      LocaleKeys.level.tr(): FilterSliderValues(
                          value: SfRangeValues(
                            cubit.params.minLevel,
                            cubit.params.maxLevel,
                          ),
                          max: 30,
                          min: 0),
                      LocaleKeys.mint.tr(): FilterSliderValues(
                          max: 7.0,
                          min: 0,
                          value: SfRangeValues(cubit.params.minBedMint,
                              cubit.params.maxBedMint)),
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
                                  GridViewBedItem(
                                    cubit: cubit,
                                    isLoadMore: cubit.loadMore,
                                    beds: state.list,
                                    onRefresh: () {
                                      cubit.refresh();
                                    },
                                    onBuyTap: (bed) {
                                      _showBedDialog(context, bed, cubit);
                                    },
                                    onBedTap: (bed) {
                                      Navigator.pushNamed(context, R.nftInfo,
                                          arguments: InfoIndividualParams(
                                              bed: bed.toBedEntity(),
                                              marketPlaceModel: bed,
                                              buy: true));
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
                      : state is MarketPlaceStateLoading
                          ? const Center(child: CircularProgressIndicator())
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
