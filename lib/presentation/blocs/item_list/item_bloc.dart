import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:slee_fi/di/injector.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_event.dart';
import 'package:slee_fi/presentation/blocs/item_list/item_state.dart';
import 'package:slee_fi/schema/param_filler_item_fetch/filter_item_schema.dart';
import 'package:slee_fi/usecase/fetch_item_owner_usecase.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(const ItemState.init()) {
    on<FetchItemEvent>(_fetchItems);
    on<RefreshItemEvent>(_refreshItems);
    on<FilterItemEvent>(_onFilterItem);
    on<LoadMoreItemEvent>(_loadMoreItem);
    on<RemoveItemSuccessEvent>(_removeItemFromBedSuccess);
    on<AddItemSuccessEvent>(_addItemSuccess);
  }

  final _limitItemPage = 10;
  late final FilterItemSchema filterItemParam = FilterItemSchema(
    minLevel: 1,
    maxLevel: 5,
    page: 1,
    limit: _limitItemPage,
    type: [],
  );
  final _fetchItemUC = getIt<FetchItemOwnerUseCase>();

  void _onFilterItem(FilterItemEvent event, Emitter<ItemState> emit) {
    filterItemParam.page = 1;
    filterItemParam.minLevel = event.min;
    filterItemParam.maxLevel = event.max;
    filterItemParam.type = event.selected;
    add(const FetchItemEvent());
  }

  void _refreshItems(
      RefreshItemEvent fetchItem, Emitter<ItemState> emit) async {
    filterItemParam.page = 1;
    add(const FetchItemEvent());
  }

  void _fetchItems(FetchItemEvent fetchItem, Emitter<ItemState> emit) async {
    emit(const ItemState.loading());
    final item = await _fetchItemUC.call(filterItemParam);
    item.fold(
      (l) {
        emit(const ItemState.loaded(itemList: [], loadMoreItem: false));
      },
      (r) {
        final loadMore = r.length >= _limitItemPage;
        emit(ItemState.loaded(itemList: r, loadMoreItem: loadMore));
        filterItemParam.page++;
      },
    );
  }

  void _loadMoreItem(LoadMoreItemEvent event, Emitter<ItemState> emit) async {
    final currentState = state;
    if (currentState is ItemStateLoaded &&
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

  FutureOr<void> _addItemSuccess(
      AddItemSuccessEvent event, Emitter<ItemState> emit) {
    final currentState = state;
    if (currentState is ItemStateLoaded) {
      final List<BedEntity> list = List.from(currentState.itemList!);
      list.remove(event.entity);
      emit(currentState.copyWith(itemList: list));
    }
  }

  void _removeItemFromBedSuccess(
      RemoveItemSuccessEvent event, Emitter<ItemState> emit) {
    final currentState = state;
    if (currentState is ItemStateLoaded) {
      var index = currentState.itemList!
          .indexWhere((element) => element.id == event.entity.id);
      if (index != -1) {
        return;
      }

      final List<BedEntity> list = List.from(currentState.itemList!);
      list.add(event.entity);
      emit(currentState.copyWith(itemList: list));
    }
  }
}
