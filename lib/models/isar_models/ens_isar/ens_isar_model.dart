import 'package:isar/isar.dart';
import 'package:slee_fi/entities/ens/ens_entity.dart';
import 'package:slee_fi/models/ens/ens.dart';

part 'ens_isar_model.g.dart';

@Collection()
class EnsIsarModel {
  int? id = Isar.autoIncrement;

  late String registry;

  EnsIsarModel(this.registry, {this.id});

  static EnsIsarModel? fromEns(Ens? e) {
    if (e != null) {
      return EnsIsarModel(e.registry);
    }
    return null;
  }

  static EnsIsarModel? fromEnsEntity(EnsEntity? e) {
    if (e != null) {
      return EnsIsarModel(e.registry, id: e.id);
    }
    return null;
  }

  EnsEntity? toEntity() => EnsEntity(id!, registry);
}
