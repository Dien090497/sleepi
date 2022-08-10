import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/models/estimate_sleep_response/estimate_sleep_response.dart';
import 'package:slee_fi/models/user_status_tracking_model/user_status_tracking_model.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/usecase/bed_detail_usecase.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/get_user_status_tracking_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

import '../../../common/const/const.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchBed>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
    on<LoadMoreBed>(_onLoadMoreBed);
    on<ChangeInsurance>(_changeInsurance);
    on<ChangeStatusAlarm>(_changeStatusAlarm);
    on<FetchBedDetail>(_fetchBedDetail);
  }

  final _fetchListBedUC = getIt<FetchHomeBedUseCase>();
  final _estimateTrackingUC = getIt<EstimateTrackingUseCase>();
  final _userStatusTrackingUC = getIt<GetUserStatusTrackingUseCase>();
  final _bedDetailUC = getIt<BedDetailUseCase>();

  int _currentPageBed = 1;
  final _limitItemPage = 10;
  late int selectedH;
  late int selectedM;

  void _fetchBed(FetchBed fetchData, Emitter<HomeState> emit) async {
    final result = await _fetchListBedUC
        .call(FetchHomeBedParam(_currentPageBed, _limitItemPage));
    await result.fold(
      (l) async {
        final now = DateTime.now();
        selectedH = now.hour;
        selectedH = now.minute;
        emit(HomeState.loaded(
          bedList: [],
          selectedBed: null,
          loadMoreBed: false,
          startTracking: false,
          loading: false,
          userStatusTracking: await _getStatusTracking(),
        ));
      },
      (r) async {
        _currentPageBed++;
        final bed = r.isNotEmpty ? r.first : null;
        final now = DateTime.now();
        selectedH = now.hour;
        selectedH = now.minute;

        emit(HomeState.loaded(
          errorMessage: '',
          loading: false,
          bedList: r,
          selectedBed: bed,
          loadMoreBed: r.length >= _limitItemPage,
          tokenEarn:
              bed != null ? await _estimateTracking(r.first, true, null) : null,
          userStatusTracking: await _getStatusTracking(),
        ));
      },
    );
  }

  void _onLoadMoreBed(LoadMoreBed event, Emitter<HomeState> emit) async {
    final result = await _fetchListBedUC
        .call(FetchHomeBedParam(_currentPageBed, _limitItemPage));
    result.fold((l) {
      final currentState = state;
      if (currentState is HomeLoaded) {
        emit(currentState.copyWith(
          loadMoreBed: false,
          selectedBed: currentState.bedList.first,
        ));
      }
    }, (r) {
      _currentPageBed++;
      final currentState = state;
      if (currentState is HomeLoaded) {
        if (r.isEmpty) {
          emit(currentState.copyWith(
            loadMoreBed: false,
            selectedBed: currentState.bedList.first,
          ));
          return;
        }

        final newList = currentState.bedList + r;
        emit(
            currentState.copyWith(bedList: newList, loadMoreBed: r.isNotEmpty));
      }
    });
  }

  void _onRefresh(RefreshBed event, Emitter<HomeState> emit) async {
    _currentPageBed = 1;
    final currentState = state;
    if (currentState is HomeLoaded) {
      if (currentState.loading) return;
      emit(currentState.copyWith(loading: true));
    }
    final result = await _fetchListBedUC
        .call(FetchHomeBedParam(_currentPageBed, _limitItemPage));
    await result.fold(
      (l) async {
        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(loading: false, errorMessage: ''));
        } else {
          emit(const HomeState.loaded(bedList: [], selectedBed: null));
        }
      },
      (r) async {
        _currentPageBed++;
        EstimateSleepResponse? amount;
        if (currentState is HomeLoaded) {
          if (r.isNotEmpty) {
            amount = await _estimateTracking(
              r.first,
              currentState.enableInsurance,
              currentState.selectedItem,
            );
          }

          emit(currentState.copyWith(
            loading: false,
            errorMessage: '',
            bedList: r,
            selectedBed: r.isNotEmpty ? r.first : null,
            loadMoreBed: r.length >= _limitItemPage,
            tokenEarn: r.isNotEmpty ? amount : null,
            userStatusTracking: await _getStatusTracking(),
          ));
        } else {
          final bed = r.isNotEmpty ? r.first : null;
          final now = DateTime.now();
          selectedH = now.hour;
          selectedH = now.minute;
          emit(HomeState.loaded(
            errorMessage: '',
            loading: false,
            bedList: r,
            selectedBed: bed,
            loadMoreBed: r.length >= _limitItemPage,
            tokenEarn: bed != null
                ? await _estimateTracking(r.first, true, null)
                : null,
            userStatusTracking: await _getStatusTracking(),
          ));
        }
      },
    );
  }

  void _changeBed(ChangeBed event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final bed = event.bed;
      emit(currentState.copyWith(
        selectedBed: bed,
        errorMessage: '',
        tokenEarn: await _estimateTracking(
          currentState.selectedBed!,
          currentState.enableInsurance,
          currentState.selectedItem,
        ),
      ));
    }
  }

  void _addItemToBed(AddItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is! HomeLoaded || currentState.selectedBed == null) {
      return;
    }
    final tokenEarn = await _estimateTracking(
      currentState.selectedBed!,
      true,
      currentState.selectedItem,
    );
    emit(currentState.copyWith(
      selectedItem: event.item,
      tokenEarn: tokenEarn,
    ));
  }

  void _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedItem != null) {
      emit(currentState.copyWith(
        selectedItem: null,
        errorType: ErrorType.none,
        tokenEarn: await _estimateTracking(
          currentState.selectedBed!,
          true,
          currentState.selectedItem,
        ),
      ));
    }
  }

  Future<EstimateSleepResponse> _estimateTracking(
      BedEntity bed, bool insuranceEnabled, BedEntity? itemEntity) async {
    final result = await _estimateTrackingUC.call(EstimateTrackingParam(
        bedId: bed.id,
        itemId: itemEntity?.id,
        isEnableInsurance: insuranceEnabled));
    return result.foldRight(
        EstimateSleepResponse(0, Const.tokenEarnMaxPerDay), (r, previous) => r);
  }

  void _changeInsurance(ChangeInsurance event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      emit(currentState.copyWith(enableInsurance: event.enableInsurance));
    }
  }

  void _changeStatusAlarm(
      ChangeStatusAlarm event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      emit(currentState.copyWith(enableAlarm: event.enableAlarm));
    }
  }

  Future<UserStatusTrackingModel?> _getStatusTracking() async {
    final res = await _userStatusTrackingUC.call(NoParams());
    return res.foldRight(null, (r, previous) => r);
  }

  FutureOr<void> _fetchBedDetail(
      FetchBedDetail event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedBed != null) {
      final result = await _bedDetailUC
          .call(BedDetailParams(bedId: currentState.selectedBed!.nftId));
      await result.fold(
        (l) async {},
        (r) async {
          final List<BedEntity> tempList = List.from(currentState.bedList);

          if (r.levelUpTime != null || r.remainTime != null) {
            tempList.removeWhere((element) => element.id == r.id);
            emit(currentState.copyWith(
              bedList: tempList,
              selectedBed: tempList.isEmpty ? null : tempList.first,
              tokenEarn: await _estimateTracking(
                r,
                currentState.enableInsurance,
                currentState.selectedItem,
              ),
              userStatusTracking: await _getStatusTracking(),
            ));
          }

          var index = tempList.indexWhere((element) => element.id == r.id);
          if (index == -1) {
            return;
          }

          tempList.removeAt(index);
          tempList.insert(index, r);

          emit(currentState.copyWith(
            selectedBed: r,
            bedList: tempList,
            tokenEarn: await _estimateTracking(
              r,
              currentState.enableInsurance,
              currentState.selectedItem,
            ),
            userStatusTracking: await _getStatusTracking(),
          ));
        },
      );
    }
  }
}
