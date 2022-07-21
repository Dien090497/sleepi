import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_jewel_usecase.dart';

import 'upgrade_jewel_event.dart';

class JewelBloc extends Bloc<JewelEvent, JewelState> {
  JewelBloc() : super(const JewelState.init()) {
    on<JewelFetchList>(_fetchJewels);
    on<JewelRefreshList>(_refreshJewels);
  }

  final int _limit = 10;
  int _currentPage = 1;

  final _fetchListJewelUC = getIt<FetchJewelUseCase>();

  void _fetchJewels(JewelFetchList event, Emitter<JewelState> emit) async {
    final result =
        await _fetchListJewelUC.call(FetchHomeBedParam(_currentPage, _limit));
    result.fold((l) {
      // add(SocketError(l.msg));
    }, (success) {
      final currentState = state;
      if (currentState is JewelStateLoaded && _currentPage != 1) {
        final list = currentState.jewels + success;
        emit(currentState.copyWith(jewels: list));
      } else {
        emit(JewelStateLoaded(
            jewels: success, isLoadMore: success.length >= _limit));
      }
      _currentPage++;
    });
  }

  void _refreshJewels(JewelRefreshList event, Emitter<JewelState> emit) {
    _currentPage = 1;
    add(const JewelFetchList());
  }
}
