import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';

class HomeListWidget extends StatefulWidget {
  const HomeListWidget({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<HomeListWidget> createState() => _HomeListWidgetState();
}

class _HomeListWidgetState extends State<HomeListWidget> {
  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    super.dispose();
    refreshController.dispose();
  }

  void _onRefresh() async {
    BlocProvider.of<HomeBloc>(context).add(RefreshBed());
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      controller: refreshController,
      enablePullDown: true,
      onRefresh: () {
        _onRefresh();
      },
      child: widget.child,
    );
  }
}