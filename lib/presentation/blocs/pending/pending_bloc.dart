import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/const/const.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';
import 'package:slee_fi/usecase/get_current_network_usecase.dart';
import 'package:slee_fi/usecase/withdraw_history_usecase.dart';
import 'package:url_launcher/url_launcher.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc()
      : super(const PendingState.loaded(PendingStatus.initial, [], false)) {
    on<PendingFetched>(_fetch);
    on<PendingRefresh>(_refresh);
    on<PendingInit>(_onInit);
    on<OpenDetailTransaction>(_openTransaction);
  }

  final _getCurrentNetworkUseCase = getIt<GetCurrentNetworkUseCase>();
  final _fetchPendingUC = getIt<WithdrawHistoryUseCase>();

  int _currentPage = 1;
  late AttributeWithdraw attributeWithdraw;
  late int userId;
  final _limit = 10;
  bool _loading = false;
  late final String explorers;

  _onInit(PendingInit event, Emitter<PendingState> emit) async {
    userId = event.userId;
    attributeWithdraw = event.attributeWithdraw;
    add(PendingRefresh());
    var networkUc = await _getCurrentNetworkUseCase.call(null);
    networkUc.fold((l) => explorers = Const.avascanUrl, (r) {
      explorers = r.explorers.first.url;
    });
  }

  _refresh(PendingRefresh event, Emitter<PendingState> emit) {
    emit(state.copyWith(
        status: PendingStatus.initial, list: [], hasReachedMax: false));
    _currentPage = 1;
    add(const PendingFetched());
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
          final newList = r.data.map((e) => e.toEntity()).toList();
          emit(state.copyWith(
              status: PendingStatus.success,
              list: state.list + newList,
              hasReachedMax: newList.isEmpty || r.data.length < _limit));
          _loading = false;
        },
      );
    }
  }

  FutureOr<void> _openTransaction(
      OpenDetailTransaction event, Emitter<PendingState> emit) async {
    final url = Uri.parse('$explorers/tx/${event.txHash}');
    if (await canLaunchUrl(url)) {
      launchUrl(url);
    }
  }
}
