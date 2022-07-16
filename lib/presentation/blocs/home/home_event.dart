part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchBed extends HomeEvent {
  const FetchBed();

  @override
  List<Object?> get props => [];
}

class AddItem extends HomeEvent {
  final ItemEntity item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class ChangeBed extends HomeEvent {
  final BedEntity bed;

  const ChangeBed({required this.bed});

  @override
  List<Object?> get props => [bed];
}

class RefreshBed extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FetchItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class RefreshItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class FilterItemEvent extends HomeEvent {
  final List<String> selected;
  final int min;
  final int max;

  const FilterItemEvent(
    this.selected,
    this.min,
    this.max,
  );

  @override
  List<Object?> get props => [selected, min, max];
}

class LoadMoreItem extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class LoadMoreBed extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class EstimateTracking extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class UserStatusTracking extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class StartTracking extends HomeEvent {

  @override
  List<Object?> get props => [];
}

class ChangeInsurance extends HomeEvent {
  final bool enableInsurance;

  const ChangeInsurance(this.enableInsurance);

  @override
  List<Object?> get props => [enableInsurance];
}

class FetchLuckyBox extends HomeEvent {
  @override
  List<Object?> get props => [];
}

class OpenLuckyBox extends HomeEvent {
  final int id;

  const OpenLuckyBox(this.id);

  @override
  List<Object?> get props => [id];
}

class SpeedUpLuckyBox extends HomeEvent {
  final int id;

  const SpeedUpLuckyBox(this.id);

  @override
  List<Object?> get props => [id];
}

class ChangeHour extends HomeEvent {
  final int hour;

  const ChangeHour(this.hour);

  @override
  List<Object?> get props => [hour];
}

class ChangeMinute extends HomeEvent {
  final int minute;

  const ChangeMinute(this.minute);

  @override
  List<Object?> get props => [minute];
}
