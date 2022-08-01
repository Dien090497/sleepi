import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';
import 'package:slee_fi/presentation/screens/info_individual/info_individual_screen.dart';

class RefreshListWidget extends StatefulWidget {
  const RefreshListWidget({
    Key? key,
    required this.child,
    required this.isBed,
  }) : super(key: key);

  final Widget child;
  final bool isBed;

  @override
  State<RefreshListWidget> createState() => _RefreshListWidgetState();
}

class _RefreshListWidgetState extends State<RefreshListWidget> {
  final refreshController = RefreshController();

  bool loadMore = true;

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<NFTListCubit>();

    return BlocListener<NFTListCubit, NftListState>(
      listener: (context, state) {
        if (state is NftListLoaded) {
          if (!state.isLoadMore) {
            Future.delayed(const Duration(milliseconds: 300), () {
              refreshController.refreshCompleted();
              refreshController.loadComplete();
            });
          }
          if ((!state.hasMore && widget.isBed) ||
              (!state.hasMoreBedBox && !widget.isBed)) {
            loadMore = false;
            refreshController.loadComplete();
          }

          if (state.openBedBoxSuccess != null && !widget.isBed) {
            showSuccessfulDialog(context, null).then((value) =>
                Navigator.pushNamed(
                    context, R.nftInfo,
                    arguments: InfoIndividualParams(
                        bed: state.openBedBoxSuccess!, buy: false)));
            cubit.clearOpenSuccess();
          }
        }
        if (state is NftListError && !widget.isBed) {
          showMessageDialog(context, state.msg);
        }
      },
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: loadMore,
        onRefresh: () {
          refreshController.requestRefresh();
          if (widget.isBed) {
            cubit.refresh();
          } else {
            cubit.refreshBedBox();
          }
        },
        onLoading: () {
          refreshController.requestLoading();
          if (widget.isBed) {
            cubit.loadMore();
          } else {
            cubit.fetchBedBox();
          }
        },
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus? mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = SFText(
                keyText: LocaleKeys.pull_up_load,
                style: TextStyles.lightWhite16,
              );
            } else if (mode == LoadStatus.loading) {
              body = const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = SFText(
                keyText: LocaleKeys.load_fail_retry,
                style: TextStyles.lightWhite16,
              );
            } else if (mode == LoadStatus.canLoading) {
              body = SFText(
                keyText: LocaleKeys.release_to_load_more,
                style: TextStyles.lightWhite16,
              );
            } else {
              body = SFText(
                keyText: LocaleKeys.no_more_data,
                style: TextStyles.lightWhite16,
              );
            }
            return SizedBox(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        child: widget.child,
      ),
    );
  }
}
