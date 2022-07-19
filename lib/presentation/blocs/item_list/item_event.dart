import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class FetchItemEvent extends ItemEvent {
  const FetchItemEvent();

  @override
  List<Object> get props => [];
}

class RefreshItemEvent extends ItemEvent {
  const RefreshItemEvent();

  @override
  List<Object> get props => [];
}

class LoadMoreItemEvent extends ItemEvent {
  const LoadMoreItemEvent();

  @override
  List<Object> get props => [];
}

class FilterItemEvent extends ItemEvent {
  final List<String> selected;
  final int min;
  final int max;

  const FilterItemEvent(
    this.selected,
    this.min,
    this.max,
  );

  @override
  List<Object> get props => [selected, min, max];
}

class RemoveItemSuccessEvent extends ItemEvent {
  final ItemEntity entity;

  const RemoveItemSuccessEvent(this.entity);

  @override
  List<Object> get props => [entity];
}

class AddItemSuccessEvent extends ItemEvent {
  final ItemEntity entity;

  const AddItemSuccessEvent(this.entity);

  @override
  List<Object> get props => [entity];
}
