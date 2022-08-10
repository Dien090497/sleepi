import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';
import 'package:slee_fi/presentation/blocs/market_place/market_place_cubit.dart';
import 'package:slee_fi/presentation/blocs/mint/mint_cubit.dart';
import 'package:slee_fi/presentation/screens/wallet/widgets/no_result_widget.dart';

class SFGridView extends StatefulWidget {
  const SFGridView({
    required this.itemBuilder,
    required this.count,
    this.childAspectRatio = 9 / 10,
    this.isScroll = true,
    this.physics,
    this.padding,
    Key? key,
    this.onRefresh,
    this.isLoadMore = false,
    this.onLoadMore,
    this.marketPlaceCubit,
    this.mintCubit,
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;
  final double childAspectRatio;
  final bool isScroll;
  final bool isLoadMore;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final Function? onRefresh;
  final Future<void>? onLoadMore;
  final MarketPlaceCubit? marketPlaceCubit;
  final MintCubit? mintCubit;

  @override
  State<SFGridView> createState() => _SFGridViewState();
}

class _SFGridViewState extends State<SFGridView> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() {
    widget.onRefresh!();
    _refreshController.refreshCompleted();
  }

  void _onLoadMore() {
    if (widget.marketPlaceCubit != null) {
      widget.marketPlaceCubit!.loadMoreMarketPlace().then((value) {
        _refreshController.loadComplete();
      });
    } else if (widget.mintCubit != null) {
      widget.mintCubit!.getListMyBed().then((value) {
        _refreshController.loadComplete();
      });
    } else {
      if (widget.onLoadMore != null) {
        widget.onLoadMore!.then((value) {
          _refreshController.loadComplete();
        });
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    _refreshController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isScroll) {
      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: widget.isScroll,
        enablePullUp: widget.isLoadMore,
        header: const WaterDropHeader(),
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
              body = const CupertinoActivityIndicator();
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
        onRefresh: _onRefresh,
        onLoading: _onLoadMore,
        child: widget.count != 0
            ? GridView.builder(
                itemCount: widget.count,
                shrinkWrap: true,
                physics: widget.physics,
                padding:
                    widget.padding ?? const EdgeInsets.symmetric(vertical: 16),
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: widget.childAspectRatio,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 12,
                ),
                itemBuilder: widget.itemBuilder,
              )
            : const NoResultWidget(),
      );
    }
    return GridView.builder(
      itemCount: widget.count,
      shrinkWrap: true,
      physics: widget.physics,
      padding: const EdgeInsets.symmetric(vertical: 16),
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: widget.childAspectRatio,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
      ),
      itemBuilder: widget.itemBuilder,
    );
  }
}
