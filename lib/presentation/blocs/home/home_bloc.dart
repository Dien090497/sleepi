import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/remove_item_from_bed_usecase.dart';

part 'home_event.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<FetchData>(_fetchBed);
    on<AddItem>(_addItemToBed);
    on<RemoveItem>(_removeItem);
    on<ChangeBed>(_changeBed);
    on<RefreshBed>(_onRefresh);
    on<FetchItem>(_fetchItems);
    on<FilterItemEvent>(_onFilterItem);
    on<LoadMoreBed>(_onLoadMoreBed);
    on<LoadMoreItem>(_loadMoreItem);
  }

  int currentBedId = -1;
  List<String> itemFilter = [];
  int level = 0;
  int _currentPageBed = 1;
  int _currentPageItem = 1;
  final _limitItemPage = 10;

  _loadMoreItem(LoadMoreItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      'run to load more in bloc  ${currentState.loadMoreItem}'.log;
    }
    if (currentState is HomeLoaded &&
        currentState.loadMoreItem &&
        currentState.itemList?.isNotEmpty == true) {
      var item = await _fetchListBedUC.call(FetchBedParam(
          _currentPageItem, _limitItemPage, CategoryType.item, AttributeNFT.none));
      item.fold(
        (l) {
          'on load more error  '.log;
          emit(currentState.copyWith(loadMoreItem: false));
        },
        (r) {
          'on load more success  ${r.length}  $_currentPageItem'.log;

          _currentPageItem++;
          var newList =
              currentState.itemList! + r.map((e) => e.toEntity()).toList();
          emit(currentState.copyWith(
              itemList: newList, loadMoreItem: r.isNotEmpty));
        },
      );
    }
  }

  _onFilterItem(FilterItemEvent event, Emitter<HomeState> emit) {
    level = event.level;
    itemFilter = event.selected;
  }

  _onLoadMoreBed(LoadMoreBed event, Emitter<HomeState> emit) async {
    var result = await _fetchListBedUC.call(
        FetchBedParam(_currentPageBed, _limitItemPage, CategoryType.bed, AttributeNFT.none));
    result.fold((l) {
      final currentState = state;
      if (currentState is HomeLoaded) {
        emit(currentState.copyWith(
          loadMoreBed: false,
          durability: currentState.bedList.first.durability,
          id: currentState.bedList.first.id,
          level: currentState.bedList.first.level,
          time: currentState.bedList.first.time,
        ));
      }
    }, (r) {
      _currentPageBed++;
      final currentState = state;
      if (currentState is HomeLoaded) {
        if (r.isEmpty) {
          emit(currentState.copyWith(
            loadMoreBed: false,
            durability: currentState.bedList.first.durability,
            id: currentState.bedList.first.id,
            level: currentState.bedList.first.level,
            time: currentState.bedList.first.time,
          ));
          return;
        }
        final newList =
            currentState.bedList + r.map((e) => e.toEntity()).toList();

        emit(currentState.copyWith(
          bedList: newList,
          loadMoreBed: r.isNotEmpty,
          durability: r.isEmpty ? 0 : r.first.durability,
          id: r.isEmpty ? 0 : r.first.id,
          level: r.isEmpty ? 0 : r.first.level,
          time: r.isEmpty ? 0 : r.first.time,
        ));
      }
    });
  }

  _onRefresh(RefreshBed event, Emitter<HomeState> emit) {
    _currentPageBed = 1;
    emit(const HomeState.loading());
    add(const FetchData());
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemFromBedUC = getIt<RemoveItemFromBedUseCase>();

  _changeBed(ChangeBed event, Emitter<HomeState> emit) {
    var currentState = state;
    if (currentState is HomeLoaded) {
      currentBedId = event.id;
      emit(currentState.copyWith(
        time: event.time,
        level: event.level,
        id: event.id,
        durability: event.durability,
      ));
    }
  }

  _fetchBed(FetchData fetchData, Emitter<HomeState> emit) async {
    var result = await _fetchListBedUC.call(
        FetchBedParam(_currentPageBed, _limitItemPage, CategoryType.bed, AttributeNFT.none));
    result.fold(
      (l) {
        emit(const HomeState.loaded(
          bedList: [],
          durability: 0,
          id: 0,
          level: 0,
          time: 0,
          loadMoreBed: false,
          errorMessage: '',
        ));
      },
      (r) {
        _currentPageBed++;
        'bed size is ${r.length}'.log;
        final currentState = state;
        if (r.isNotEmpty) {
          currentBedId = r.first.id;
        }
        if (currentState is HomeLoaded) {
          emit(currentState.copyWith(
              bedList: r.map((e) => e.toEntity()).toList(),
              durability: r.isEmpty ? 0 : r.first.durability,
              id: r.isEmpty ? 0 : r.first.id,
              level: r.isEmpty ? 0 : r.first.level,
              time: r.isEmpty ? 0 : r.first.time,
              loadMoreBed: true,
              selectedItem: null));
          return;
        }
        emit(HomeState.loaded(
            errorMessage: '',
            loading: false,
            bedList: r.map((e) => e.toEntity()).toList(),
            durability: r.isEmpty ? 0 : r.first.durability,
            id: r.isEmpty ? 0 : r.first.id,
            level: r.isEmpty ? 0 : r.first.level,
            selectedItem: null,
            loadMoreBed: true,
            time: r.isEmpty ? 0 : r.first.time));
      },
    );
  }

  _fetchItems(FetchItem fetchItem, Emitter<HomeState> emit) async {
    _currentPageItem = 1;
    final currentState = state;
    if (currentState is HomeLoaded) {
      var item = await _fetchListBedUC.call(FetchBedParam(
          _currentPageItem, _limitItemPage, CategoryType.item, AttributeNFT.none));
      item.fold(
        (l) {
          emit(currentState.copyWith(itemList: [], loadMoreItem: false));
        },
        (r) {
          _currentPageItem++;
          emit(currentState.copyWith(
              itemList: r.map((e) => e.toEntity()).toList(),
              loadMoreBed: true));
        },
      );
    }
  }

  _addItemToBed(AddItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      var result = await _addItemToBedUC
          .call(AddItemToBedParam(currentBedId, event.item.id));
      result.fold((l) {
        'add item error ${l.msg} '.log;
        emit(currentState.copyWith(
          errorMessage: l.msg,
          errorType: ErrorType.addItemToBed,
        ));
      }, (r) {
        'add item success $r'.log;
        emit(currentState.copyWith(selectedItem: event.item));
      });
    }
  }

  _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedItem != null) {
      var result = await _removeItemFromBedUC
          .call(AddItemToBedParam(currentBedId, currentState.selectedItem!.id));
      result.fold((l) {
        'remove error ${l.msg}'.log;
        emit(currentState.copyWith(
          errorMessage: l.msg,
          errorType: ErrorType.removeItemFromBed,
        ));
      }, (r) {
        'remove success $r'.log;
        emit(currentState.copyWith(
          selectedItem: null,
          errorType: ErrorType.none,
        ));
      });
    }
  }
}
