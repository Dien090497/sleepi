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
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/presentation/screens/home/widgets/my_jewel_short_widget.dart';
import 'package:slee_fi/presentation/screens/home/widgets/pop_up_item.dart';
import 'package:slee_fi/resources/resources.dart';

class ModalItemList extends StatelessWidget {
  const ModalItemList({Key? key, required this.homeBloc}) : super(key: key);
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
                    showFilterItemBottomSheet(context, homeBloc: homeBloc);
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
              child: BlocBuilder<HomeBloc, HomeState>(
                bloc: homeBloc,
                builder: (context, state) {
                  if ((state is HomeLoaded && state.itemList == null) ||
                      (state is! HomeLoaded)) {
                    homeBloc.add(FetchItem());
                  }

                  if (state is HomeLoaded && state.itemList != null) {
                    return SFGridView(
                      isLoadMore: state.loadMoreItem,
                      isScroll: true,
                      count: state.itemList!.length,
                      childAspectRatio: 1,
                      onLoadMore: _onLoadMore(),
                      onRefresh: () => homeBloc.add(RefreshItem()),
                      itemBuilder: (context, i) {
                        final item = state.itemList![i];
                        return GestureDetector(
                          onTap: () {
                            showCustomAlertDialog(context,
                                children: PopUpItem(
                                  level: item.level,
                                  effect: item.effect,
                                  id: '${item.id}',
                                  icon: item.image,
                                  onConfirm: () {
                                    homeBloc.add(AddItem(item));
                                  },
                                ));
                          },
                          child: MyJewelsShortWidget(
                            level: item.level,
                            id: '${item.id}',
                            increase: i == 2 ? false : true,
                            color: AppColors.light4,
                            icon: item.image,
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
          BlocBuilder<HomeBloc, HomeState>(
            bloc: homeBloc,
            builder: (context, state) => SFButton(
                text: state is HomeLoaded && state.itemList?.isNotEmpty == true
                    ? LocaleKeys.cancel
                    : LocaleKeys.buy,
                width: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                  if (state is HomeLoaded && state.itemList?.isEmpty == true) {
                    BlocProvider.of<BottomNavigationBloc>(context)
                        .add(const SelectTab(4,indexTabChild: 2));
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
    homeBloc.add(LoadMoreItem());
    await Future.delayed(const Duration(milliseconds: 5000));
  }
}
