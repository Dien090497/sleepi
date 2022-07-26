import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/routes/app_routes.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';
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
          refreshController.refreshCompleted();
          if ((!state.hasMore && widget.isBed) ||
              (!state.hasMoreBedBox && !widget.isBed)) {
            print('load no data   ${widget.isBed}');
            refreshController.loadNoData();
          }

          if (state.openBedBoxSuccess != null) {
            showSuccessfulDialog(context, null).then((value) =>
                Navigator.pushNamed(
                    context, R.nftInfo,
                    arguments: InfoIndividualParams(
                        bed: state.openBedBoxSuccess!, buy: false)));
            cubit.clearOpenSuccess();
          }
        }
        if (state is NftListError) {
          showMessageDialog(context, state.msg);
        }
      },
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
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
        child: widget.child,
      ),
    );
  }
}
