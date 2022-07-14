import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_schema.dart';
import 'package:slee_fi/schema/speed_up_lucky_box_schema/speed_up_lucky_box_schema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/estimate_tracking_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_item_owner_usecase.dart';
import 'package:slee_fi/usecase/fetch_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/open_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/remove_item_from_bed_usecase.dart';
import 'package:slee_fi/usecase/speed_up_lucky_box_usecase.dart';
import 'package:slee_fi/usecase/usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchBed>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
    on<FetchItem>(_fetchItems);
    on<RefreshItem>(_refreshItems);
    on<FilterItemEvent>(_onFilterItem);
    on<LoadMoreBed>(_onLoadMoreBed);
    on<LoadMoreItem>(_loadMoreItem);
    on<EstimateTracking>(_estimateTracking);
    on<ChangeInsurance>(_changeInsurance);
    on<FetchLuckyBox>(_fetchLuckyBox);
    on<SpeedUpLuckyBox>(_speedUpLuckyBox);
    on<ChangeHour>(_changeHour);
    on<ChangeMinute>(_changeMinute);
    on<OpenLuckyBox>(_openLuckyBox);
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemFromBedUC = getIt<RemoveItemFromBedUseCase>();
  final _fetchItemUC = getIt<FetchItemOwnerUseCase>();
  final _estimateTrackingUC = getIt<EstimateTrackingUseCase>();
  final _fetchLuckyBoxUC = getIt<FetchLuckyBoxUseCase>();
  final _speedUpLuckyBoxUC = getIt<SpeedUpLuckyBoxUseCase>();
  final _openLuckyBoxUC = getIt<OpenLuckyBoxUseCase>();

  int currentBedId = -1;
  int _currentPageBed = 1;
  final _limitItemPage = 10;
  late final FilterItemSchema filterItemParam = FilterItemSchema(
    level: 0,
    page: 1,
    limit: _limitItemPage,
    type: [],
  );

  void _onFilterItem(FilterItemEvent event, Emitter<HomeState> emit) {
    filterItemParam.page = 1;
    filterItemParam.level = event.level;
    filterItemParam.type = event.selected;
    add(FetchItem());
  }

  void _onLoadMoreBed(LoadMoreBed event, Emitter<HomeState> emit) async {
    final result = await _fetchListBedUC.call(FetchBedParam(
        _currentPageBed, _limitItemPage, CategoryType.bed, AttributeNFT.none));
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
        final newList =
            currentState.bedList + r.map((e) => e.toEntity()).toList();

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
    final result = await _fetchListBedUC.call(FetchBedParam(
        _currentPageBed, _limitItemPage, CategoryType.bed, AttributeNFT.none));
    result.fold(
      (l) {
        emit(HomeState.loaded(
            bedList: [],
            selectedBed: null,
            loadMoreBed: false,
            errorMessage: '',
            minute: DateTime.now().minute,
            hour: DateTime.now().hour));
      },
      (r) {
        _currentPageBed++;
        final currentState = state;
        if (r.isNotEmpty) {
          currentBedId = r.first.id;
        }

        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(
              bedList: r.map((e) => e.toEntity()).toList(),
              selectedBed: r.first.toEntity(),
              loadMoreBed: true,
              selectedItem: null));
          add(FetchLuckyBox());
          return;
        }
        emit(HomeState.loaded(
            errorMessage: '',
            loading: false,
            bedList: r.map((e) => e.toEntity()).toList(),
            selectedBed: r.isNotEmpty ? r.first.toEntity() : null,
            loadMoreBed: true,
            hour: DateTime.now().hour,
            minute: DateTime.now().minute));
        add(FetchLuckyBox());
      },
    );
  }

  void _refreshItems(RefreshItem fetchItem, Emitter<HomeState> emit) async {
    filterItemParam.page = 1;
    add(FetchItem());
  }

  void _fetchItems(FetchItem fetchItem, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      final item = await _fetchItemUC.call(filterItemParam);
      item.fold(
        (l) {
          emit(currentState.copyWith(itemList: [], loadMoreItem: false));
        },
        (r) {
          filterItemParam.page++;
          emit(currentState.copyWith(
              itemList: r, loadMoreBed: true && r.length >= _limitItemPage));
        },
      );
    }
  }

  void _loadMoreItem(LoadMoreItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded &&
        currentState.loadMoreItem &&
        currentState.itemList?.isNotEmpty == true) {
      final item = await _fetchItemUC.call(filterItemParam);
      item.fold(
        (l) => emit(currentState.copyWith(loadMoreItem: false)),
        (r) {
          filterItemParam.page++;
          final newList = currentState.itemList! + r;
          emit(currentState.copyWith(
              itemList: newList,
              loadMoreItem: r.isNotEmpty && r.length >= filterItemParam.limit));
        },
      );
    }
  }

  void _addItemToBed(AddItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
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
          itemId: currentState.selectedItem?.id ?? 0,
          isEnableInsurance: currentState.enableInsurance));
      result.fold((l) => null, (r) {
        emit(currentState.copyWith(tokenEarn: double.parse(r.slftTokenAmount)));
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

  void _fetchLuckyBox(FetchLuckyBox event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      var result = await _fetchLuckyBoxUC.call(NoParams());
      result.fold((l) {
        'load lucky box error ${l.msg}'.log;
      }, (r) {
        emit(currentState.copyWith(
            luckyBoxes: r.map((e) => e.toEntity()).toList()));
        add(EstimateTracking());
      });
    }
  }

  FutureOr<void> _speedUpLuckyBox(
      SpeedUpLuckyBox event, Emitter<HomeState> emit) async {
    var result = await _speedUpLuckyBoxUC.call(SpeedUpLuckyBoxSchema(event.id));

    result.fold((l) => null, (r) {
      final currentState = state;
      if (currentState is HomeLoaded) {
        final luckyBoxes = currentState.luckyBoxes;
        luckyBoxes.removeWhere((element) => element.id == event.id);
        emit(currentState.copyWith(luckyBoxes: luckyBoxes));
      }
    });
  }

  FutureOr<void> _changeHour(ChangeHour event, Emitter<HomeState> emit) {
    final currentState = state;

    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(hour: event.hour));
    }
  }

  FutureOr<void> _changeMinute(ChangeMinute event, Emitter<HomeState> emit) {
    final currentState = state;

    if (currentState is HomeLoaded) {
      emit(currentState.copyWith(minute: event.minute));
    }
  }

  FutureOr<void> _openLuckyBox(
      OpenLuckyBox event, Emitter<HomeState> emit) async {
    var result = await _openLuckyBoxUC.call(event.id);
    result.fold((l) => null, (r) {
      final currentState = state;

      if (currentState is HomeLoaded) {
        var list = currentState.luckyBoxes;
        list.removeWhere((element) => element.id == event.id);
        emit(currentState.copyWith(luckyBoxes: list));
      }
    });
  }
}
