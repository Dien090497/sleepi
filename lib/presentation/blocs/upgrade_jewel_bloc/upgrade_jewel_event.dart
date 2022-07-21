import 'package:equatable/equatable.dart';

abstract class JewelEvent extends Equatable {
  const JewelEvent();
}

class JewelFetchList extends JewelEvent {
  const JewelFetchList();

  @override
  List<Object?> get props => [];
}

class JewelRefreshList extends JewelEvent {
  const JewelRefreshList();

  @override
  List<Object?> get props => [];
}

class UpgradeJewel extends JewelEvent {
  const UpgradeJewel();

  @override
  List<Object?> get props => [];
}
