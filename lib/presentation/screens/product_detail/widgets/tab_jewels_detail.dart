import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabJewelsDetail extends StatefulWidget {
  const TabJewelsDetail({Key? key}) : super(key: key);

  @override
  State<TabJewelsDetail> createState() => _TabJewelsDetailState();
}

class _TabJewelsDetailState extends State<TabJewelsDetail> {
  late List<BedEntity> listJewels = [];
  final CategoryType categoryType = CategoryType.jewel;

  void _showJewelDialog(BuildContext context, JewelEntity jewel) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          jewel: jewel,
          onSellTap: () {},
          onTransferTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: BlocProvider(
          create: (context) => NFTListCubit()..init(categoryType),
          child: BlocConsumer<NFTListCubit, NftListState>(
            listener: (context, state) {
              if (state is NftListLoaded) {
                listJewels = state.listBed;
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
                        texts: const [LocaleKeys.jewels, LocaleKeys.upgrade]),
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
                                  count: listJewels.length,
                                  childAspectRatio: 1,
                                  onRefresh: () {
                                    cubit.refresh(categoryType);
                                  },
                                  itemBuilder: (context, i) {
                                    return GestureDetector(
                                      onTap: () {
                                        _showJewelDialog(
                                            context,
                                            JewelEntity.fromBedEntity(
                                                listJewels[i]));
                                      },
                                      child: MyJewelsShortWidget(
                                        jewel: JewelEntity.fromBedEntity(
                                            listJewels[i]),
                                      ),
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
