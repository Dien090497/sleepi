import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_list/nft_list_state.dart';

class RefreshListWidget extends StatefulWidget {
  const RefreshListWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

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
          if (!state.hasMore) {
            refreshController.loadNoData();
          }
        }
      },
      child: SmartRefresher(
        controller: refreshController,
        enablePullUp: true,
        onRefresh: () {
          refreshController.requestRefresh();
          cubit.refresh();
        },
        onLoading: () {
          refreshController.requestLoading();
          cubit.loadMore();
        },
        child: widget.child,
      ),
    );
  }
}
