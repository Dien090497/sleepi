import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/text_styles.dart';
import 'package:slee_fi/common/widgets/sf_text.dart';
import 'package:slee_fi/l10n/locale_keys.g.dart';

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
  }) : super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int count;
  final double childAspectRatio;
  final bool isScroll;
  final ScrollPhysics? physics;
  final EdgeInsets? padding;
  final Function? onRefresh;

  @override
  State<SFGridView> createState() => _SFGridViewState();
}

class _SFGridViewState extends State<SFGridView> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onRefresh() async {
    widget.onRefresh!();
    _refreshController.refreshCompleted();
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
        header: const WaterDropHeader(),
        onRefresh: _onRefresh,
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
            : SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 60),
                  child: SFText(
                    keyText: LocaleKeys.no_result,
                    style: TextStyles.lightWhite16,
                  ),
                ),
              ),
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
