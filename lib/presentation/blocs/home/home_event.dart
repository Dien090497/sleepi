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
  final BedEntity item;

  const AddItem(this.item);

  @override
  List<Object?> get props => [item];
}

class RemoveItem extends HomeEvent {
  const RemoveItem();

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
  const RefreshBed();

  @override
  List<Object?> get props => [];
}

class LoadMoreBed extends HomeEvent {
  const LoadMoreBed();

  @override
  List<Object?> get props => [];
}

class ChangeInsurance extends HomeEvent {
  final bool enableInsurance;

  const ChangeInsurance(this.enableInsurance);

  @override
  List<Object?> get props => [enableInsurance];
}

class ChangeStatusAlarm extends HomeEvent {
  final bool enableAlarm;

  const ChangeStatusAlarm(this.enableAlarm);

  @override
  List<Object?> get props => [enableAlarm];
}
