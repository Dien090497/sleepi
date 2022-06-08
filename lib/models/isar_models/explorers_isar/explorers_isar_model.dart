import 'package:isar/isar.dart';
import 'package:slee_fi/entities/explorers/explorers_entity.dart';
import 'package:slee_fi/models/explorers/explorers.dart';

part 'explorers_isar_model.g.dart';

@Collection()
class ExplorersIsarModel {
  int? id = Isar.autoIncrement;

  late String name;
  late String url;
  late String standard;

  ExplorersIsarModel(this.name, this.url, this.standard, {this.id});

  factory ExplorersIsarModel.fromExplorers(Explorers e) {
    return ExplorersIsarModel(e.name, e.url, e.standard);
  }

  factory ExplorersIsarModel.fromEntity(ExplorersEntity e) {
    return ExplorersIsarModel(e.name, e.url, e.standard, id: e.id);
  }

  ExplorersEntity toEntity() => ExplorersEntity(id!, name, url, standard);
}
