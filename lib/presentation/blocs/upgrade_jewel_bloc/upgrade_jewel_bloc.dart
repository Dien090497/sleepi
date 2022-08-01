import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_upgrade_list.dart';
import 'package:slee_fi/usecase/upgrade_info_usecase.dart';
import 'package:slee_fi/usecase/upgrade_jewel_usecase.dart';

import 'upgrade_jewel_event.dart';

class JewelBloc extends Bloc<JewelEvent, JewelState> {
  JewelBloc() : super(const JewelState.init()) {
    on<JewelFetchListAvailable>(_fetchAvailableJewels);
    on<InitEvent>(_onInitEvent);
    on<JewelRefreshList>(_refreshJewels);
    on<AddJewelToSocket>(_addJewelToSocket);
    on<ClearJewel>(_removeJewelFromSocket);
    on<UpgradeJewel>(_upgradeJewel);
    on<JewelLoading>(_loadingJewel);
    on<JewelFetchAllList>(_fetchAllJewels);
    on<JewelRefreshListAvailable>(_onRefreshAvailableJewels);
    on<ClearJewelSuccess>(_clearJewelUpgraded);
  }

  CategoryType categoryType = CategoryType.jewel;

  FutureOr<void> _onInitEvent(InitEvent event, Emitter<JewelState> emit) {
    categoryType = event.categoryType;
    add(const JewelFetchAllList());
  }

  final int _limit = 10;
  final int _limitAvailable = 50;
  int _currentPage = 1;
  int _currentPageAvailable = 1;

  bool _isLoading = false;

  final _fetchListJewelUC = getIt<FetchUpgradeListUseCase>();
  final _getInfoUpgrade = getIt<UpgradeInfoUseCase>();
  final _upgradeJewelUseCase = getIt<UpgradeUseCase>();
  final _fetchBedUseCase = getIt<FetchBedUseCase>();

  void _fetchAvailableJewels(
      JewelFetchListAvailable event, Emitter<JewelState> emit) async {
    if (_isLoading) return;
    _isLoading = true;
    final result = await _fetchListJewelUC.call(
        FetchBedParam(_currentPageAvailable, _limitAvailable, categoryType));
    _isLoading = false;
    result.fold((l) {
      emit(const JewelStateLoaded(
        jewels: [],
        isLoadMore: false,
        loading: false,
      ));
    }, (success) {
      final currentState = state;
      final length = success.length;
      success
          .removeWhere((element) => element.isBurn != 0 || element.level >= 5);
      if (currentState is JewelStateLoaded) {
        final list = currentState.jewelsAvailable + success;

        emit(currentState.copyWith(
            jewelsAvailable: list,
            isLoadMoreAvailable: length >= _limitAvailable));
      } else {
        emit(JewelStateLoaded(
            jewelsAvailable: success,
            isLoadMoreAvailable: length >= _limitAvailable));
      }

      _currentPageAvailable++;
    });
  }

  void _refreshJewels(JewelRefreshList event, Emitter<JewelState> emit) {
    _currentPage = 1;
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      emit(currentState.copyWith(isLoadMore: false, loading: true, jewels: []));
    }
    add(const JewelFetchAllList());
  }

  FutureOr<void> _addJewelToSocket(
      AddJewelToSocket event, Emitter<JewelState> emit) async {
    add(const JewelLoading(true));

    final result = await _getInfoUpgrade
        .call(UpgradeInfoParam(event.jewels.first.level, categoryType));
    result.fold((l) {
      final currentState = state;
      if (currentState is JewelStateLoaded) {
        emit(currentState.copyWith(errorMessage: l.msg, loading: false));
      }
    }, (r) {
      final currentState = state;
      if (currentState is JewelStateLoaded) {
        emit(currentState.copyWith(
          upgradeInfoResponse: r,
          jewelsUpgrade: event.jewels,
          loading: false,
        ));
      }
      add(const JewelLoading(false));
    });
  }

  FutureOr<void> _removeJewelFromSocket(
      ClearJewel event, Emitter<JewelState> emit) {
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      emit(currentState.copyWith(
        upgradeInfoResponse: null,
        jewelsUpgrade: [],
        errorMessage: null,
      ));
    }
  }

  void _upgradeJewel(UpgradeJewel event, Emitter<JewelState> emit) async {
    final currentState = state;
    if (currentState is! JewelStateLoaded) {
      return;
    }

    add(const JewelLoading(true));

    final result = await _upgradeJewelUseCase.call(UpgradeSchema(
      currentState.jewelsUpgrade.map((e) => e.nftId.toString()).toList(),
      categoryType,
    ));
    result.fold((l) {
      final currentState = state;
      if (currentState is JewelStateLoaded && _currentPage != 1) {
        emit(currentState.copyWith(
          errorMessage: l.msg,
          loading: false,
          jewelsUpgrade: [],
        ));
      }
    }, (r) {
      final entity = r.nftAttribute?.toEntity();

      final List<BedEntity> temp = List.from(currentState.jewelsAvailable);
      for (var element in currentState.jewelsUpgrade) {
        temp.remove(element);
      }
      if (r.status && entity != null) {
        temp.add(entity);
      }
      emit(currentState.copyWith(
        loading: false,
        upgradeInfoResponse: null,
        upgradeSuccess: r,
        jewelsUpgrade: [],
        jewels: currentState.jewels + (entity != null ? [entity] : []),
        jewelsAvailable: temp,
      ));
    });
  }

  FutureOr<void> _loadingJewel(JewelLoading event, Emitter<JewelState> emit) {
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      emit(currentState.copyWith(
        loading: event.isLoading,
        errorMessage: null,
        upgradeSuccess: null,
      ));
    }
  }

  Future<void> _fetchAllJewels(
      JewelFetchAllList event, Emitter<JewelState> emit) async {
    final result = await _fetchBedUseCase
        .call(FetchBedParam(_currentPage, _limit, categoryType));
    result.fold((l) {
      emit(const JewelStateLoaded(
          jewels: [], isLoadMore: false, loading: false));
    }, (listJewelsEntity) {
      final currentState = state;
      final length = listJewelsEntity.length;
      listJewelsEntity.removeWhere((element) => element.isBurn != 0);
      if (currentState is JewelStateLoaded) {
        final list = currentState.jewels + listJewelsEntity;
        emit(currentState.copyWith(
          jewels: list,
          loading: false,
          isLoadMore: length >= _limit,
        ));
      } else {
        emit(JewelStateLoaded(
            jewels: listJewelsEntity,
            loading: false,
            isLoadMore: length >= _limit));
      }
      _currentPage++;
    });
  }

  FutureOr<void> _onRefreshAvailableJewels(
      JewelRefreshListAvailable event, Emitter<JewelState> emit) {
    _currentPageAvailable = 1;
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      emit(currentState
          .copyWith(isLoadMoreAvailable: true, jewelsAvailable: []));
    }
    add(const JewelFetchListAvailable());
  }

  FutureOr<void> _clearJewelUpgraded(
      ClearJewelSuccess event, Emitter<JewelState> emit) {
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      emit(currentState.copyWith(upgradeSuccess: null, errorMessage: ''));
    }
  }
}
