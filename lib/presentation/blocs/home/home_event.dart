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
  final int itemId;
  final int bedId;

  const AddItem(this.itemId, this.bedId);

  @override
  List<Object?> get props => [itemId, bedId];
}

class RemoveItem extends HomeEvent {
  final int itemId;

  const RemoveItem(this.itemId);

  @override
  List<Object?> get props => [itemId];
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
