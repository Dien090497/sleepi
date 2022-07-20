import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabBedsDetail extends StatefulWidget {
  const TabBedsDetail({Key? key}) : super(key: key);

  @override
  State<TabBedsDetail> createState() => _TabBedsDetailState();
}

class _TabBedsDetailState extends State<TabBedsDetail> {
  late List<BedEntity> listBeds = [];
  final CategoryType categoryType = CategoryType.bed;

  // void _showBedDialog(BuildContext context) {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) => NFTListCubit()..init(categoryType),
          child: BlocConsumer<NFTListCubit, NftListState>(
            listener: (context, state) {
              if (state is NftListLoaded) {
                listBeds = state.listBed;
              }
            },
            builder: (context, state) {
              final cubit = context.read<NFTListCubit>();
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SFSubTabBar(
                        labelPadding: const EdgeInsets.symmetric(horizontal: 8),
                        texts: const [LocaleKeys.beds, LocaleKeys.bed_box]),
                    const SizedBox(height: 12),
                    Expanded(
                      child: TabBarView(
                        children: [
                          (state is NftListLoading)
                              ? const Center(child: CircularProgressIndicator())
                              : GridViewBedItem(
                                  onLoadMore: () {
                                    cubit.getNFTList(categoryType);
                                  },
                                  isLoadMore: state is NftListLoaded
                                      ? state.isLoadMore
                                      : false,
                                  beds: listBeds
                                      .where((element) => element.type == 'bed')
                                      .toList(),
                                  onRefresh: () {
                                    cubit.refresh(categoryType);
                                  },
                                  onBedTap: (bed) {
                                    Navigator.pushNamed(context, R.nftInfo,
                                        arguments: InfoIndividualParams(
                                            bed: bed, buy: true));
                                  }),
                          (state is NftListLoading)
                              ? const Center(child: CircularProgressIndicator())
                              : GridViewBedItem(
                                  onLoadMore: () {
                                    cubit.getNFTList(categoryType);
                                  },
                                  isLoadMore: state is NftListLoaded
                                      ? state.isLoadMore
                                      : false,
                                  beds: listBeds
                                      .where(
                                          (element) => element.type == 'bedbox')
                                      .toList(),
                                  onRefresh: () {
                                    cubit.refresh(categoryType);
                                  },
                                  onBedTap: (bed) {
                                    Navigator.pushNamed(context, R.nftInfo,
                                        arguments: InfoIndividualParams(
                                            bed: bed, buy: true));
                                  }),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ));
  }
}
