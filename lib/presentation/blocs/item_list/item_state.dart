

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';
part 'item_state.freezed.dart';
@freezed
class ItemState with _$ItemState{
  const factory ItemState.init()= ItemStateInitital;
  const factory ItemState.loading()= ItemStateLoading;
  const factory ItemState.loaded({

    List<BedEntity>? itemList,
    @Default(true) bool loadMoreItem,

  })= ItemStateLoaded;
}