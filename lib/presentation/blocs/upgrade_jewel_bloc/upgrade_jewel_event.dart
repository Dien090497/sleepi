import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/jewel_entity/jewel_entity.dart';

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

class AddJewelToSocket extends JewelEvent {
  final List<JewelEntity> jewels;

  const AddJewelToSocket(this.jewels)
      : assert(jewels.length == 3, 'accept only 3 jewel at once');

  @override
  List<Object?> get props => [jewels];
}

class ClearJewel extends JewelEvent {
  const ClearJewel();

  @override
  List<Object?> get props => [];
}

class JewelLoading extends JewelEvent {
  final bool isLoading;

  const JewelLoading(this.isLoading);

  @override
  List<Object?> get props => [];
}
