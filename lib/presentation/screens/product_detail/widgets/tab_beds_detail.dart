import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/auto_reset_tab_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/gridview_bed_item.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_item_bed_box.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/pop_up_bed_box_detail.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabBedsDetail extends StatefulWidget {
  const TabBedsDetail({Key? key}) : super(key: key);

  @override
  State<TabBedsDetail> createState() => _TabBedsDetailState();
}

class _TabBedsDetailState extends State<TabBedsDetail> {
  late List<BedEntity> listBeds = [];
  final CategoryType categoryType = CategoryType.bed;
  final cubit = NFTListCubit();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => cubit,
      child: AutoResetTabWidget(
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
                        texts: const [LocaleKeys.bed, LocaleKeys.bedbox]),
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
                              : SFGridView(
                                  onRefresh: () {
                                    cubit.refreshBedBox(categoryType);
                                  },
                                  isLoadMore: state is NftListLoaded
                                      ? state.isLoadMoreBedBox
                                      : false,
                                  onLoadMore: _onLoadMoreBedBox(),
                                  itemBuilder: (context, index) {
                                    final item = listBeds
                                        .where((element) =>
                                            element.type == 'bedbox')
                                        .toList()[index];
                                    return MyItemBedBox(
                                      bed: item,
                                      onTap: () {
                                        showCustomDialog(context,
                                            padding: const EdgeInsets.all(24),
                                            children: [
                                              PopUpBedBoxDetail(
                                                bedEntity: item,
                                                onTransfer: () {},
                                                onOpen: () {
                                                  context
                                                      .read<NFTListCubit>()
                                                      .openBedBox(item.id);
                                                },
                                                onSell: () {},
                                              )
                                            ]);
                                      },
                                    );
                                  },
                                  count: listBeds
                                      .where(
                                          (element) => element.type == 'bedbox')
                                      .length),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          onRefreshTab: () {
            if (listBeds.isEmpty) {
              cubit.init(categoryType);
            } else {
              cubit.refresh(categoryType);
            }
          }),
    );
  }

  Future<void> _onLoadMoreBedBox() async {
    return cubit.fetchBedBox(categoryType);
  }
}
