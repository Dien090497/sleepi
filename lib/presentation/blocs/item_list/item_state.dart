

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/item_entity/item_entity.dart';
part 'item_state.freezed.dart';
@freezed
class ItemState with _$ItemState{
  const factory ItemState.init()= ItemStateInitital;
  const factory ItemState.loading()= ItemStateLoading;
  const factory ItemState.loaded({

    List<ItemEntity>? itemList,
    @Default(true) bool loadMoreItem,

  })= ItemStateLoaded;
}