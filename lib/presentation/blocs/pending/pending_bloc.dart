import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_event.dart';
import 'package:slee_fi/presentation/blocs/pending/pending_state.dart';

class PendingBloc extends Bloc<PendingEvent, PendingState> {
  PendingBloc()
      : super(const PendingState.loaded(PendingStatus.initial, [], false)) {
    on<PendingFetched>(_fetch);
  }

  _fetch(PendingFetched event, Emitter<PendingState> emit) async {
    if (state.hasReachedMax) return;

    if (state.status == PendingStatus.initial) {
      final posts = await _fetchPosts();
      return emit(state.copyWith(
        status: PendingStatus.success,
        list: posts,
        hasReachedMax: false,
      ));
    }
  }

  _fetchPosts() {}
}
