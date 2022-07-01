import 'package:isar/isar.dart';
import 'package:slee_fi/entities/token_default_entity/token_default_entity.dart';
import 'package:slee_fi/models/isar_models/network_isar/network_isar_model.dart';
import 'package:slee_fi/models/token_default/token_default.dart';

part 'token_default_model.g.dart';

@Collection(accessor: 'tokenDefault')
class TokenDefaultModel {
  int? id = Isar.autoIncrement;

  late String slft;
  late String slgt;
  late String wavax;
  late String bed;
  late String jewels;
  late String bedBoxes;
  late String items;

  @Backlink(to: 'tokenDefault')
  final tokenDefault = IsarLink<NetworkIsarModel>();

  TokenDefaultModel({
    this.id,
    required this.slft,
    required this.slgt,
    required this.wavax,
    required this.bed,
    required this.bedBoxes,
    required this.items,
    required this.jewels
  });

  factory TokenDefaultModel.fromEntity(TokenDefaultEntity e) {
    return TokenDefaultModel(
      id: e.id,
      slft: e.slft,
      slgt: e.slgt,
      wavax: e.wavax,
      bed: e.bed,
      bedBoxes: e.bedBoxes,
      items: e.items,
      jewels: e.jewels
    );
  }

  factory TokenDefaultModel.fromTokenDefault(
      TokenDefault e) {
    return TokenDefaultModel(
      slft: e.slft,
      slgt: e.slgt,
      wavax: e.wavax,
      bed: e.bed,
      bedBoxes: e.bedBoxes,
      items: e.items,
      jewels: e.jewels,
    );
  }

  TokenDefaultEntity toEntity() =>
      TokenDefaultEntity(id: id!, slgt: slgt, slft: slft, wavax: wavax, jewels: jewels, bed: bed, items: items, bedBoxes: bedBoxes);
}