import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_cubit.dart';
import 'package:slee_fi/presentation/blocs/individual/individual_state.dart';

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
    return BlocListener<IndividualCubit, IndividualState>(
      listener: (context, state) {
        if (!state.isLoading) {
          _controller.refreshCompleted();
        } else {
          _controller.requestRefresh();
        }
      },
      child: SmartRefresher(
        controller: _controller,
        child: widget.child,
        onRefresh: () {
          context.read<IndividualCubit>().refresh();
        },
      ),
    );
  }
}
