import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/loading_screen.dart';
import 'package:slee_fi/common/widgets/sf_buttons.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_gridview.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_bloc.dart';
import 'package:slee_fi/presentation/blocs/bottom_navigation/bottom_navigation_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_bloc.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/jewel_dialog_body.dart';
import 'package:slee_fi/presentation/screens/product_detail/widgets/my_jewel_short_widget.dart';

class ModalJewelList extends StatelessWidget {
  const ModalJewelList({Key? key, required this.socketBloc}) : super(key: key);
  final SocketBloc socketBloc;

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
                  keyText: LocaleKeys.jewel_list,
                  style: TextStyles.bold18White,
                ),
                const Spacer(),
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
              child: BlocBuilder<SocketBloc, SocketState>(
                bloc: socketBloc,
                builder: (context, state) {
                  if ((state is SocketStateLoaded && state.jewels == null) ||
                      (state is! SocketStateLoaded)) {
                    socketBloc.add(const FetchJewels());
                  }

                  if (state is SocketStateLoaded && state.jewels != null) {
                    return SFGridView(
                      isLoadMore: state.loadMoreJewel,
                      isScroll: true,
                      count: state.jewels!.length,
                      childAspectRatio: 1,
                      onLoadMore: _onLoadMore(),
                      onRefresh: () => socketBloc.add(const RefreshJewels()),
                      itemBuilder: (context, i) {
                        final item = state.jewels![i];
                        return GestureDetector(
                          onTap: () {
                            _showDialogJewelDetail(
                              context,
                              item,
                              socketBloc,
                            );
                          },
                          child: MyJewelsShortWidget(
                              jewel: item, color: AppColors.light4),
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
          BlocBuilder<SocketBloc, SocketState>(
            bloc: socketBloc,
            builder: (context, state) => SFButton(
                text: state is SocketStateLoaded &&
                        state.jewels?.isNotEmpty == true
                    ? LocaleKeys.cancel
                    : LocaleKeys.buy,
                width: MediaQuery.of(context).size.width * 0.9,
                color: AppColors.blue,
                textStyle: TextStyles.w600WhiteSize16,
                height: 48,
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                  if (state is SocketStateLoaded &&
                      state.jewels?.isEmpty == true) {
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
    socketBloc.add(const FetchJewels());
    await Future.delayed(const Duration(milliseconds: 5000));
  }

  _showDialogJewelDetail(
      BuildContext context, JewelEntity jewelEntity, SocketBloc bloc) {
    showCustomDialog(
      context,
      padding: const EdgeInsets.all(24),
      children: [
        JewelDialogBody(
          jewel: jewelEntity,
          onSellTap: () {
            Navigator.pop(context);
          },
          onTransferTap: () {
            bloc.add(AddJewel(jewelEntity));
            Navigator.pop(context);
            Navigator.pop(context);
          },
          textOnSell: LocaleKeys.cancel,
          textOnTransfer: LocaleKeys.add_jewel.tr(),
        ),
      ],
    );
  }
}
