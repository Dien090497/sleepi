part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchData extends HomeEvent {
  const FetchData();

  @override
  List<Object?> get props => [];
}

class AddItem extends HomeEvent {
  final BedEntity item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeBed extends HomeEvent {
  final int level;
  final int durability;
  final int time;
  final int id;

  const ChangeBed(
      {required this.level,
      required this.durability,
      required this.time,
      required this.id});

  @override
  List<Object?> get props => [level, durability, time, id];
}

class RefreshBed extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FetchItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FilterItemEvent extends HomeEvent {
  final List<String> selected;
  final int level;

  const FilterItemEvent(this.selected, this.level);

  @override
  List<Object?> get props => [selected, level];
}

class LoadMoreBed extends HomeEvent {
  @override
  List<Object?> get props => [];
}
