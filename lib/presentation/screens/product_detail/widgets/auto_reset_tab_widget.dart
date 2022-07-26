import 'package:flutter/material.dart';
import 'package:focus_detector/focus_detector.dart';

class AutoResetTabWidget extends StatelessWidget {
  const AutoResetTabWidget({Key? key, required this.child, this.onRefreshTab})
      : super(key: key);
  final Widget child;
  final Function()? onRefreshTab;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final tabController = DefaultTabController.of(context);
            return FocusDetector(
              child: child,
              onFocusGained: () {
                if (tabController?.index == 1) {
                  tabController?.animateTo(0);
                }
                if (onRefreshTab != null) {
                  onRefreshTab!();
                }
              },
            );
          },
        ));
  }
}
