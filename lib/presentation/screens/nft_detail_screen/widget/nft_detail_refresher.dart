import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_cubit.dart';
import 'package:slee_fi/presentation/blocs/nft_detail/nft_detail_state.dart';

class NftDetailRefresher extends StatefulWidget {
  const NftDetailRefresher({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<NftDetailRefresher> createState() => _NftDetailRefresherState();
}

class _NftDetailRefresherState extends State<NftDetailRefresher> {
  final refreshController = RefreshController();

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NftDetailCubit, NftDetailState>(
      builder: (context, state) {
        final nftCubit = context.read<NftDetailCubit>();

        return SmartRefresher(
          controller: refreshController,
          enablePullUp: state is NftDetailLoaded && state.hasMore,
          enablePullDown: state is NftDetailLoaded,
          onRefresh: () {
            nftCubit.refresh().then((_) {
              refreshController.refreshCompleted();
            });
          },
          onLoading: () {
            nftCubit.loadMore().then((_) {
              refreshController.loadComplete();
            });
          },
          child: widget.child,
        );
      },
    );
  }
}
