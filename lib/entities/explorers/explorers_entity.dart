import 'package:freezed_annotation/freezed_annotation.dart';

part 'explorers_entity.freezed.dart';

@freezed
class ExplorersEntity with _$ExplorersEntity {
  const factory ExplorersEntity(
      int id, String name, String url, String standard) = _ExplorersEntity;
}
