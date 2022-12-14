import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';

class ChartTabBody extends StatefulWidget {
  const ChartTabBody({
    Key? key,
    required this.picker,
    required this.onPreviousTap,
    required this.onNextTap,
    required this.text,
    required this.children,
    required this.nextEnable,
    required this.prevEnable,
  }) : super(key: key);

  final Widget picker;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final String text;
  final bool nextEnable;
  final bool prevEnable;
  final List<Widget> children;

  @override
  State<ChartTabBody> createState() => _ChartTabBodyState();
}

class _ChartTabBodyState extends State<ChartTabBody> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void dispose() {
    _refreshController.dispose();
    super.dispose();
  }

  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _refreshController,
      enablePullDown: true,
      header: const WaterDropHeader(),
      onRefresh: _onRefresh,
      child: ListView(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
        children: [
          GestureDetector(
            onTap: () {
              showCustomDialog(
                context,
                children: [widget.picker],
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: widget.onPreviousTap,
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 18,
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: widget.prevEnable ? AppColors.light1 : AppColors.lightGrey,
                  ),
                ),
                Text(widget.text),
                IconButton(
                  onPressed: widget.onNextTap,
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 18,
                  alignment: Alignment.center,
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: widget.nextEnable ? AppColors.light1 : AppColors.lightGrey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ...widget.children,
        ],
      ),
    );
  }
}
