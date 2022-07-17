import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(const SocketState.init()) {
    on<SocketInt>(_fetchSocket);
    on<OpenSocket>(_openSocket);
    on<SpeedUpSocket>(_speedUpSocket);
    on<AddJewel>(_addJewel);
    on<RemoveJewel>(_removeJewel);
  }

  final _detailBedUseCase = getIt<BedDetailUseCase>();

  void _fetchSocket(SocketInt event, Emitter<SocketState> emit) async {
    var maxSocket = _maxSocketOpened(event.level);
    var result = await _detailBedUseCase.call(event.bedId);
    result.fold(
      (l) {
        emit(SocketState.loaded([], maxSocket, 0));
      },
      (r) {
        final List<SocketEntity> list = [];
        _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot1, list, 0);
        _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot2, list, 1);
        _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot3, list, 2);
        _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot4, list, 3);
        _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot5, list, 4);
        emit(SocketState.loaded(list, maxSocket, r.socket ?? 0));
      },
    );
  }

  _checkSocket(int maxSocket, int socketOpened, int? id,
      List<SocketEntity> list, int index) {
    if (id != null && index < socketOpened) {
      list.add(const SocketEntity(
          socketType: SocketType.ready, id: 0, image: Ics.jewel));
      return;
    }
    if (index >= socketOpened && index <= maxSocket) {
      list.add(const SocketEntity(
          socketType: SocketType.block, id: 0, image: Ics.jewelWatting));
      return;
    }

    if (id == null && index < socketOpened) {
      list.add(const SocketEntity(
          socketType: SocketType.empty, id: 0, image: Ics.emptyBox));
      return;
    }
  }

  int _maxSocketOpened(int level) {
    if (level > 25) return 5;
    if (level > 15) return 3;
    if (level > 10) return 2;
    if (level > 5) return 1;
    return 0;
  }

  void _openSocket(OpenSocket event, Emitter<SocketState> emit) {}

  void _speedUpSocket(SpeedUpSocket event, Emitter<SocketState> emit) {}

  void _addJewel(AddJewel event, Emitter<SocketState> emit) {}

  void _removeJewel(RemoveJewel event, Emitter<SocketState> emit) {}
}
