import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_bloc.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_event.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_widget_count.dart';

class ModalJewelList extends StatelessWidget {
  const ModalJewelList({
    Key? key,
    required this.jewelBloc,
    required this.isJewel,
  }) : super(key: key);
  final JewelBloc jewelBloc;
  final bool isJewel;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(32.0),
            child: Row(
              children: [
                SFText(
                  keyText:
                      isJewel ? LocaleKeys.jewel_list : LocaleKeys.item_list,
                  style: TextStyles.bold18White,
                ),
                // const Spacer(),
                // GestureDetector(
                //   onTap: () async {
                //     // showFilterItemBottomSheet(context, homeBloc: homeBloc);
                //   },
                //   child: Padding(
                //     padding: const EdgeInsets.only(left: 8),
                //     child: Row(
                //       children: [
                //         const SFIcon(Ics.filter, color: AppColors.blue),
                //         const SizedBox(width: 4),
                //         SFText(
                //             keyText: LocaleKeys.filter,
                //             style: TextStyles.blue16),
                //       ],
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<JewelBloc, JewelState>(
                bloc: jewelBloc,
                builder: (context, state) {
                  if ((state is JewelStateLoaded &&
                          state.isLoadMoreAvailable) ||
                      (state is! JewelStateLoaded)) {
                    jewelBloc.add(const JewelFetchListAvailable());
                  }

                  if (state is JewelStateLoaded) {
                    final map = <String, List<BedEntity>>{};

                    for (var element in state.jewelsAvailable) {
                      if (element.level >= 5) {
                        continue;
                      }
                      final key = '${element.type}_${element.level}';
                      if (map.containsKey(key)) {
                        map[key]!.add(element);
                      } else {
                        map[key] = [element];
                      }
                    }
                    final tempList = map.values.toList()
                      ..sort((a, b) => b.length.compareTo(a.length));
                    return SFGridView(
                      isLoadMore: state.isLoadMoreAvailable,
                      isScroll: true,
                      count: tempList.length,
                      childAspectRatio: 1,
                      onLoadMore: _onLoadMore(),
                      onRefresh: () =>
                          jewelBloc.add(const JewelRefreshListAvailable()),
                      itemBuilder: (context, i) {
                        final item = tempList[i];
                        return GestureDetector(
                          onTap: () {
                            if (item.length >= 3) {
                              Navigator.pop(context);
                              jewelBloc
                                  .add(AddJewelToSocket(item.sublist(0, 3)));
                            }
                          },
                          child: MyJewelsWidgetCount(
                              isJewel: isJewel,
                              count: item.length,
                              jewel: item.first,
                              color: AppColors.light4),
                        );
                      },
                    );
                  }
                  return const LoadingIcon();
                },
              ),
            ),
          ),
          const SizedBox(height: 16),
          BlocBuilder<JewelBloc, JewelState>(
            bloc: jewelBloc,
            builder: (context, state) => SFButton(
                text: state is JewelStateLoaded && state.jewels.isNotEmpty
                    ? LocaleKeys.cancel
                    : LocaleKeys.buy,
                width: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                  if (state is JewelStateLoaded &&
                      state.jewels.isEmpty == true) {
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(const SelectTab(4, indexTabChild: 1));
                  }
                }),
          ),
          const SizedBox(height: 16)
        ],
      ),
    );
  }

  Future<void> _onLoadMore() async {
    jewelBloc.add(const JewelFetchListAvailable());
    return Future.delayed(const Duration(milliseconds: 1500));
  }
}
