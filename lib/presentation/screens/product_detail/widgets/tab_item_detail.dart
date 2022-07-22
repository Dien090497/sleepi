import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_sub_tab_bar.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_item_short_widget.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/upgrade_tab.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

class TabItemDetail extends StatelessWidget {
  const TabItemDetail({Key? key}) : super(key: key);

  final CategoryType categoryType = CategoryType.item;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Padding(
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
                    BlocBuilder<JewelBloc, JewelState>(
                      builder: (context, state) {
                        final cubit = context.read<JewelBloc>();
                        return (state is! JewelStateLoaded)
                            ? const Center(child: CircularProgressIndicator())
                            : SFGridView(
                                isLoadMore: state.isLoadMore,
                                onLoadMore: _onLoadMore(cubit),
                                count: state.jewels.length,
                                childAspectRatio: 1,
                                onRefresh: () {
                                  cubit.add(const JewelRefreshList());
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
                                        name: state.jewels[i].name,
                                        image: state.jewels[i].image,
                                        quality: state.jewels[i].quality,
                                        level: state.jewels[i].level,
                                        type: state.jewels[i].type),
                                  );
                                },
                              );
                      },
                    ),
                    const UpGradeTab(isJewel: false),
                  ],
                ),
              ),
            ],
          ),
        ));
  }

  _onLoadMore(JewelBloc cubit) async {
    cubit.add(const JewelFetchList());
    await Future.delayed(const Duration(milliseconds: 1500));
  }
}
