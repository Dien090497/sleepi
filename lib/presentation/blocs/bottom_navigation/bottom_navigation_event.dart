import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class SelectTab extends BottomNavigationEvent {
  final int index;

  const SelectTab(this.index);

  @override
  List<Object?> get props => [index];
}
