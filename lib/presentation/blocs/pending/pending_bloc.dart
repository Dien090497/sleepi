import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';
import 'package:slee_fi/usecase/spending_load_pending_usecase.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc()
      : super(const PendingState.loaded(PendingStatus.initial, [], false)) {
    on<PendingFetched>(_fetch);

    on<PendingInit>(_onInit);
  }

  int _currentPage = 0;

  late int userId;

  _onInit(PendingInit event, Emitter<PendingState> emit) {
    'on init spending list '.log;

    userId = event.userId;
    add(PendingFetched());
  }

  final _fetchPendingUC = getIt<SpendingLoadPendingUseCase>();

  _fetch(PendingFetched event, Emitter<PendingState> emit) async {
    if (state.hasReachedMax ||
        state.status == PendingStatus.loading ||
        state.status == PendingStatus.failure) return;

    if (state.status == PendingStatus.initial ||
        state.status == PendingStatus.success) {
      emit(state.copyWith(status: PendingStatus.loading));
      final result =
          await _fetchPendingUC.call(LoadMoreParams(userId, _currentPage, 10));
      result.fold(
        (l) => emit(state.copyWith(status: PendingStatus.failure)),
        (r) {
          _currentPage++;
          emit(state.copyWith(
              status: PendingStatus.success, hasReachedMax: true));
        },
      );
    }
  }
}
