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
    on<JewelFetchList>(_fetchJewels);
    on<InitEvent>(_onInitEvent);
    on<JewelRefreshList>(_refreshJewels);
    on<AddJewelToSocket>(_addJewelToSocket);
    on<ClearJewel>(_removeJewelFromSocket);
    on<UpgradeJewel>(_upgradeJewel);
    on<JewelLoading>(_loadingJewel);
  }

  CategoryType categoryType = CategoryType.jewel;

  FutureOr<void> _onInitEvent(InitEvent event, Emitter<JewelState> emit) {
    categoryType = event.categoryType;
    add(const JewelFetchList());
  }

  final int _limit = 10;
  int _currentPage = 1;

  final _fetchListJewelUC = getIt<FetchUpgradeListUseCase>();
  final _getInfoUpgrade = getIt<UpgradeInfoUseCase>();
  final _upgradeJewelUseCase = getIt<UpgradeUseCase>();

  void _fetchJewels(JewelFetchList event, Emitter<JewelState> emit) async {
    final result = await _fetchListJewelUC
        .call(FetchBedParam(_currentPage, _limit, categoryType));
    result.fold((l) {
      print('on error load list   ${l.msg}');
      emit(const JewelStateLoaded(
          jewels: [], isLoadMore: false, loading: false));
    }, (success) {
      print('load list success   ${success.length}');
      final currentState = state;
      final length = success.length;
      success.removeWhere((element) => element.isBurn !=0);
      if (currentState is JewelStateLoaded && _currentPage != 1) {
        final list = currentState.jewels + success;
        emit(currentState.copyWith(jewels: list, isLoadMore: length >= _limit));
      } else {
        emit(JewelStateLoaded(jewels: success, isLoadMore: length >= _limit));
      }

      _currentPage++;
    });
  }

  void _refreshJewels(JewelRefreshList event, Emitter<JewelState> emit) {
    _currentPage = 1;
    add(const JewelFetchList());
  }

  FutureOr<void> _addJewelToSocket(
      AddJewelToSocket event, Emitter<JewelState> emit) async {
    add(const JewelLoading(true));

    final result = await _getInfoUpgrade
        .call(UpgradeInfoParam(event.jewels.first.level, categoryType));
    result.fold((l) {
      print('errrpr is   ${l.msg}');
      final currentState = state;
      if (currentState is JewelStateLoaded && _currentPage != 1) {
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
        emit(currentState.copyWith(errorMessage: l.msg, loading: false));
      }
    }, (r) {
      final List<BedEntity> temp = List.from(currentState.jewels);
      for (var element in currentState.jewelsUpgrade) {
        temp.remove(element);
      }
      temp.add(r);
      emit(currentState.copyWith(
        loading: false,
        upgradeInfoResponse: null,
        upgradeSuccess: r,
        jewelsUpgrade: [],
        jewels: temp,
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
}
