

import 'package:freezed_annotation/freezed_annotation.dart';
part 'lucky_box_entity.freezed.dart';
@freezed
class LuckyBoxEntity with _$LuckyBoxEntity {
  const factory LuckyBoxEntity({required int id ,
    required String openCost,
    required String speedUpCost,
    required int isOpen,
    required String waitingTime,
    required String image,
    required String luckyBoxType,

}) = _LuckyBoxEntity;
}
