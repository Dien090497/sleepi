import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_item_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabItemDetail extends StatefulWidget {
  const TabItemDetail({Key? key}) : super(key: key);

  @override
  State<TabItemDetail> createState() => _TabItemDetailState();
}

class _TabItemDetailState extends State<TabItemDetail> {
  List<BedEntity> listItems = [];
  final CategoryType categoryType = CategoryType.item;

  // void _showItemDialog(BuildContext context, String img, String id) {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) => NFTListCubit()..init(categoryType),
          child: BlocConsumer<NFTListCubit, NftListState>(
            listener: (context, state) {
              if (state is NftListLoaded) {
                listItems = state.listBed;
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
                      texts: const [LocaleKeys.item, LocaleKeys.upgrade],
                    ),
                    const SizedBox(height: 12),
                    Expanded(
                      child: TabBarView(
                        children: [
                          (state is NftListLoading)
                              ? const Center(child: CircularProgressIndicator())
                              : SFGridView(
                                  isLoadMore: state is NftListLoaded
                                      ? state.isLoadMore
                                      : false,
                                  onLoadMore: _onLoadMore(cubit),
                                  count: listItems.length,
                                  childAspectRatio: 1,
                                  onRefresh: () {
                                    cubit.refresh(categoryType);
                                  },
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        // showCustomAlertDialog(context,
                                        //     children: PopUpItem(
                                        //       level: listItems[i].level,
                                        //       effect: '',
                                        //       id: '${listItems[i].id}',
                                        //       icon: listItems[i].image,
                                        //       onConfirm: () {
                                        //         // homeBloc.add(AddItem(item));
                                        //       },
                                        //     ));
                                      },
                                      child: MyItemsShortWidget(
                                          tokenId:
                                              listItems[i].tokenId.toString(),
                                          image: listItems[i].image,
                                          quality: listItems[i].quality,
                                          level: listItems[i].level,
                                          type: listItems[i].type),
                                    );
                                  },
                                ),
                          const UpGradeTab(),
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

  _onLoadMore(NFTListCubit cubit) async {
    cubit.getNFTList(categoryType);
    await Future.delayed(const Duration(milliseconds: 1500));
  }
}
