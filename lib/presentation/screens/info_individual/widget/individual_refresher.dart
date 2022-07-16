import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class IndividualRefresher extends StatefulWidget {
  const IndividualRefresher({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<IndividualRefresher> createState() => _IndividualRefresherState();
}

class _IndividualRefresherState extends State<IndividualRefresher> {
  final RefreshController _controller = RefreshController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: _controller,
      child: widget.child,
    );
  }
}
