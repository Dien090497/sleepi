import 'package:equatable/equatable.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();
}

class SelectTab extends BottomNavigationEvent {
  final int index;
  final int indexTabChild;

  const SelectTab(this.index, {this.indexTabChild = 0});

  @override
  List<Object?> get props => [index];
}
