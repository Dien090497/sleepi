import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SFGridView extends StatelessWidget {
  SFGridView(
      {required this.itemBuilder,
      required this.count,
      Key? key,
      this.childAspectRatio = 9 / 10,
      this.isScroll = true})
      : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;
  final double childAspectRatio;
  final bool isScroll;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return isScroll
        ? SmartRefresher(
            controller: _refreshController,
            enablePullDown: true,
            header: const WaterDropHeader(),
            onRefresh: _onRefresh,
            child: GridView.builder(
              itemCount: count,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: childAspectRatio,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemBuilder: itemBuilder,
            ),
          )
        : GridView.builder(
            itemCount: count,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: childAspectRatio,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: itemBuilder,
          );
  }
}
