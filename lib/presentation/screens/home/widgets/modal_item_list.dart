import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_alert_dialog.dart';
import 'package:slee_fi/common/widgets/sf_bottom_sheets.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_icon.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_bloc.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_event.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_item_short_widget.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_item.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalItemList extends StatelessWidget {
  const ModalItemList({
    Key? key,
    required this.itemBloc,
    required this.homeBloc,
  }) : super(key: key);
  final ItemBloc itemBloc;
  final HomeBloc homeBloc;

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
                  keyText: LocaleKeys.item_list,
                  style: TextStyles.bold18White,
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () async {
                    showFilterItemBottomSheet(context, itemBloc: itemBloc);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: Row(
                      children: [
                        const SFIcon(Ics.filter, color: AppColors.blue),
                        const SizedBox(width: 4),
                        SFText(
                            keyText: LocaleKeys.filter,
                            style: TextStyles.blue16),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: BlocBuilder<ItemBloc, ItemState>(
                bloc: itemBloc,
                builder: (context, state) {
                  if ((state is ItemStateLoaded && state.itemList == null) ||
                      (state is! ItemStateLoaded)) {
                    itemBloc.add(const FetchItemEvent());
                  }

                  if (state is ItemStateLoaded && state.itemList != null) {
                    return SFGridView(
                      isLoadMore: state.loadMoreItem,
                      isScroll: true,
                      count: state.itemList!.length,
                      childAspectRatio: 1,
                      onLoadMore: _onLoadMore(),
                      onRefresh: () => itemBloc.add(const RefreshItemEvent()),
                      itemBuilder: (context, i) {
                        final item = state.itemList![i];
                        return GestureDetector(
                          onTap: () {
                            showCustomAlertDialog(context,
                                children: PopUpItem(
                                  level: item.level,
                                  type: item.type,
                                  id: item.name,
                                  icon: item.image,
                                  onConfirm: () {
                                    homeBloc.add(AddItem(item));
                                    itemBloc.add(AddItemSuccessEvent(item));
                                  },
                                ));
                          },
                          child: MyItemsShortWidget(
                            level: item.level,
                            quality: item.quality,
                            name: item.name,
                            color: AppColors.light4,
                            image: item.image,
                            type: item.type,
                            items: item,
                          ),
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
          BlocBuilder<ItemBloc, ItemState>(
            bloc: itemBloc,
            builder: (context, state) => SFButton(
                text: state is ItemStateLoaded &&
                        state.itemList?.isNotEmpty == true
                    ? LocaleKeys.cancel
                    : LocaleKeys.buy,
                width: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                  if (state is ItemStateLoaded &&
                      state.itemList?.isEmpty == true) {
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(const SelectTab(4, indexTabChild: 2));
                  }
                }),
          ),
          const SizedBox(
            height: 16,
          )
        ],
      ),
    );
  }

  Future<void> _onLoadMore() async {
    itemBloc.add(const LoadMoreItemEvent());
    await Future.delayed(const Duration(milliseconds: 5000));
  }
}
