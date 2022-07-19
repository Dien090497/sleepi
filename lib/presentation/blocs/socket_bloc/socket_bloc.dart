import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/entities/socket_entity/socket_entity.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_event.dart';
import 'package:slee_fi/presentation/blocs/socket_bloc/socket_state.dart';
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
    on<SocketError>(_onError);
    on<StartLoading>(_startLoading);
    on<StopLoading>(_stopLoading);
    on<RefreshSocket>(_refreshSocket);
    on<LevelUp>(_onLevelUp);
  }

  int bedId = -1;
  int levelBed = -1;
  final int _limit = 10;
  int _currentPage = 1;

  final _detailBedUseCase = getIt<BedDetailUseCase>();
  final _addJewelUseCase = getIt<AddJewelUseCase>();
  final _removeUseCase = getIt<RemoveJewelUseCase>();
  final _openSocketUseCase = getIt<OpenSocketUseCase>();
  final _fetchListBedUC = getIt<FetchBedUseCase>();

  void _fetchSocket(SocketInit event, Emitter<SocketState> emit) async {
    if (state is SocketStateLoaded) {
      return;
    }
    final maxSocket = _maxSocketOpened(event.level);
    bedId = event.bedId;
    levelBed = event.level;
    _currentPage = 1;
    final result =
        await _detailBedUseCase.call(BedDetailParams(bedId: event.bedId));
    result.fold(
      (l) {
        final list = List.generate(
            maxSocket,
            (index) => const SocketEntity(
                socketType: SocketType.block, jewelEntity: null));
        emit(SocketState.loaded(
            socketEntity: list, maxSocket: maxSocket, socketOpened: 0));
      },
      (r) {
        final List<SocketEntity> list = [];
        for (int i = 0; i <= maxSocket; i++) {
          if (i < r.jewels.length) {
            list.add(SocketEntity(
                socketType: SocketType.ready, jewelEntity: r.jewels[i]));
          } else if (i >= r.jewels.length && i < (r.socket ?? 0)) {
            list.add(const SocketEntity(socketType: SocketType.empty));
          } else if (i > (r.socket ?? 0) && i <= maxSocket) {
            list.add(const SocketEntity(socketType: SocketType.block));
          }
        }
        emit(SocketState.loaded(
            socketEntity: list,
            maxSocket: maxSocket,
            socketOpened: r.socket ?? 0));
      },
    );
  }

  void _openSocket(OpenSocket event, Emitter<SocketState> emit) async {
    add(const StartLoading());
    final result = await _openSocketUseCase.call(bedId);
    add(const StopLoading());
    result.fold((l) {
      add(SocketError(l.msg));
    }, (r) {
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        final List<SocketEntity> list = List.from(currentState.socketEntity);

        final firstBlock = _firstSocket(list, SocketType.block);
        if (firstBlock == -1) {
          return;
        }
        list.removeAt(firstBlock);
        list.insert(
            firstBlock, const SocketEntity(socketType: SocketType.empty));
        emit(currentState.copyWith(
            socketEntity: list, socketOpened: currentState.socketOpened + 1));
      }
    });
  }

  void _addJewel(AddJewel event, Emitter<SocketState> emit) async {
    add(const StartLoading());
    final result = await _addJewelUseCase
        .call(AddJewelSchema(bedId, event.jewelEntity.id));
    add(const StopLoading());
    result.fold((l) {
      add(SocketError(l.msg));
    }, (r) {
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        final emptySocket =
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
              jewelEntity: event.jewelEntity,
            ));
        List<JewelEntity> jewelTemp = [];
        if (currentState.jewels != null) {
          jewelTemp.addAll(List.from(currentState.jewels!));
          jewelTemp
              .removeWhere((element) => element.id == event.jewelEntity.id);
        }
        emit(currentState.copyWith(socketEntity: list, jewels: jewelTemp));
      }
      return;
    });
  }

  void _removeJewel(RemoveJewel event, Emitter<SocketState> emit) async {
    final currentState = state;
    if (currentState is SocketStateLoaded) {
      if (event.index >= currentState.socketEntity.length ||
          currentState.socketEntity[event.index].jewelEntity == null) {
        return;
      }

      final List<SocketEntity> list = List.from(currentState.socketEntity);
      add(const StartLoading());
      final result = await _removeUseCase
          .call(AddJewelSchema(bedId, list[event.index].jewelEntity!.id));
      add(const StopLoading());
      result.fold((l) => add(SocketError(l.msg)), (r) {
        final socketEntity = list.removeAt(event.index);
        list.insert(
            event.index, const SocketEntity(socketType: SocketType.empty));
        list.sort((a, b) => a.socketType.index.compareTo(b.socketType.index));
        List<JewelEntity> jewelTemp = [];
        if (currentState.jewels != null && socketEntity.jewelEntity != null) {
          jewelTemp.addAll(List.from(currentState.jewels!));
          jewelTemp.add(socketEntity.jewelEntity!);
        }

        emit(currentState.copyWith(socketEntity: list, jewels: jewelTemp));
      });
    }
  }

  FutureOr<void> _fetchJewels(
      FetchJewels event, Emitter<SocketState> emit) async {
    final result = await _fetchListBedUC.call(FetchBedParam(
        _currentPage, _limit, CategoryType.jewel, AttributeNFT.none));
    result.fold((l) {
      add(SocketError(l.msg));
    }, (success) {
      final currentState = state;
      if (currentState is SocketStateLoaded) {
        final list = currentState.jewels ??
            <JewelEntity>[] + success.map((e) => e.toJewelEntity()).toList();
        emit(currentState.copyWith(
            errorMessage: null,
            jewels: list,
            loadMoreJewel: success.length >= _limit));
      }
      _currentPage++;
    });
  }

  FutureOr<void> _refreshJewels(
      RefreshJewels event, Emitter<SocketState> emit) {
    _currentPage = 1;
    add(const FetchJewels());
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

  void _onError(SocketError event, Emitter<SocketState> emit) {
    final currentState = state;
    if (currentState is SocketStateLoaded) {
      emit(currentState.copyWith(errorMessage: event.message));
    }
  }

  FutureOr<void> _startLoading(StartLoading event, Emitter<SocketState> emit) {
    final currentState = state;
    if (currentState is SocketStateLoaded) {
      emit(currentState.copyWith(isLoading: true, errorMessage: ''));
    }
  }

  FutureOr<void> _stopLoading(StopLoading event, Emitter<SocketState> emit) {
    final currentState = state;
    if (currentState is SocketStateLoaded) {
      emit(currentState.copyWith(isLoading: false));
    }
  }

  FutureOr<void> _refreshSocket(
      RefreshSocket event, Emitter<SocketState> emit) {
    emit(const SocketState.init());
    add(SocketInit(bedId, levelBed));
  }

  FutureOr<void> _onLevelUp(LevelUp event, Emitter<SocketState> emit) {}
}
