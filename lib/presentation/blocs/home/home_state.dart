import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/bed_entity/bed_entity.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = HomeInitial;

  const factory HomeState.loading() = HomeLoading;

  const factory HomeState.loaded({
    required List<BedEntity> bedList,
    required int id,
    required int level,
    required int durability,
    required int time,
    BedEntity? item,
    List<BedEntity>? itemList,
    BedEntity? selectedItem,
    @Default('')
    required String errorMessage,
    @Default(false)
    required  bool loading
  }) = HomeLoaded;

  const factory HomeState.error(String message) = HomeError;
}
