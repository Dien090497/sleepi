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
