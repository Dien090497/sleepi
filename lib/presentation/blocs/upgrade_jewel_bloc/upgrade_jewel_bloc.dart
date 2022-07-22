import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';
import 'package:slee_fi/presentation/blocs/upgrade_jewel_bloc/upgrade_jewel_state.dart';
import 'package:slee_fi/schema/upgrade_jewel_schame/upgrade_jewel_schema.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_jewel_usecase.dart';
import 'package:slee_fi/usecase/upgrade_info_usecase.dart';
import 'package:slee_fi/usecase/upgrade_jewel_usecase.dart';

import 'upgrade_jewel_event.dart';

class JewelBloc extends Bloc<JewelEvent, JewelState> {
  JewelBloc() : super(const JewelState.init()) {
    on<JewelFetchList>(_fetchJewels);
    on<JewelRefreshList>(_refreshJewels);
    on<AddJewelToSocket>(_addJewelToSocket);
    on<ClearJewel>(_removeJewelFromSocket);
    on<UpgradeJewel>(_upgradeJewel);
    on<JewelLoading>(_loadingJewel);
  }

  final int _limit = 10;
  int _currentPage = 1;

  final _fetchListJewelUC = getIt<FetchJewelUseCase>();
  final _getInfoUpgrade = getIt<UpgradeInfoUseCase>();
  final _upgradeJewelUseCase = getIt<UpgradeUseCase>();

  void _fetchJewels(JewelFetchList event, Emitter<JewelState> emit) async {
    final result =
        await _fetchListJewelUC.call(FetchHomeBedParam(_currentPage, _limit));
    result.fold((l) {
      emit(const JewelStateLoaded(
          jewels: [], isLoadMore: false, loading: false));
    }, (success) {
      final currentState = state;
      if (currentState is JewelStateLoaded && _currentPage != 1) {
        final list = currentState.jewels + success;
        emit(currentState.copyWith(jewels: list));
      } else {
        emit(JewelStateLoaded(
            jewels: success, isLoadMore: success.length >= _limit));
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
        .call(UpgradeInfoParam(event.jewels.first.level, CategoryType.jewel));
    result.fold((l) {
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
    print('remove jewel ');
    final currentState = state;
    if (currentState is JewelStateLoaded) {
      print('remove jewel 222');
      emit(currentState.copyWith(upgradeInfoResponse: null, jewelsUpgrade: []));
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
      CategoryType.jewel,
    ));
    result.fold((l) {
      print('upgrade Jewel errprr  ${l.msg}');
      final currentState = state;
      if (currentState is JewelStateLoaded && _currentPage != 1) {
        emit(currentState.copyWith(errorMessage: l.msg, loading: false));
      }
    }, (r) {
      print('upgrade Jewel success  $r');
      final List<JewelEntity> temp = List.from(currentState.jewels);
      for (var element in currentState.jewelsUpgrade) {
        temp.remove(element);
      }
      temp.add(r);
      emit(currentState.copyWith(
        loading: false,
        upgradeInfoResponse: null,
        upgradeSuccess: true,
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
        upgradeSuccess: false,
      ));
    }
  }
}
