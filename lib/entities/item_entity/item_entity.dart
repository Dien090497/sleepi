

import 'package:freezed_annotation/freezed_annotation.dart';

part 'item_entity.freezed.dart';
@freezed
class ItemEntity with _$ItemEntity{

  const factory ItemEntity({
    required String name,
    required String image,
    required int id,
    required String effect,
    required int level
})= _ItemEntity;
}