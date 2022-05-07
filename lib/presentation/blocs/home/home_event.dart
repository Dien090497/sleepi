part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class FetchData extends HomeEvent {
  const FetchData();

  @override
  List<Object?> get props => [];
}
