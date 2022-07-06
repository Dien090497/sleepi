import 'package:freezed_annotation/freezed_annotation.dart';

part 'active_code_entity.freezed.dart';

@freezed
class ActiveCodeEntity with _$ActiveCodeEntity {
  const factory ActiveCodeEntity(String code, bool isUsed,
      {String? codeUsedAt}) = _ActiveCodeEntity;
}
