// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ens_isar_model.dart';

// **************************************************************************
// IsarCollectionGenerator
// **************************************************************************

// ignore_for_file: duplicate_ignore, non_constant_identifier_names, constant_identifier_names, invalid_use_of_protected_member, unnecessary_cast, unused_local_finaliable

extension GetEnsIsarModelCollection on Isar {
  IsarCollection<EnsIsarModel> get ensIsarModels => getCollection();
}

const EnsIsarModelSchema = CollectionSchema(
  name: 'EnsIsarModel',
  schema:
      '{"name":"EnsIsarModel","idName":"id","properties":[{"name":"registry","type":"String"}],"indexes":[],"links":[]}',
  idName: 'id',
  propertyIds: {'registry': 0},
  listProperties: {},
  indexIds: {},
  indexValueTypes: {},
  linkIds: {},
  backlinkLinkNames: {},
  getId: _ensIsarModelGetId,
  setId: _ensIsarModelSetId,
  getLinks: _ensIsarModelGetLinks,
  attachLinks: _ensIsarModelAttachLinks,
  serializeNative: _ensIsarModelSerializeNative,
  deserializeNative: _ensIsarModelDeserializeNative,
  deserializePropNative: _ensIsarModelDeserializePropNative,
  serializeWeb: _ensIsarModelSerializeWeb,
  deserializeWeb: _ensIsarModelDeserializeWeb,
  deserializePropWeb: _ensIsarModelDeserializePropWeb,
  version: 3,
);

int? _ensIsarModelGetId(EnsIsarModel object) {
  if (object.id == Isar.autoIncrement) {
    return null;
  } else {
    return object.id;
  }
}

void _ensIsarModelSetId(EnsIsarModel object, int id) {
  object.id = id;
}

List<IsarLinkBase> _ensIsarModelGetLinks(EnsIsarModel object) {
  return [];
}

void _ensIsarModelSerializeNative(
    IsarCollection<EnsIsarModel> collection,
    IsarRawObject rawObj,
    EnsIsarModel object,
    int staticSize,
    List<int> offsets,
    AdapterAlloc alloc) {
  final dynamicSize = 0;
  final value0 = object.registry;
  final _registry = IsarBinaryWriter.utf8Encoder.convert(value0);
  dynamicSize += (_registry.length) as int;
  final size = staticSize + dynamicSize;

  rawObj.buffer = alloc(size);
  rawObj.buffer_length = size;
  final buffer = IsarNative.bufAsBytes(rawObj.buffer, size);
  final writer = IsarBinaryWriter(buffer, staticSize);
  writer.writeBytes(offsets[0], _registry);
}

EnsIsarModel _ensIsarModelDeserializeNative(
    IsarCollection<EnsIsarModel> collection,
    int id,
    IsarBinaryReader reader,
    List<int> offsets) {
  final object = EnsIsarModel(
    reader.readString(offsets[0]),
    id: id,
  );
  return object;
}

P _ensIsarModelDeserializePropNative<P>(
    int id, IsarBinaryReader reader, int propertyIndex, int offset) {
  switch (propertyIndex) {
    case -1:
      return id as P;
    case 0:
      return (reader.readString(offset)) as P;
    default:
      throw 'Illegal propertyIndex';
  }
}

dynamic _ensIsarModelSerializeWeb(
    IsarCollection<EnsIsarModel> collection, EnsIsarModel object) {
  final jsObj = IsarNative.newJsObject();
  IsarNative.jsObjectSet(jsObj, 'id', object.id);
  IsarNative.jsObjectSet(jsObj, 'registry', object.registry);
  return jsObj;
}

EnsIsarModel _ensIsarModelDeserializeWeb(
    IsarCollection<EnsIsarModel> collection, dynamic jsObj) {
  final object = EnsIsarModel(
    IsarNative.jsObjectGet(jsObj, 'registry') ?? '',
    id: IsarNative.jsObjectGet(jsObj, 'id'),
  );
  return object;
}

P _ensIsarModelDeserializePropWeb<P>(Object jsObj, String propertyName) {
  switch (propertyName) {
    case 'id':
      return (IsarNative.jsObjectGet(jsObj, 'id')) as P;
    case 'registry':
      return (IsarNative.jsObjectGet(jsObj, 'registry') ?? '') as P;
    default:
      throw 'Illegal propertyName';
  }
}

void _ensIsarModelAttachLinks(
    IsarCollection col, int id, EnsIsarModel object) {}

extension EnsIsarModelQueryWhereSort
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QWhere> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhere> anyId() {
    return addWhereClauseInternal(const IdWhereClause.any());
  }
}

extension EnsIsarModelQueryWhere
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QWhereClause> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhereClause> idEqualTo(
      int id) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: id,
      includeLower: true,
      upper: id,
      includeUpper: true,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhereClause> idNotEqualTo(
      int id) {
    if (whereSortInternal == Sort.asc) {
      return addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      ).addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      );
    } else {
      return addWhereClauseInternal(
        IdWhereClause.greaterThan(lower: id, includeLower: false),
      ).addWhereClauseInternal(
        IdWhereClause.lessThan(upper: id, includeUpper: false),
      );
    }
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhereClause> idGreaterThan(
      int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.greaterThan(lower: id, includeLower: include),
    );
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhereClause> idLessThan(int id,
      {bool include = false}) {
    return addWhereClauseInternal(
      IdWhereClause.lessThan(upper: id, includeUpper: include),
    );
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterWhereClause> idBetween(
    int lowerId,
    int upperId, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addWhereClauseInternal(IdWhereClause.between(
      lower: lowerId,
      includeLower: includeLower,
      upper: upperId,
      includeUpper: includeUpper,
    ));
  }
}

extension EnsIsarModelQueryFilter
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QFilterCondition> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition> idIsNull() {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.isNull,
      property: 'id',
      value: null,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition> idEqualTo(
      int value) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition> idGreaterThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition> idLessThan(
    int value, {
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'id',
      value: value,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition> idBetween(
    int lower,
    int upper, {
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'id',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryEqualTo(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.eq,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryGreaterThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.gt,
      include: include,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryLessThan(
    String value, {
    bool caseSensitive = true,
    bool include = false,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.lt,
      include: include,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryBetween(
    String lower,
    String upper, {
    bool caseSensitive = true,
    bool includeLower = true,
    bool includeUpper = true,
  }) {
    return addFilterConditionInternal(FilterCondition.between(
      property: 'registry',
      lower: lower,
      includeLower: includeLower,
      upper: upper,
      includeUpper: includeUpper,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryStartsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.startsWith,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryEndsWith(
    String value, {
    bool caseSensitive = true,
  }) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.endsWith,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryContains(String value, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.contains,
      property: 'registry',
      value: value,
      caseSensitive: caseSensitive,
    ));
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterFilterCondition>
      registryMatches(String pattern, {bool caseSensitive = true}) {
    return addFilterConditionInternal(FilterCondition(
      type: ConditionType.matches,
      property: 'registry',
      value: pattern,
      caseSensitive: caseSensitive,
    ));
  }
}

extension EnsIsarModelQueryLinks
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QFilterCondition> {}

extension EnsIsarModelQueryWhereSortBy
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QSortBy> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> sortById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> sortByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> sortByRegistry() {
    return addSortByInternal('registry', Sort.asc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> sortByRegistryDesc() {
    return addSortByInternal('registry', Sort.desc);
  }
}

extension EnsIsarModelQueryWhereSortThenBy
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QSortThenBy> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> thenById() {
    return addSortByInternal('id', Sort.asc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> thenByIdDesc() {
    return addSortByInternal('id', Sort.desc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> thenByRegistry() {
    return addSortByInternal('registry', Sort.asc);
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QAfterSortBy> thenByRegistryDesc() {
    return addSortByInternal('registry', Sort.desc);
  }
}

extension EnsIsarModelQueryWhereDistinct
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QDistinct> {
  QueryBuilder<EnsIsarModel, EnsIsarModel, QDistinct> distinctById() {
    return addDistinctByInternal('id');
  }

  QueryBuilder<EnsIsarModel, EnsIsarModel, QDistinct> distinctByRegistry(
      {bool caseSensitive = true}) {
    return addDistinctByInternal('registry', caseSensitive: caseSensitive);
  }
}

extension EnsIsarModelQueryProperty
    on QueryBuilder<EnsIsarModel, EnsIsarModel, QQueryProperty> {
  QueryBuilder<EnsIsarModel, int?, QQueryOperations> idProperty() {
    return addPropertyNameInternal('id');
  }

  QueryBuilder<EnsIsarModel, String, QQueryOperations> registryProperty() {
    return addPropertyNameInternal('registry');
  }
}
