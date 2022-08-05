import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:focus_detector/focus_detector.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/presentation/blocs/home/home_bloc.dart';
import 'package:slee_fi/presentation/blocs/lucky_box/lucky_box_cubit.dart';
import 'package:slee_fi/presentation/blocs/user_bloc/user_bloc.dart';

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
    BlocProvider.of<HomeBloc>(context).add(const RefreshBed());
    BlocProvider.of<UserBloc>(context).add(const RefreshBalanceToken());
    BlocProvider.of<LuckyBoxCubit>(context).fetchLuckyBox();
    refreshController.refreshCompleted();
  }

  @override
  Widget build(BuildContext context) {
    return FocusDetector(
      onFocusGained: (){
        context.read<HomeBloc>().add(const FetchBedDetail());
      },
      child: SmartRefresher(
        controller: refreshController,
        enablePullDown: true,
        onRefresh: () {
          _onRefresh();
        },
        child: widget.child,
      ),
    );
  }
}
