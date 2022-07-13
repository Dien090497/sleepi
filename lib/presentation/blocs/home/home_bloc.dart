import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/common/enum/enum.dart';
import 'package:slee_fi/common/extensions/string_x.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
import 'package:slee_fi/presentation/blocs/home/home_state.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_chema.dart';
import 'package:slee_fi/usecase/add_item_to_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';
import 'package:slee_fi/usecase/fetch_item_owner_usecase.dart';
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
    on<RefreshItem>(_refreshItems);
    on<FilterItemEvent>(_onFilterItem);
    on<LoadMoreBed>(_onLoadMoreBed);
    on<LoadMoreItem>(_loadMoreItem);
  }

  final _fetchListBedUC = getIt<FetchBedUseCase>();
  final _addItemToBedUC = getIt<AddItemToBedUseCase>();
  final _removeItemFromBedUC = getIt<RemoveItemFromBedUseCase>();
  final _fetchItemUC = getIt<FetchItemOwnerUseCase>();

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

  void _onRefresh(RefreshBed event, Emitter<HomeState> emit) {
    _currentPageBed = 1;
    emit(const HomeState.loading());
    add(const FetchData());
  }

  void _changeBed(ChangeBed event, Emitter<HomeState> emit) {
    final currentState = state;
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

  void _fetchBed(FetchData fetchData, Emitter<HomeState> emit) async {
    final result = await _fetchListBedUC.call(FetchBedParam(
        _currentPageBed, _limitItemPage, CategoryType.bed, AttributeNFT.none));
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

  void _refreshItems(RefreshItem fetchItem, Emitter<HomeState> emit) async {
    filterItemParam.page = 1;
    'on refresh item   ${filterItemParam.page}'.log;
    add(FetchItem());
  }

  void _fetchItems(FetchItem fetchItem, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded) {
      'page in fetch item  ${filterItemParam.page}'.log;
      final item = await _fetchItemUC.call(filterItemParam);
      item.fold(
        (l) {
          emit(currentState.copyWith(itemList: [], loadMoreItem: false));
        },
        (r) {
          filterItemParam.page++;
          'new page is   ${filterItemParam.page}  ${r.length}'.log;
          emit(currentState.copyWith(
              itemList: r, loadMoreBed: true && r.length >= _limitItemPage));
        },
      );
    }
  }

  void _loadMoreItem(LoadMoreItem event, Emitter<HomeState> emit) async {
    final currentState = state;

    'page is load more ${filterItemParam.page}'.log;
    if (currentState is HomeLoaded &&
        currentState.loadMoreItem &&
        currentState.itemList?.isNotEmpty == true) {
      final item = await _fetchItemUC.call(filterItemParam);
      item.fold(
        (l) {
          'on load more error  '.log;
          emit(currentState.copyWith(loadMoreItem: false));
        },
        (r) {
          'on load more item  ${r.length}'.log;

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

  void _removeItem(RemoveItem event, Emitter<HomeState> emit) async {
    final currentState = state;
    if (currentState is HomeLoaded && currentState.selectedItem != null) {
      final result = await _removeItemFromBedUC
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
