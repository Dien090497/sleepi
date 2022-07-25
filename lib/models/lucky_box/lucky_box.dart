import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:slee_fi/entities/lucky_box/lucky_box_entity.dart';

part 'lucky_box.g.dart';

@JsonSerializable()
class LuckyBox {
  final int id;
  final int userId;
  final int level;
  final String waitingTime;
  final String speedUpCost;
  final String redrawRate;
  final String openingCost;
  final String typeGift;
  final String? symbol;
  final String? amount;
  final int? nftId;
  final int isOpen;
  final String createdAt;
  final String updatedAt;

  LuckyBox(
    this.id,
    this.userId,
    this.level,
    this.waitingTime,
    this.speedUpCost,
    this.redrawRate,
    this.openingCost,
    this.typeGift,
    this.symbol,
    this.amount,
    this.nftId,
    this.isOpen,
    this.createdAt,
    this.updatedAt,
  );

  factory LuckyBox.fromJson(Map<String, dynamic> json) =>
      _$LuckyBoxFromJson(json);

  Map<String, dynamic> toJson() => _$LuckyBoxToJson(this);

  LuckyBoxEntity toEntity() => LuckyBoxEntity(
      id: id,
      isOpen: isOpen,
      openCost: openingCost,
      speedUpCost: speedUpCost,
      waitingTime: waitingTime);
}
