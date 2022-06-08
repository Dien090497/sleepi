import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/common/style/app_colors.dart';
import 'package:slee_fi/common/widgets/sf_dialog.dart';

class ChartTabBody extends StatelessWidget {
  ChartTabBody(
      {Key? key,
      required this.picker,
      required this.onPreviousTap,
      required this.onNextTap,
      required this.text,
      required this.children})
      : super(key: key);

  final Widget picker;
  final VoidCallback onPreviousTap;
  final VoidCallback onNextTap;
  final String text;
  final List<Widget> children;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
                children: [picker],
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: onPreviousTap,
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 18,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.arrow_back_ios,
                      color: AppColors.lightGrey),
                ),
                Text(text),
                IconButton(
                  onPressed: onNextTap,
                  padding: EdgeInsets.zero,
                  iconSize: 20,
                  splashRadius: 18,
                  alignment: Alignment.center,
                  icon: const Icon(Icons.arrow_forward_ios,
                      color: AppColors.lightGrey),
                ),
              ],
            ),
          ),
          const SizedBox(height: 8),
          ...children,
        ],
      ),
    );
  }
}
