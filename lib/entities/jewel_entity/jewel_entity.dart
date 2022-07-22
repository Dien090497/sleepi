import 'package:freezed_annotation/freezed_annotation.dart';

part 'jewel_entity.g.dart';

@JsonSerializable()
class JewelEntity {
  final int id;
  final String image;
  final String nftName;
  final int level;
  final int nftId;
  final String type;
  final String jewelType;
  final String resilience;
  final String efficiency;
  final String luck;
  final String bonus;
  final String special;
  final String? quality;

  JewelEntity({
    required this.nftName,
    required this.bonus,
    required this.special,
    required this.id,
    required this.image,
    required this.type,
    required this.level,
    required this.jewelType,
    required this.nftId,
    required this.resilience,
    required this.efficiency,
    required this.luck,
    required this.quality,
  });

  factory JewelEntity.fromJson(Map<String, dynamic> json) =>
      _$JewelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$JewelEntityToJson(this);

  // Ruby: Positively affects Efficiency values.
  // Sapphire: Positively affects Luck values
  // Emerald: positively affects Bonus values
  // Diamond: positively affects Special values

  String get infoBuff {
    switch (jewelType) {
      case 'ruby':
        return efficiency;
      case 'sapphire':
        return luck;
      case 'emerald':
        return bonus;
      case 'diamond':
        return special;
    }
    return '';
  }
}
