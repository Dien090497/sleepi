import 'package:equatable/equatable.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
import 'package:slee_fi/usecase/fetch_bed_usecase.dart';

abstract class JewelEvent extends Equatable {
  const JewelEvent();
}

class InitEvent extends JewelEvent {
  final CategoryType categoryType;

  const InitEvent(this.categoryType);

  @override
  List<Object?> get props => [categoryType];
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
  final List<BedEntity> jewels;

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

class JewelFetchAllList extends JewelEvent {
  const JewelFetchAllList();

  @override
  List<Object?> get props => [];
}
