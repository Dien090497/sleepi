import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
import 'package:slee_fi/resources/resources.dart';
import 'package:slee_fi/schema/add_jewel_schema/add_jewel_schema.dart';
import 'package:slee_fi/usecase/add_jewel_usecase.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/open_socket_usecase.dart';
import 'package:slee_fi/usecase/remove_jewel_usecase.dart';

class SocketBloc extends Bloc<SocketEvent, SocketState> {
  SocketBloc() : super(const SocketState.init()) {
    on<SocketInit>(_fetchSocket);
    on<OpenSocket>(_openSocket);
    on<AddJewel>(_addJewel);
    on<RemoveJewel>(_removeJewel);
    on<FetchJewels>(_fetchJewels);
    on<RefreshJewels>(_refreshJewels);
  }

  int bedId = -1;
  final int _limit = 10;
  int _currentPage = 1;

  final _detailBedUseCase = getIt<BedDetailUseCase>();
  final _addJewelUseCase = getIt<AddJewelUseCase>();
  final _removeUseCase = getIt<RemoveJewelUseCase>();
  final _openSocketUseCase = getIt<OpenSocketUseCase>();
  final _fetchListBedUC = getIt<FetchBedUseCase>();

  void _fetchSocket(SocketInit event, Emitter<SocketState> emit) async {
    var maxSocket = _maxSocketOpened(event.level);
    bedId = event.bedId;
    var result = await _detailBedUseCase.call(event.bedId);
    result.fold(
      (l) {
        print('run to fetch error   ${l.msg}');
        var list = List.generate(
            maxSocket,
            (index) => const SocketEntity(
                socketType: SocketType.block, id: -1, image: Ics.jewelWatting));
        emit(SocketState.loaded(
            socketEntity: list, maxSocket: maxSocket, socketOpened: 0));
      },
      (r) {
        final List<SocketEntity> list = [];

        // _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot1, list, 0);
        // _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot2, list, 1);
        // _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot3, list, 2);
        // _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot4, list, 3);
        // _checkSocket(maxSocket, r.socket ?? 0, r.jewelSlot5, list, 4);
        emit(SocketState.loaded(
            socketEntity: list,
            maxSocket: maxSocket,
            socketOpened: r.socket ?? 0));
      },
    );
  }

  void _openSocket(OpenSocket event, Emitter<SocketState> emit) async {
    print('run to open socket  $bedId  $state');
    var result = await _openSocketUseCase.call(bedId);
    result.fold((l) {
      print('error open socket  ${l.msg}');
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        var list = currentState.socketEntity;
        list[event.socketIndex]
            .copyWith(socketType: SocketType.empty, image: '');
        emit(currentState.copyWith(socketEntity: list));
      }
    }, (r) {
      print('success open socket   $r');

      final currentState = state;
      if (currentState is SocketStateLoaded) {
        final List<SocketEntity> list = List.from(currentState.socketEntity);

        var firstBlock = _firstSocket(list, SocketType.block);
        if (firstBlock == -1) {
          return;
        }
        list.removeAt(firstBlock);
        list.insert(
            firstBlock,
            const SocketEntity(
                socketType: SocketType.empty, id: -1, image: ''));
        emit(currentState.copyWith(
            socketEntity: list, socketOpened: currentState.socketOpened + 1));
      }
    });
  }

  void _addJewel(AddJewel event, Emitter<SocketState> emit) async {
    final currentState = state;
    var result = await _addJewelUseCase
        .call(AddJewelSchema(bedId, event.jewelEntity.id));
    result.fold((l) {
      print("on add jewel error  ${l.msg}");
    }, (r) {
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        var emptySocket =
            _firstSocket(currentState.socketEntity, SocketType.empty);
        if (emptySocket == -1) {
          return;
        }
        final List<SocketEntity> list = List.from(currentState.socketEntity);
        list.removeAt(emptySocket);
        list.insert(
            emptySocket,
            SocketEntity(
              socketType: SocketType.ready,
              id: event.jewelEntity.id,
              image: event.jewelEntity.image,
              jewelEntity: event.jewelEntity,
            ));
        emit(currentState.copyWith(socketEntity: list));
      }
      return;
    });
  }

  void _removeJewel(RemoveJewel event, Emitter<SocketState> emit) async {
    final currentState = state;
    if (currentState is SocketStateLoaded) {
      if (event.index >= currentState.socketEntity.length) {
        return;
      }

      print('remove jewel ');
      final List<SocketEntity> list = List.from(currentState.socketEntity);

      var result = await _removeUseCase
          .call(AddJewelSchema(bedId, list[event.index].id));
      result.fold((l) => null, (r) {
        list.removeAt(event.index);
        list.insert(
            event.index,
            const SocketEntity(
                socketType: SocketType.empty, id: -1, image: ''));
        list.sort((a, b) => a.socketType.index.compareTo(b.socketType.index));
        emit(currentState.copyWith(socketEntity: list));
      });
    }
  }

  FutureOr<void> _fetchJewels(
      FetchJewels event, Emitter<SocketState> emit) async {
    final result = await _fetchListBedUC.call(FetchBedParam(
        _currentPage, _limit, CategoryType.jewel, AttributeNFT.none));
    result.fold((l) {
      print('on error is   ${l.msg}');
    }, (success) {
      print('on success list ${success.length}');
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        var list = currentState.jewels ??
            <JewelEntity>[] + success.map((e) => e.toJewelEntity()).toList();
        emit(currentState.copyWith(
            jewels: list, loadMoreJewel: success.length >= _limit));
      }
      _currentPage++;
    });
  }

  FutureOr<void> _refreshJewels(
      RefreshJewels event, Emitter<SocketState> emit) {
    _currentPage = 1;
    add(const FetchJewels());
  }
}

int _maxSocketOpened(int level) {
  if (level > 25) return 5;
  if (level > 15) return 3;
  if (level > 10) return 2;
  if (level > 5) return 1;
  return 0;
}

int _firstSocket(List<SocketEntity> list, SocketType conditions) {
  for (int i = 0; i < list.length; i++) {
    if (list[i].socketType == conditions) {
      return i;
    }
  }

  return -1;
}

_checkSocket(int maxSocket, int socketOpened, int? id, List<SocketEntity> list,
    int index) {
  print(
      'run to add socket blocked    $maxSocket $socketOpened   $id    $index');

  if (id != null && index < socketOpened) {
    list.add(const SocketEntity(
        socketType: SocketType.ready, id: 0, image: Ics.jewel));
    return;
  }

  if (index >= socketOpened && index <= maxSocket) {
    print('run to add socket blocked ');
    list.add(const SocketEntity(
        socketType: SocketType.block, id: -1, image: Ics.jewelWatting));
    return;
  }

  if (id == null && index < socketOpened) {
    list.add(
        const SocketEntity(socketType: SocketType.empty, id: -1, image: ''));
    return;
  }
}
