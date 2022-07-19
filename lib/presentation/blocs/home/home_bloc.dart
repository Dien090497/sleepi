import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/schema/start_tracking/start_tracking_schema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';
import 'package:slee_fi/usecase/fetch_home_bed_usecase.dart';
import 'package:slee_fi/usecase/get_user_status_tracking_usecase.dart';
import 'package:slee_fi/usecase/remove_item_from_bed_usecase.dart';
import 'package:slee_fi/usecase/start_sleep_tracking_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchBed>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
    on<LoadMoreBed>(_onLoadMoreBed);
    on<EstimateTracking>(_estimateTracking);
    on<UserStatusTracking>(_userStatusTracking);
    on<StartTracking>(_startTracking);
    on<ChangeInsurance>(_changeInsurance);
    on<ChangeStatusAlarm>(_changeStatusAlarm);
    on<ChangeHour>(_changeHour);
    on<ChangeMinute>(_changeMinute);
  }

  final _fetchListBedUC = getIt<FetchHomeBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemFromBedUC = getIt<RemoveItemFromBedUseCase>();
  final _estimateTrackingUC = getIt<EstimateTrackingUseCase>();
  final _userStatusTrackingUC = getIt<GetUserStatusTrackingUseCase>();
  final _startSleepTrackingUC = getIt<StartSleepTrackingUseCase>();

  int currentBedId = -1;
  int _currentPageBed = 1;
  final _limitItemPage = 10;

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

  void _onRefresh(RefreshBed event, Emitter<HomeState> emit) {
    _currentPageBed = 1;
    emit(const HomeState.loading());
    add(const FetchBed());
  }

  void _changeBed(ChangeBed event, Emitter<HomeState> emit) {
    final currentState = state;
    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(selectedBed: event.bed));
    }
    add(EstimateTracking());
  }

  void _fetchBed(FetchBed fetchData, Emitter<HomeState> emit) async {
    final result = await _fetchListBedUC
        .call(FetchHomeBedParam(_currentPageBed, _limitItemPage));
    result.fold(
      (l) {
        emit(HomeState.loaded(
            bedList: [],
            selectedBed: null,
            loadMoreBed: false,
            errorMessage: '',
            startTracking: false,
            minute: DateTime.now().minute,
            hour: DateTime.now().hour,
            time: 0));
      },
      (r) {
        _currentPageBed++;
        final currentState = state;
        if (r.isNotEmpty) {
          currentBedId = r.first.id;
        }

        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(
              bedList: r,
              selectedBed: r.first,
              loadMoreBed: r.length >= _limitItemPage,
              selectedItem: null));
          add(UserStatusTracking());
          return;
        }
        emit(HomeState.loaded(
            errorMessage: '',
            loading: false,
            bedList: r,
            selectedBed: r.isNotEmpty ? r.first : null,
            loadMoreBed: r.length >= _limitItemPage,
            minute: DateTime.now().minute,
            hour: DateTime.now().hour,
            time: 0));
        add(UserStatusTracking());
      },
    );
  }

  void _addItemToBed(AddItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      final result = await _addItemToBedUC
          .call(AddItemToBedParam(currentBedId, event.item.id));
      result.fold((l) {
        emit(currentState.copyWith(
          errorMessage: l.msg,
          errorType: ErrorType.addItemToBed,
        ));
      }, (r) {
        add(EstimateTracking());
        emit(currentState.copyWith(selectedItem: event.item));
      });
    }
  }

  void _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedItem != null) {
      final result = await _removeItemFromBedUC
          .call(AddItemToBedParam(currentBedId, currentState.selectedItem!.id));
      result.fold((l) {
        emit(currentState.copyWith(
          errorMessage: l.msg,
          errorType: ErrorType.removeItemFromBed,
        ));
      }, (r) {
        add(EstimateTracking());
        emit(currentState.copyWith(
          selectedItem: null,
          errorType: ErrorType.none,
        ));
      });
    }
  }

  void _estimateTracking(
      EstimateTracking event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      var result = await _estimateTrackingUC.call(EstimateTrackingParam(
          bedId: currentState.selectedBed!.id,
          itemId: currentState.selectedItem?.id,
          isEnableInsurance: currentState.enableInsurance));
      result.fold((l) => null, (r) {
        emit(
            currentState.copyWith(tokenEarn: double.parse(r.estimateSlftEarn)));
      });
    }
  }

  void _userStatusTracking(
      UserStatusTracking event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      var result = await _userStatusTrackingUC.call(NoParams());
      result.fold((l) => null, (r) {
        emit(currentState.copyWith(
            userStatusTracking: r,
            startTracking: false,
            minute: DateTime.now().minute,
            hour: DateTime.now().hour,
            time: 0));
        add(EstimateTracking());
      });
    }
  }

  void _startTracking(StartTracking event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      DateTime wakeUp =
          DateTime.now().add(Duration(minutes: currentState.time));
      var result = await _startSleepTrackingUC.call(StartTrackingSchema(
        isEnableInsurance: currentState.enableInsurance,
        bedUsed: currentState.selectedBed!.id,
        wakeUp: '${wakeUp.toUtc().millisecondsSinceEpoch ~/ 1000}',
        alrm: currentState.enableAlarm,
        itemUsed: currentState.selectedItem?.id ?? 0,
      ));
      result.fold((l) => emit(HomeState.startError('$l')), (r) {
        emit(currentState.copyWith(startTracking: true));
      });
    }
  }

  void _changeInsurance(ChangeInsurance event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      emit(currentState.copyWith(enableInsurance: event.enableInsurance));
      add(EstimateTracking());
    }
  }

  void _changeStatusAlarm(
      ChangeStatusAlarm event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.bedList.isNotEmpty) {
      emit(currentState.copyWith(enableAlarm: event.enableAlarm));
      add(EstimateTracking());
    }
  }

  FutureOr<void> _changeHour(ChangeHour event, Emitter<HomeState> emit) {
    final currentState = state;

    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(
          hour: event.hour, time: _getTimeWithHour(event.hour, currentState)));
    }
  }

  FutureOr<void> _changeMinute(ChangeMinute event, Emitter<HomeState> emit) {
    final currentState = state;

    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(
          minute: event.minute,
          time: _getTimeWithMinutes(event.minute, currentState)));
    }
  }

  int _getTimeWithHour(int hour, HomeState state) {
    if (state is! HomeLoaded) return 0;
    var minute = state.minute;
    var now = DateTime.now();
    var nextDay = DateTime.now().add(const Duration(days: 1));
    var wakeUpTimeInNextDay =
        DateTime(nextDay.year, nextDay.month, nextDay.day, hour, minute);
    var wakeUpTimeInDay = DateTime(now.year, now.month, now.day, hour, minute);
    var wakeUpTime = hour <= now.hour ? wakeUpTimeInNextDay : wakeUpTimeInDay;

    return wakeUpTime.difference(now).inMinutes;
  }

  int _getTimeWithMinutes(int minute, HomeState state) {
    if (state is! HomeLoaded) return 0;
    var hour = state.hour;
    var now = DateTime.now();
    var nextDay = DateTime.now().add(const Duration(days: 1));
    var wakeUpTimeInNextDay =
        DateTime(nextDay.year, nextDay.month, nextDay.day, hour, minute);
    var wakeUpTimeInDay = DateTime(now.year, now.month, now.day, hour, minute);
    var wakeUpTime = hour <= now.hour ? wakeUpTimeInNextDay : wakeUpTimeInDay;

    return wakeUpTime.difference(now).inMinutes;
  }
}
