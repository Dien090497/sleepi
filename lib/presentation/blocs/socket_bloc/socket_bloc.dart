import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(const SocketState.init()) {
    on<SocketInt>(_fetchSocket);
  }

  final _detailBedUseCase = getIt<BedDetailUseCase>();

  void _fetchSocket(SocketInt event, Emitter<SocketState> emit) async {
    var result = await _detailBedUseCase.call(event.bedId);
    result.fold(
        (l) => null, (r) => emit(SocketState.loaded(r.toSocketEntity())));
  }
}
