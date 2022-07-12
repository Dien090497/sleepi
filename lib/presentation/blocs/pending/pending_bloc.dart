import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';
import 'package:slee_fi/usecase/withdraw_history_usecase.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc()
      : super(const PendingState.loaded(PendingStatus.initial, [], false)) {
    on<PendingFetched>(_fetch);
    on<PendingRefresh>(_refresh);
    on<PendingInit>(_onInit);
  }

  final _fetchPendingUC = getIt<WithdrawHistoryUseCase>();

  int _currentPage = 1;
  late AttributeWithdraw attributeWithdraw;
  late int userId;

  final _limit = 10;

  bool _loading = false;

  _onInit(PendingInit event, Emitter<PendingState> emit) {
    userId = event.userId;
    attributeWithdraw = event.attributeWithdraw;
    add(PendingFetched());
  }

  _refresh(PendingRefresh event, Emitter<PendingState> emit) {
    emit(state.copyWith(
        status: PendingStatus.initial, list: [], hasReachedMax: false));
    _currentPage = 1;
    add(PendingFetched());
  }

  _fetch(PendingFetched event, Emitter<PendingState> emit) async {
    if (state.hasReachedMax ||
        state.status == PendingStatus.failure ||
        _loading) return;

    if (state.status == PendingStatus.initial ||
        state.status == PendingStatus.success) {
      _loading = true;
      final result = await _fetchPendingUC.call(WithdrawParam(
        attributeWithdraw: attributeWithdraw,
        page: _currentPage,
        limit: _limit,
      ));
      result.fold(
        (l) {
          emit(state.copyWith(status: PendingStatus.failure));
          _loading = false;
        },
        (r) {
          _currentPage++;
          var newList = r.data.map((e) => e.toEntity()).toList();
          emit(state.copyWith(
              status: PendingStatus.success,
              list: state.list + newList,
              hasReachedMax: newList.isEmpty || r.data.length < _limit));
          _loading = false;
        },
      );
    }
  }
}
