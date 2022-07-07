import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/active_code/active_code_entity.dart';

part 'active_code.g.dart';

@JsonSerializable()
class ActiveCode {
  final int id;
  final int userId;
  final String code;
  final String? expired;
  final String? codeUsedAt;
  final bool isUsed;
  final String? friend;

  ActiveCode(this.id, this.userId, this.code, this.expired, this.codeUsedAt,
      this.isUsed, this.friend,);

  factory ActiveCode.fromJson(Map<String, dynamic> json) =>
      _$ActiveCodeFromJson(json);


  Map<String, dynamic> toJson() => _$ActiveCodeToJson(this);

  ActiveCodeEntity toEntity() {
    return ActiveCodeEntity(code, isUsed, codeUsedAt: codeUsedAt);
  }
}
